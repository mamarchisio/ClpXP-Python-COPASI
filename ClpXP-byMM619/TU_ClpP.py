#! /usr/bin/python
import sys
import re
import os

from libsbml import *

ns=SBMLNamespaces(3, 1, "comp", 1)
document_tu = SBMLDocument(ns)                 # Creating an SBMLDocument 
plugin_document_tu=document_tu.getPlugin("comp")
plugin_document_tu.setRequired(True)

## TU_ClpP transcription unit (nucleus)
#   pGPD-Flagtag-ClpP-Tsynth16
#   input: Pol II          
#   output: mRNA_ClpP
#
## reactions
# pre_mRNA_ClpP synthesis
# pre_mRNA_ClpP degradation  (k_d)          
# mRNA maturation and transport  (kmt)


TU_ClpP=plugin_document_tu.createModelDefinition()
TU_ClpP.setId("TU_ClpP")
TU_ClpP.setName("TU_ClpP")

# Creating the nucleus compartment for TU_ClpP
nucleus=TU_ClpP.createCompartment()
nucleus.setId("nucleus")
nucleus.setSpatialDimensions(3)
nucleus.setConstant(True)
nucleus.setSize(2.9e-15)
nucleus.setUnits('litre')

# Input species Pol_II (RNA polymerase II). Pol_II is replaced by Pol_II in the cell model
Pol_II=TU_ClpP.createSpecies()
Pol_II.setId('Pol_II')
Pol_II.setCompartment('nucleus')
Pol_II.setConstant(False)               
Pol_II.setSubstanceUnits('mole')
Pol_II.setInitialConcentration(0)
Pol_II.setBoundaryCondition(False)
Pol_II.setHasOnlySubstanceUnits(False)  

# Species: pGPD (inducible promoter)
pGPD=TU_ClpP.createSpecies()
pGPD.setId('pGPD')
pGPD.setCompartment('nucleus')
pGPD.setConstant(False)               
pGPD.setSubstanceUnits('mole')
pGPD.setInitialConcentration(5.73e-10)
pGPD.setBoundaryCondition(False)
pGPD.setHasOnlySubstanceUnits(False)  

# Species pm_ClpP (premRNA_ClpP)
pm_ClpP=TU_ClpP.createSpecies()
pm_ClpP.setId('pm_ClpP')
pm_ClpP.setCompartment('nucleus')
pm_ClpP.setConstant(False)               
pm_ClpP.setSubstanceUnits('mole')
pm_ClpP.setInitialConcentration(0)
pm_ClpP.setBoundaryCondition(False)
pm_ClpP.setHasOnlySubstanceUnits(False)  

# Species mRNA_ClpP, mature mRNA
mRNA_ClpP=TU_ClpP.createSpecies()
mRNA_ClpP.setId('mRNA_ClpP')
mRNA_ClpP.setCompartment('cytoplasm') 
mRNA_ClpP.setConstant(False)               
mRNA_ClpP.setSubstanceUnits('mole')
mRNA_ClpP.setInitialConcentration(0)
mRNA_ClpP.setBoundaryCondition(False)
mRNA_ClpP.setHasOnlySubstanceUnits(False)  

# REACTION: Pol_II + pGPD <-> [Pol_II-pGPD] -> Pol_II + pGPD + pm_ClpP  (k2, km)
reaction1=TU_ClpP.createReaction()
reaction1.setReversible(False)
reaction1.setFast(False)
reaction1.setId('reaction1')

reaction1_r1 = reaction1.createReactant()
reaction1_r1.setSpecies('Pol_II')
reaction1_r1.setStoichiometry(1)
reaction1_r1.setConstant(False)

reaction1_r2 = reaction1.createReactant()
reaction1_r2.setSpecies('pGPD')
reaction1_r2.setStoichiometry(1)
reaction1_r2.setConstant(False)

reaction1_p1 = reaction1.createProduct()
reaction1_p1.setSpecies('Pol_II')
reaction1_p1.setStoichiometry(1)
reaction1_p1.setConstant(False)  

reaction1_p2 = reaction1.createProduct()
reaction1_p2.setSpecies('pGPD')
reaction1_p2.setStoichiometry(1)
reaction1_p2.setConstant(False)  

reaction1_p3 = reaction1.createProduct()
reaction1_p3.setSpecies('pm_ClpP')
reaction1_p3.setStoichiometry(1)
reaction1_p3.setConstant(False)  

k2=TU_ClpP.createParameter()   # pGPD transcription initiation rate-constant
k2.setId('k2')
k2.setConstant(True)
k2.setValue(1.51)

km=TU_ClpP.createParameter()   # Hill constant
km.setId('km')
km.setConstant(True)
km.setValue(1e-7)

