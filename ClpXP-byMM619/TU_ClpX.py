#! /usr/bin/python
import sys
import re
import os

from libsbml import *

ns=SBMLNamespaces(3, 1, "comp", 1)
document_tu = SBMLDocument(ns)                 # Creating an SBMLDocument 
plugin_document_tu=document_tu.getPlugin("comp")
plugin_document_tu.setRequired(True)

## TU_ClpX transcription unit (nucleus)
#   pGAL1-ClpX-Tsynth15
#   input: galactose (fake species in the model, k2 shall be set to 3.59E-03 in the presence of glucose)
#           Pol II 
#   output: mRNA_ClpX
## reactions
# pre_mRNA_ClpX synthesis: induced by the presence of galactose
# pre_mRNA_ClpX degradation
# mRNA maturation and transport


TU_ClpX=plugin_document_tu.createModelDefinition()
TU_ClpX.setId("TU_ClpX")
TU_ClpX.setName("TU_ClpX")

# Creating the nucleus compartment for TU_ClpX
nucleus=TU_ClpX.createCompartment()
nucleus.setId("nucleus")
nucleus.setSpatialDimensions(3)
nucleus.setConstant(True)
nucleus.setSize(2.9e-15)
nucleus.setUnits('litre')

# Input species Pol_II (RNA polymerase II). Pol_II is replaced by Pol_II in the cell model
Pol_II=TU_ClpX.createSpecies()
Pol_II.setId('Pol_II')
Pol_II.setCompartment('nucleus')
Pol_II.setConstant(False)               
Pol_II.setSubstanceUnits('mole')
Pol_II.setInitialConcentration(0)
Pol_II.setBoundaryCondition(False)
Pol_II.setHasOnlySubstanceUnits(False)  

# Species: pGAL1 (inducible promoter)
pGAL1=TU_ClpX.createSpecies()
pGAL1.setId('pGAL1')
pGAL1.setCompartment('nucleus')
pGAL1.setConstant(False)               
pGAL1.setSubstanceUnits('mole')
pGAL1.setInitialConcentration(5.73e-10)
pGAL1.setBoundaryCondition(False)
pGAL1.setHasOnlySubstanceUnits(False)  

# Species pm_ClpX (premRNA_ClpX)
pm_ClpX=TU_ClpX.createSpecies()
pm_ClpX.setId('pm_ClpX')
pm_ClpX.setCompartment('nucleus')
pm_ClpX.setConstant(False)               
pm_ClpX.setSubstanceUnits('mole')
pm_ClpX.setInitialConcentration(0)
pm_ClpX.setBoundaryCondition(False)
pm_ClpX.setHasOnlySubstanceUnits(False)  

# Species mRNA_ClpX, mature mRNA
mRNA_ClpX=TU_ClpX.createSpecies()
mRNA_ClpX.setId('mRNA_ClpX')
mRNA_ClpX.setCompartment('cytoplasm') 
mRNA_ClpX.setConstant(False)               
mRNA_ClpX.setSubstanceUnits('mole')
mRNA_ClpX.setInitialConcentration(0)
mRNA_ClpX.setBoundaryCondition(False)
mRNA_ClpX.setHasOnlySubstanceUnits(False)  

# REACTION: Pol_II + pGAL1 <-> [Pol_II-pGAL1] -> Pol_II + pGAL1 + pm_ClpX  
reaction1=TU_ClpX.createReaction()
reaction1.setReversible(False)
reaction1.setFast(False)
reaction1.setId('reaction1')

reaction1_r1 = reaction1.createReactant()
reaction1_r1.setSpecies('Pol_II')
reaction1_r1.setStoichiometry(1)
reaction1_r1.setConstant(False)

reaction1_r2 = reaction1.createReactant()
reaction1_r2.setSpecies('pGAL1')
reaction1_r2.setStoichiometry(1)
reaction1_r2.setConstant(False)

reaction1_p1 = reaction1.createProduct()
reaction1_p1.setSpecies('Pol_II')
reaction1_p1.setStoichiometry(1)
reaction1_p1.setConstant(False)  

reaction1_p2 = reaction1.createProduct()
reaction1_p2.setSpecies('pGAL1')
reaction1_p2.setStoichiometry(1)
reaction1_p2.setConstant(False)  

reaction1_p3 = reaction1.createProduct()
reaction1_p3.setSpecies('pm_ClpX')
reaction1_p3.setStoichiometry(1)
reaction1_p3.setConstant(False)  

k2=TU_ClpX.createParameter()   # pGAL1 transcription initiation rate-constant
k2.setId('k2')
k2.setConstant(True)
k2.setValue(1.39)

km=TU_ClpX.createParameter()   # HIll constant
km.setId('km')
km.setConstant(True)
km.setValue(1e-7)

