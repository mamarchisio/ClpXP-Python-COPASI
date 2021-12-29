#! /usr/bin/python
import sys
import re
import os

from libsbml import *

ns=SBMLNamespaces(3, 1, "comp", 1)
document_tu = SBMLDocument(ns)                 # Creating an SBMLDocument 
plugin_document_tu=document_tu.getPlugin("comp")
plugin_document_tu.setRequired(True)

## TU_GFP transcription unit (nucleus)
#   Tsynth8.1_pCYC1noTATA-yEGFP_ssrA-CYC1t
#   input: Pol II          
#   output: mRNA_GFP
#
## reactions
# pre_mRNA_GFP synthesis
# pre_mRNA_GFP degradation         
# mRNA maturation and transport


TU_GFP=plugin_document_tu.createModelDefinition()
TU_GFP.setId("TU_GFP")
TU_GFP.setName("TU_GFP")

# Creating the nucleus compartment for TU_GFP
nucleus=TU_GFP.createCompartment()
nucleus.setId("nucleus")
nucleus.setSpatialDimensions(3)
nucleus.setConstant(True)
nucleus.setSize(2.9e-15)
nucleus.setUnits('litre')

# Input species Pol_II (RNA polymerase II). Pol_II is replaced by Pol_II in the cell model
Pol_II=TU_GFP.createSpecies()
Pol_II.setId('Pol_II')
Pol_II.setCompartment('nucleus')
Pol_II.setConstant(False)               
Pol_II.setSubstanceUnits('mole')
Pol_II.setInitialConcentration(0)
Pol_II.setBoundaryCondition(False)
Pol_II.setHasOnlySubstanceUnits(False)  

# Species: pTs8 
pTs8=TU_GFP.createSpecies()
pTs8.setId('pTs8')
pTs8.setCompartment('nucleus')
pTs8.setConstant(False)               
pTs8.setSubstanceUnits('mole')
pTs8.setInitialConcentration(5.73e-10)
pTs8.setBoundaryCondition(False)
pTs8.setHasOnlySubstanceUnits(False)  

# Species pm_GFP (premRNA_GFP)
pm_GFP=TU_GFP.createSpecies()
pm_GFP.setId('pm_GFP')
pm_GFP.setCompartment('nucleus')
pm_GFP.setConstant(False)               
pm_GFP.setSubstanceUnits('mole')
pm_GFP.setInitialConcentration(0)
pm_GFP.setBoundaryCondition(False)
pm_GFP.setHasOnlySubstanceUnits(False)  

# Species mRNA_GFP, mature mRNA
mRNA_GFP=TU_GFP.createSpecies()
mRNA_GFP.setId('mRNA_GFP')
mRNA_GFP.setCompartment('cytoplasm') 
mRNA_GFP.setConstant(False)               
mRNA_GFP.setSubstanceUnits('mole')
mRNA_GFP.setInitialConcentration(0)
mRNA_GFP.setBoundaryCondition(False)
mRNA_GFP.setHasOnlySubstanceUnits(False)  

# REACTION: Pol_II + pTs8 <-> [Pol_II-pTs8] -> Pol_II + pTs8 + pm_GFP  
reaction1=TU_GFP.createReaction()
reaction1.setReversible(False)
reaction1.setFast(False)
reaction1.setId('reaction1')

reaction1_r1 = reaction1.createReactant()
reaction1_r1.setSpecies('Pol_II')
reaction1_r1.setStoichiometry(1)
reaction1_r1.setConstant(False)

reaction1_r2 = reaction1.createReactant()
reaction1_r2.setSpecies('pTs8')
reaction1_r2.setStoichiometry(1)
reaction1_r2.setConstant(False)

reaction1_p1 = reaction1.createProduct()
reaction1_p1.setSpecies('Pol_II')
reaction1_p1.setStoichiometry(1)
reaction1_p1.setConstant(False)  

reaction1_p2 = reaction1.createProduct()
reaction1_p2.setSpecies('pTs8')
reaction1_p2.setStoichiometry(1)
reaction1_p2.setConstant(False)  

reaction1_p3 = reaction1.createProduct()
reaction1_p3.setSpecies('pm_GFP')
reaction1_p3.setStoichiometry(1)
reaction1_p3.setConstant(False)  

k2=TU_GFP.createParameter()   # pTs8 transcription initiation rate-constant
k2.setId('k2')
k2.setConstant(True)
k2.setValue(2.17E-01)

km=TU_GFP.createParameter()   # Hill constant
km.setId('km')
km.setConstant(True)
km.setValue(1e-7)