# kinetic law for reaction1
# d pm_ClpP/dt = nucleus * k2 * pGPD * (PolII/km)/(1 + PolII/km)'
kinetics_reaction1 = reaction1.createKineticLaw()
math_reaction1 = parseL3Formula('nucleus * k2 * pGPD * (Pol_II/km)/(1+(Pol_II/km))')
kinetics_reaction1.setMath(math_reaction1)


# REACTION: pm_ClpP maturation and transport; pm_ClpP -> mRNA (kmt)
# IMPORTANT: V_cytoplasm * dmRNA/dt = kmt*V_nucleus*pm_ClpP-kdm*V_cytoplasm*mRNA; V_nucleus shall be included into the kinetic law otherwise the concentrations of mRNA and pm_ClpP are calculated wrongly in COPASI
reaction2=TU_ClpP.createReaction()
reaction2.setReversible(False)
reaction2.setFast(False)
reaction2.setId('reaction2')

reaction2_r1 = reaction2.createReactant()
reaction2_r1.setSpecies('pm_ClpP')
reaction2_r1.setStoichiometry(1)
reaction2_r1.setConstant(False)

reaction2_p1 = reaction2.createProduct()
reaction2_p1.setSpecies('mRNA_ClpP')
reaction2_p1.setStoichiometry(1)
reaction2_p1.setConstant(False)  

kmt=TU_ClpP.createParameter()   # maturation and transport rate-constant
kmt.setId('kmt')
kmt.setConstant(True)
kmt.setValue(5.5e-4)

# kinetic law for reaction2
kinetics_reaction2 = reaction2.createKineticLaw()
math_reaction2 = parseL3Formula('nucleus * kmt * pm_ClpP')
kinetics_reaction2.setMath(math_reaction2)

# REACTION: pm_ClpP degradation. pm_ClpP ->  (kd)
reaction3=TU_ClpP.createReaction()
reaction3.setReversible(False)
reaction3.setFast(False)
reaction3.setId('reaction3')

reaction3_r1 = reaction3.createReactant()
reaction3_r1.setSpecies('pm_ClpP')
reaction3_r1.setStoichiometry(1)
reaction3_r1.setConstant(False)

kd=TU_ClpP.createParameter()   # pre-mRNA decay rate
kd.setId('kd')
kd.setConstant(True)
kd.setValue(5.7e-4)

# kinetic law for reaction3
kinetics_reaction3 = reaction3.createKineticLaw()
math_reaction3 = parseL3Formula('nucleus * kd * pm_ClpP')
kinetics_reaction3.setMath(math_reaction3)

######
# Defining Ports
plugin_TU_ClpP=TU_ClpP.getPlugin("comp")
port_Pol_II=plugin_TU_ClpP.createPort()
port_Pol_II.setId("port_Pol_II")
port_Pol_II.setIdRef("Pol_II")      # one TU_ClpP port is associated with the species Pol_II

port_mRNA_ClpP=plugin_TU_ClpP.createPort()
port_mRNA_ClpP.setId("port_mRNA_ClpP")
port_mRNA_ClpP.setIdRef("mRNA_ClpP")          # the other TU_ClpP port is associated with the species mRNA_ClpP

writeSBMLToFile(document_tu,'TU_ClpP.xml')

###### pool_mRNA_ClpP
# Protein synthesis: we can suppose that every protein in this model, among which ClpP, stays in the cytoplasm. 
#   input: rib, mRNA_ClpP
#   output: ClpP
#   rib + mRNA_ClpP <-> [rib-mRNA_ClpP] -> rib + mRNA_ClpP + ClpP
#   mRNA_ClpP ->
######

document_pool_mRNA_ClpP = SBMLDocument(ns)                 # Creating an SBMLDocument 
plugin_document_pool_mRNA_ClpP=document_pool_mRNA_ClpP.getPlugin("comp")
plugin_document_pool_mRNA_ClpP.setRequired(True)

pool_mRNA_ClpP=plugin_document_pool_mRNA_ClpP.createModelDefinition()
pool_mRNA_ClpP.setId("pool_mRNA_ClpP")
pool_mRNA_ClpP.setName("pool_mRNA_ClpP")

# Creating the cytoplasm compartment for the mRNA
cytoplasm=pool_mRNA_ClpP.createCompartment()
cytoplasm.setId("cytoplasm")
cytoplasm.setSpatialDimensions(3)
cytoplasm.setConstant(True)
cytoplasm.setSize(39.1e-15)
cytoplasm.setUnits('litre')

# Input species rib (ribosome), will be replaced by rib into the cytoplasm
rib=pool_mRNA_ClpP.createSpecies()
rib.setId('rib')
rib.setCompartment('cytoplasm')
rib.setConstant(False)
rib.setInitialConcentration(0)
rib.setSubstanceUnits('mole')
rib.setBoundaryCondition(False)
rib.setHasOnlySubstanceUnits(False)  