# kinetic law for reaction1
# dpm_ClpX/dt = nucleus * k2 * pGAL1 * (PolII/km)/(1 + PolII/km)'
kinetics_reaction1 = reaction1.createKineticLaw()
math_reaction1 = parseL3Formula('nucleus * k2 * pGAL1 * (Pol_II/km)/(1+(Pol_II/km))')
kinetics_reaction1.setMath(math_reaction1)


# REACTION: pm_ClpX maturation and transport; pm_ClpX -> mRNA (kmt)
# IMPORTANT: V_cytoplasm * dmRNA/dt = kmt*V_nucleus*pm_ClpX-kdm*V_cytoplasm*mRNA; V_nucleus shall be included into the kinetic law otherwise the concentrations of mRNA and pm_ClpX are calculated wrongly in COPASI
reaction2=TU_ClpX.createReaction()
reaction2.setReversible(False)
reaction2.setFast(False)
reaction2.setId('reaction2')

reaction2_r1 = reaction2.createReactant()
reaction2_r1.setSpecies('pm_ClpX')
reaction2_r1.setStoichiometry(1)
reaction2_r1.setConstant(False)

reaction2_p1 = reaction2.createProduct()
reaction2_p1.setSpecies('mRNA_ClpX')
reaction2_p1.setStoichiometry(1)
reaction2_p1.setConstant(False)  

kmt=TU_ClpX.createParameter()   # maturation and transport rate-constant
kmt.setId('kmt')
kmt.setConstant(True)
kmt.setValue(5.5e-4)

# kinetic law for reaction2
kinetics_reaction2 = reaction2.createKineticLaw()
math_reaction2 = parseL3Formula('nucleus * kmt * pm_ClpX')
kinetics_reaction2.setMath(math_reaction2)

# REACTION: pm_ClpX degradation. pm_ClpX ->  (kd)
reaction3=TU_ClpX.createReaction()
reaction3.setReversible(False)
reaction3.setFast(False)
reaction3.setId('reaction3')

reaction3_r1 = reaction3.createReactant()
reaction3_r1.setSpecies('pm_ClpX')
reaction3_r1.setStoichiometry(1)
reaction3_r1.setConstant(False)

kd=TU_ClpX.createParameter()   # pre-mRNA decay rate
kd.setId('kd')
kd.setConstant(True)
kd.setValue(5.7e-4)

# kinetic law for reaction3
kinetics_reaction3 = reaction3.createKineticLaw()
math_reaction3 = parseL3Formula('nucleus * kd * pm_ClpX')
kinetics_reaction3.setMath(math_reaction3)

######
# Defining Ports
plugin_TU_ClpX=TU_ClpX.getPlugin("comp")
port_Pol_II=plugin_TU_ClpX.createPort()
port_Pol_II.setId("port_Pol_II")
port_Pol_II.setIdRef("Pol_II")      # one TU_ClpX port is associated with the species Pol_II

port_mRNA_ClpX=plugin_TU_ClpX.createPort()
port_mRNA_ClpX.setId("port_mRNA_ClpX")
port_mRNA_ClpX.setIdRef("mRNA_ClpX")          # the other TU_ClpX port is associated with the species mRNA_ClpX

writeSBMLToFile(document_tu,'TU_ClpX.xml')

###### pool_mRNA_ClpX
# Protein synthesis: we can suppose that every protein in this model, among which ClpX, stays in the cytoplasm. 
#   input: rib, mRNA_ClpX
#   output: ClpX
#   rib + mRNA_ClpX <-> [rib-mRNA_ClpX] -> rib + mRNA_ClpX + ClpX
#   mRNA_ClpX ->
######

document_pool_mRNA_ClpX = SBMLDocument(ns)                 # Creating an SBMLDocument 
plugin_document_pool_mRNA_ClpX=document_pool_mRNA_ClpX.getPlugin("comp")
plugin_document_pool_mRNA_ClpX.setRequired(True)

pool_mRNA_ClpX=plugin_document_pool_mRNA_ClpX.createModelDefinition()
pool_mRNA_ClpX.setId("pool_mRNA_ClpX")
pool_mRNA_ClpX.setName("pool_mRNA_ClpX")

# Creating the cytoplasm compartment for the mRNA
cytoplasm=pool_mRNA_ClpX.createCompartment()
cytoplasm.setId("cytoplasm")
cytoplasm.setSpatialDimensions(3)
cytoplasm.setConstant(True)
cytoplasm.setSize(39.1e-15)
cytoplasm.setUnits('litre')

# Input species rib (ribosome), will be replaced by rib into the cytoplasm
rib=pool_mRNA_ClpX.createSpecies()
rib.setId('rib')
rib.setCompartment('cytoplasm')
rib.setConstant(False)
rib.setInitialConcentration(0)
rib.setSubstanceUnits('mole')
rib.setBoundaryCondition(False)
rib.setHasOnlySubstanceUnits(False)  