# kinetic law 
# dpm_GFP/dt = nucleus * k2 * pTs8 * (PolII/km)/(1 + PolII/km)'
kinetics_reaction1 = reaction1.createKineticLaw()
math_reaction1 = parseL3Formula('nucleus * k2 * pTs8 * (Pol_II/km)/(1+(Pol_II/km))')
kinetics_reaction1.setMath(math_reaction1)


# REACTION: pm_GFP maturation and transport; pm_GFP -> mRNA (kmt)
# IMPORTANT: V_cytoplasm * dmRNA/dt = kmt*V_nucleus*pm_GFP-kdm*V_cytoplasm*mRNA; V_nucleus shall be included into the kinetic law otherwise the concentrations of mRNA and pm_GFP are calculated wrongly in COPASI
reaction2=TU_GFP.createReaction()
reaction2.setReversible(False)
reaction2.setFast(False)
reaction2.setId('reaction2')

reaction2_r1 = reaction2.createReactant()
reaction2_r1.setSpecies('pm_GFP')
reaction2_r1.setStoichiometry(1)
reaction2_r1.setConstant(False)

reaction2_p1 = reaction2.createProduct()
reaction2_p1.setSpecies('mRNA_GFP')
reaction2_p1.setStoichiometry(1)
reaction2_p1.setConstant(False)  

kmt=TU_GFP.createParameter()   # maturation and transport rate-constant
kmt.setId('kmt')
kmt.setConstant(True)
kmt.setValue(5.5e-4)

# kinetic law for reaction2
kinetics_reaction2 = reaction2.createKineticLaw()
math_reaction2 = parseL3Formula('nucleus * kmt * pm_GFP')
kinetics_reaction2.setMath(math_reaction2)

# REACTION: pm_GFP degradation. pm_GFP ->  (kd)
reaction3=TU_GFP.createReaction()
reaction3.setReversible(False)
reaction3.setFast(False)
reaction3.setId('reaction3')

reaction3_r1 = reaction3.createReactant()
reaction3_r1.setSpecies('pm_GFP')
reaction3_r1.setStoichiometry(1)
reaction3_r1.setConstant(False)

kd=TU_GFP.createParameter()   # pre-mRNA decay rate
kd.setId('kd')
kd.setConstant(True)
kd.setValue(5.7e-4)

# kinetic law for reaction3
kinetics_reaction3 = reaction3.createKineticLaw()
math_reaction3 = parseL3Formula('nucleus * kd * pm_GFP')
kinetics_reaction3.setMath(math_reaction3)

######
# Defining Ports
plugin_TU_GFP=TU_GFP.getPlugin("comp")
port_Pol_II=plugin_TU_GFP.createPort()
port_Pol_II.setId("port_Pol_II")
port_Pol_II.setIdRef("Pol_II")      # one TU_GFP port is associated with the species Pol_II

port_mRNA_GFP=plugin_TU_GFP.createPort()
port_mRNA_GFP.setId("port_mRNA_GFP")
port_mRNA_GFP.setIdRef("mRNA_GFP")          # the other TU_GFP port is associated with the species mRNA_GFP

writeSBMLToFile(document_tu,'TU_GFP.xml')

###### pool_mRNA_GFP
# Protein synthesis: we can suppose that every protein in this model, among which GFP, stays in the cytoplasm. 
#   input: rib, mRNA_GFP
#   output: GFP
#   rib + mRNA_GFP <-> [rib-mRNA_GFP] -> rib + mRNA_GFP + GFP
#   mRNA_GFP ->
######

document_pool_mRNA_GFP = SBMLDocument(ns)                 # Creating an SBMLDocument 
plugin_document_pool_mRNA_GFP=document_pool_mRNA_GFP.getPlugin("comp")
plugin_document_pool_mRNA_GFP.setRequired(True)

pool_mRNA_GFP=plugin_document_pool_mRNA_GFP.createModelDefinition()
pool_mRNA_GFP.setId("pool_mRNA_GFP")
pool_mRNA_GFP.setName("pool_mRNA_GFP")

# Creating the cytoplasm compartment for the mRNA
cytoplasm=pool_mRNA_GFP.createCompartment()
cytoplasm.setId("cytoplasm")
cytoplasm.setSpatialDimensions(3)
cytoplasm.setConstant(True)
cytoplasm.setSize(39.1e-15)
cytoplasm.setUnits('litre')

# Input species rib (ribosome), will be replaced by rib into the cytoplasm
rib=pool_mRNA_GFP.createSpecies()
rib.setId('rib')
rib.setCompartment('cytoplasm')
rib.setConstant(False)
rib.setInitialConcentration(0)
rib.setSubstanceUnits('mole')
rib.setBoundaryCondition(False)
rib.setHasOnlySubstanceUnits(False)  