# Input species mRNA, will be replaced by the species mRNA produced in the nucleus
mRNA_ClpP=pool_mRNA_ClpP.createSpecies()
mRNA_ClpP.setId('mRNA_ClpP')
mRNA_ClpP.setCompartment('cytoplasm')
mRNA_ClpP.setConstant(False)
mRNA_ClpP.setInitialConcentration(0)
mRNA_ClpP.setSubstanceUnits('mole')
mRNA_ClpP.setBoundaryCondition(False)
mRNA_ClpP.setHasOnlySubstanceUnits(False)  

# Species ClpP
ClpP=pool_mRNA_ClpP.createSpecies()
ClpP.setId('ClpP')
ClpP.setCompartment('cytoplasm')
ClpP.setConstant(False)               
ClpP.setSubstanceUnits('mole')
ClpP.setInitialConcentration(0)
ClpP.setBoundaryCondition(False)
ClpP.setHasOnlySubstanceUnits(False)


# REACTION: ClpP generation  
reaction1=pool_mRNA_ClpP.createReaction()
reaction1.setReversible(False)
reaction1.setFast(False)
reaction1.setId('reaction1')

reaction1_r1 = reaction1.createReactant()
reaction1_r1.setSpecies('rib')
reaction1_r1.setStoichiometry(1)
reaction1_r1.setConstant(False)

reaction1_r2 = reaction1.createReactant()
reaction1_r2.setSpecies('mRNA_ClpP')
reaction1_r2.setStoichiometry(1)
reaction1_r2.setConstant(False)

reaction1_p1 = reaction1.createProduct()
reaction1_p1.setSpecies('rib')
reaction1_p1.setStoichiometry(1)
reaction1_p1.setConstant(False)  

reaction1_p2 = reaction1.createProduct()
reaction1_p2.setSpecies('mRNA_ClpP')
reaction1_p2.setStoichiometry(1)
reaction1_p2.setConstant(False)  

reaction1_p3 = reaction1.createProduct()
reaction1_p3.setSpecies('ClpP')
reaction1_p3.setStoichiometry(1)
reaction1_p3.setConstant(False)  

k2r=pool_mRNA_ClpP.createParameter()      # translation initiation rate 
k2r.setId('k2r')
k2r.setConstant(True)
k2r.setValue(0.02)

kmr=pool_mRNA_ClpP.createParameter()      # Hill constant   
kmr.setId('kmr')
kmr.setConstant(True)
kmr.setValue(1e-7)

# kinetic law 
kinetics_reaction1 = reaction1.createKineticLaw()
math_reaction1 = parseL3Formula('cytoplasm * k2r * mRNA_ClpP * (rib/kmr)/(1 + (rib/kmr))')
kinetics_reaction1.setMath(math_reaction1)


#REACTION: mRNA degradation; mRNA_ClpP  ->   (kd)
reaction2=pool_mRNA_ClpP.createReaction()
reaction2.setReversible(False)
reaction2.setFast(False)
reaction2.setId('reaction2')

reaction2_r1 = reaction2.createReactant()
reaction2_r1.setSpecies('mRNA_ClpP')
reaction2_r1.setStoichiometry(1)
reaction2_r1.setConstant(False)

kd=pool_mRNA_ClpP.createParameter()
kd.setId('kd')
kd.setConstant(True)
kd.setValue(5.7e-4)

# kinetic law 
kinetics_reaction2 = reaction2.createKineticLaw()
math_reaction2 = parseL3Formula('cytoplasm * kd * mRNA_ClpP')
kinetics_reaction2.setMath(math_reaction2)


# Defining Ports
plugin_pool_mRNA_ClpP=pool_mRNA_ClpP.getPlugin("comp")
port_rib=plugin_pool_mRNA_ClpP.createPort()
port_rib.setId("port_rib")
port_rib.setIdRef("rib")        # one pool_mRNA_ClpP port is associated with the species rib

port_mRNA_ClpP=plugin_pool_mRNA_ClpP.createPort()
port_mRNA_ClpP.setId("port_mRNA_ClpP")
port_mRNA_ClpP.setIdRef("mRNA_ClpP")      # another mRNA_ClpP port is associated with the species mRNA

port_ClpP=plugin_pool_mRNA_ClpP.createPort()
port_ClpP.setId("port_ClpP")
port_ClpP.setIdRef("ClpP")      # another pool_mRNA_ClpP port is associated with the species Ra_A

writeSBMLToFile(document_pool_mRNA_ClpP,'pool_mRNA_ClpP.xml')