# Input species mRNA, will be replaced by the species mRNA produced in the nucleus
mRNA_ClpX=pool_mRNA_ClpX.createSpecies()
mRNA_ClpX.setId('mRNA_ClpX')
mRNA_ClpX.setCompartment('cytoplasm')
mRNA_ClpX.setConstant(False)
mRNA_ClpX.setInitialConcentration(0)
mRNA_ClpX.setSubstanceUnits('mole')
mRNA_ClpX.setBoundaryCondition(False)
mRNA_ClpX.setHasOnlySubstanceUnits(False)  

# Species ClpX
ClpX=pool_mRNA_ClpX.createSpecies()
ClpX.setId('ClpX')
ClpX.setCompartment('cytoplasm')
ClpX.setConstant(False)               
ClpX.setSubstanceUnits('mole')
ClpX.setInitialConcentration(0)
ClpX.setBoundaryCondition(False)
ClpX.setHasOnlySubstanceUnits(False)


# REACTION: ClpX generation 
reaction1=pool_mRNA_ClpX.createReaction()
reaction1.setReversible(False)
reaction1.setFast(False)
reaction1.setId('reaction1')

reaction1_r1 = reaction1.createReactant()
reaction1_r1.setSpecies('rib')
reaction1_r1.setStoichiometry(1)
reaction1_r1.setConstant(False)

reaction1_r2 = reaction1.createReactant()
reaction1_r2.setSpecies('mRNA_ClpX')
reaction1_r2.setStoichiometry(1)
reaction1_r2.setConstant(False)

reaction1_p1 = reaction1.createProduct()
reaction1_p1.setSpecies('rib')
reaction1_p1.setStoichiometry(1)
reaction1_p1.setConstant(False)  

reaction1_p2 = reaction1.createProduct()
reaction1_p2.setSpecies('mRNA_ClpX')
reaction1_p2.setStoichiometry(1)
reaction1_p2.setConstant(False)  

reaction1_p3 = reaction1.createProduct()
reaction1_p3.setSpecies('ClpX')
reaction1_p3.setStoichiometry(1)
reaction1_p3.setConstant(False)  

k2r=pool_mRNA_ClpX.createParameter()      # translation initiation rate 
k2r.setId('k2r')
k2r.setConstant(True)
k2r.setValue(0.02)

kmr=pool_mRNA_ClpX.createParameter()      # Hill constant   
kmr.setId('kmr')
kmr.setConstant(True)
kmr.setValue(1e-7)

# kinetic law for re3
kinetics_reaction1 = reaction1.createKineticLaw()
math_reaction1 = parseL3Formula('cytoplasm * k2r * mRNA_ClpX * (rib/kmr)/(1 + (rib/kmr))')
kinetics_reaction1.setMath(math_reaction1)


#REACTION: mRNA degradation; mRNA_ClpX  ->   (kd)
reaction2=pool_mRNA_ClpX.createReaction()
reaction2.setReversible(False)
reaction2.setFast(False)
reaction2.setId('reaction2')

reaction2_r1 = reaction2.createReactant()
reaction2_r1.setSpecies('mRNA_ClpX')
reaction2_r1.setStoichiometry(1)
reaction2_r1.setConstant(False)

kd=pool_mRNA_ClpX.createParameter()
kd.setId('kd')
kd.setConstant(True)
kd.setValue(5.7e-4)

# kinetic law 
kinetics_reaction2 = reaction2.createKineticLaw()
math_reaction2 = parseL3Formula('cytoplasm * kd * mRNA_ClpX')
kinetics_reaction2.setMath(math_reaction2)


#######


# Defining Ports
plugin_pool_mRNA_ClpX=pool_mRNA_ClpX.getPlugin("comp")
port_rib=plugin_pool_mRNA_ClpX.createPort()
port_rib.setId("port_rib")
port_rib.setIdRef("rib")        # one pool_mRNA_ClpX port is associated with the species rib

port_mRNA_ClpX=plugin_pool_mRNA_ClpX.createPort()
port_mRNA_ClpX.setId("port_mRNA_ClpX")
port_mRNA_ClpX.setIdRef("mRNA_ClpX")      # another mRNA_ClpX port is associated with the species mRNA_ClpX

port_ClpX=plugin_pool_mRNA_ClpX.createPort()
port_ClpX.setId("port_ClpX")
port_ClpX.setIdRef("ClpX")      # another pool_mRNA_ClpX port is associated with the species ClpX

writeSBMLToFile(document_pool_mRNA_ClpX,'pool_mRNA_ClpX.xml')