# Input species mRNA_GFP, will be replaced by the species mRNA produced in the nucleus
mRNA_GFP=pool_mRNA_GFP.createSpecies()
mRNA_GFP.setId('mRNA_GFP')
mRNA_GFP.setCompartment('cytoplasm')
mRNA_GFP.setConstant(False)
mRNA_GFP.setInitialConcentration(0)
mRNA_GFP.setSubstanceUnits('mole')
mRNA_GFP.setBoundaryCondition(False)
mRNA_GFP.setHasOnlySubstanceUnits(False)  

# Species GFP
GFP=pool_mRNA_GFP.createSpecies()
GFP.setId('GFP')
GFP.setCompartment('cytoplasm')
GFP.setConstant(False)               
GFP.setSubstanceUnits('mole')
GFP.setInitialConcentration(0)
GFP.setBoundaryCondition(False)
GFP.setHasOnlySubstanceUnits(False)


# REACTION: GFP generation 
reaction1=pool_mRNA_GFP.createReaction()
reaction1.setReversible(False)
reaction1.setFast(False)
reaction1.setId('reaction1')

reaction1_r1 = reaction1.createReactant()
reaction1_r1.setSpecies('rib')
reaction1_r1.setStoichiometry(1)
reaction1_r1.setConstant(False)

reaction1_r2 = reaction1.createReactant()
reaction1_r2.setSpecies('mRNA_GFP')
reaction1_r2.setStoichiometry(1)
reaction1_r2.setConstant(False)

reaction1_p1 = reaction1.createProduct()
reaction1_p1.setSpecies('rib')
reaction1_p1.setStoichiometry(1)
reaction1_p1.setConstant(False)  

reaction1_p2 = reaction1.createProduct()
reaction1_p2.setSpecies('mRNA_GFP')
reaction1_p2.setStoichiometry(1)
reaction1_p2.setConstant(False)  

reaction1_p3 = reaction1.createProduct()
reaction1_p3.setSpecies('GFP')
reaction1_p3.setStoichiometry(1)
reaction1_p3.setConstant(False)  

k2r=pool_mRNA_GFP.createParameter()      # translation initiation rate at mRNA
k2r.setId('k2r')
k2r.setConstant(True)
k2r.setValue(0.02)

kmr=pool_mRNA_GFP.createParameter()      # Hill constant   
kmr.setId('kmr')
kmr.setConstant(True)
kmr.setValue(1e-7)

# kinetic law 
kinetics_reaction1 = reaction1.createKineticLaw()
math_reaction1 = parseL3Formula('cytoplasm * k2r * mRNA_GFP * (rib/kmr)/(1 + (rib/kmr))')
kinetics_reaction1.setMath(math_reaction1)


#REACTION: mRNA degradation; mRNA_GFP  ->   (kd)
reaction2=pool_mRNA_GFP.createReaction()
reaction2.setReversible(False)
reaction2.setFast(False)
reaction2.setId('reaction2')

reaction2_r1 = reaction2.createReactant()
reaction2_r1.setSpecies('mRNA_GFP')
reaction2_r1.setStoichiometry(1)
reaction2_r1.setConstant(False)

kd=pool_mRNA_GFP.createParameter()
kd.setId('kd')
kd.setConstant(True)
kd.setValue(5.7e-4)

# kinetic law 
kinetics_reaction2 = reaction2.createKineticLaw()
math_reaction2 = parseL3Formula('cytoplasm * kd * mRNA_GFP')
kinetics_reaction2.setMath(math_reaction2)


# Defining Ports
plugin_pool_mRNA_GFP=pool_mRNA_GFP.getPlugin("comp")
port_rib=plugin_pool_mRNA_GFP.createPort()
port_rib.setId("port_rib")
port_rib.setIdRef("rib")        # one pool_mRNA_GFP port is associated with the species rib

port_mRNA_GFP=plugin_pool_mRNA_GFP.createPort()
port_mRNA_GFP.setId("port_mRNA_GFP")
port_mRNA_GFP.setIdRef("mRNA_GFP")      # another mRNA_GFP port is associated with the species mRNA

port_GFP=plugin_pool_mRNA_GFP.createPort()
port_GFP.setId("port_GFP")
port_GFP.setIdRef("GFP")      # another pool_mRNA_GFP port is associated with the species GFP

writeSBMLToFile(document_pool_mRNA_GFP,'pool_mRNA_GFP.xml')

