#! /usr/bin/python
import sys
import re
import os

from libsbml import *

ns=SBMLNamespaces(3, 1, "comp", 1)
document_tu = SBMLDocument(ns)                 # Creating an SBMLDocument 
plugin_document_tu=document_tu.getPlugin("comp")
plugin_document_tu.setRequired(True)

## TUe_ClpP transcription unit (nucleus)
#   pGPD-ClpP-CYC1t
#   output: mRNA_ClpP
#
## reactions
# pre_mRNA_ClpP synthesis
# pre_mRNA_ClpP degradation
# mRNA maturation and transport


TUe_ClpP=plugin_document_tu.createModelDefinition()
TUe_ClpP.setId("TUe_ClpP")
TUe_ClpP.setName("TUe_ClpP")

# Creating the nucleus compartment for TUe_ClpP
nucleus=TUe_ClpP.createCompartment()
nucleus.setId("nucleus")
nucleus.setSpatialDimensions(3)
nucleus.setConstant(True)
nucleus.setSize(2.9e-15)
nucleus.setUnits('litre')


# Species: pGPD 
pGPD=TUe_ClpP.createSpecies()
pGPD.setId('pGPD')
pGPD.setCompartment('nucleus')
pGPD.setConstant(False)               
pGPD.setSubstanceUnits('mole')
pGPD.setInitialConcentration(5.73e-10)
pGPD.setBoundaryCondition(False)
pGPD.setHasOnlySubstanceUnits(False)  

# Species pm_ClpP (premRNA_ClpP)
pm_ClpP=TUe_ClpP.createSpecies()
pm_ClpP.setId('pm_ClpP')
pm_ClpP.setCompartment('nucleus')
pm_ClpP.setConstant(False)               
pm_ClpP.setSubstanceUnits('mole')
pm_ClpP.setInitialConcentration(0)
pm_ClpP.setBoundaryCondition(False)
pm_ClpP.setHasOnlySubstanceUnits(False)  

# Species mRNA_ClpP, mature mRNA
mRNA_ClpP=TUe_ClpP.createSpecies()
mRNA_ClpP.setId('mRNA_ClpP')
mRNA_ClpP.setCompartment('cytoplasm') 
mRNA_ClpP.setConstant(False)               
mRNA_ClpP.setSubstanceUnits('mole')
mRNA_ClpP.setInitialConcentration(0)
mRNA_ClpP.setBoundaryCondition(False)
mRNA_ClpP.setHasOnlySubstanceUnits(False)  

# REACTION:pGPD ->  pGPD + pm_ClpP  (k2)
reaction1=TUe_ClpP.createReaction()
reaction1.setReversible(False)
reaction1.setFast(False)
reaction1.setId('reaction1')

reaction1_r1 = reaction1.createReactant()
reaction1_r1.setSpecies('pGPD')
reaction1_r1.setStoichiometry(1)
reaction1_r1.setConstant(False)

reaction1_p1 = reaction1.createProduct()
reaction1_p1.setSpecies('pGPD')
reaction1_p1.setStoichiometry(1)
reaction1_p1.setConstant(False)  

reaction1_p2 = reaction1.createProduct()
reaction1_p2.setSpecies('pm_ClpP')
reaction1_p2.setStoichiometry(1)
reaction1_p2.setConstant(False)  

k2=TUe_ClpP.createParameter()   # pGPD transcription initiation rate-constant
k2.setId('k2')
k2.setConstant(True)
k2.setValue(0.592806)


# kinetic law for reaction1
kinetics_reaction1 = reaction1.createKineticLaw()
math_reaction1 = parseL3Formula('nucleus * k2 * pGPD')
kinetics_reaction1.setMath(math_reaction1)


# REACTION: pm_ClpP maturation and transport; pm_ClpP -> mRNA_ClpP (kmt)
# IMPORTANT: V_cytoplasm * dmRNA/dt = kmt*V_nucleus*pm_ClpP-kdm*V_cytoplasm*mRNA; V_nucleus shall be included into the kinetic law otherwise the concentrations of mRNA and pm_ClpP are calculated wrongly in COPASI
reaction2=TUe_ClpP.createReaction()
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

kmt=TUe_ClpP.createParameter()   # maturation and transport rate-constant
kmt.setId('kmt')
kmt.setConstant(True)
kmt.setValue(5.5e-4)

# kinetic law for reaction2
kinetics_reaction2 = reaction2.createKineticLaw()
math_reaction2 = parseL3Formula('nucleus * kmt * pm_ClpP')
kinetics_reaction2.setMath(math_reaction2)

# REACTION: pm_ClpP degradation. pm_ClpP ->  (kd)
reaction3=TUe_ClpP.createReaction()
reaction3.setReversible(False)
reaction3.setFast(False)
reaction3.setId('reaction3')

reaction3_r1 = reaction3.createReactant()
reaction3_r1.setSpecies('pm_ClpP')
reaction3_r1.setStoichiometry(1)
reaction3_r1.setConstant(False)

kd=TUe_ClpP.createParameter()   # pre-mRNA decay rate
kd.setId('kd')
kd.setConstant(True)
kd.setValue(5.7e-4)

# kinetic law for reaction3
kinetics_reaction3 = reaction3.createKineticLaw()
math_reaction3 = parseL3Formula('nucleus * kd * pm_ClpP')
kinetics_reaction3.setMath(math_reaction3)

######
# Defining Ports
plugin_TUe_ClpP=TUe_ClpP.getPlugin("comp")

port_mRNA_ClpP=plugin_TUe_ClpP.createPort()
port_mRNA_ClpP.setId("port_mRNA_ClpP")
port_mRNA_ClpP.setIdRef("mRNA_ClpP")          

writeSBMLToFile(document_tu,'TUe_ClpP.xml')

###### pool_mRNA_ClpP
# Protein synthesis: ClpP stays in the cytoplasm. 
#   input: mRNA_ClpP
#   output: ClpP
#   mRNA_ClpP ->  mRNA_ClpP + ClpP
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
reaction1_r1.setSpecies('mRNA_ClpP')
reaction1_r1.setStoichiometry(1)
reaction1_r1.setConstant(False)


reaction1_p1 = reaction1.createProduct()
reaction1_p1.setSpecies('mRNA_ClpP')
reaction1_p1.setStoichiometry(1)
reaction1_p1.setConstant(False)  

reaction1_p2 = reaction1.createProduct()
reaction1_p2.setSpecies('ClpP')
reaction1_p2.setStoichiometry(1)
reaction1_p2.setConstant(False)  

k2r=pool_mRNA_ClpP.createParameter()      # translation initiation rate at mRNA
k2r.setId('k2r')
k2r.setConstant(True)
k2r.setValue(0.01)


# kinetic law 
kinetics_reaction1 = reaction1.createKineticLaw()
math_reaction1 = parseL3Formula('cytoplasm * k2r * mRNA_ClpP')
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

port_mRNA_ClpP=plugin_pool_mRNA_ClpP.createPort()
port_mRNA_ClpP.setId("port_mRNA_ClpP")
port_mRNA_ClpP.setIdRef("mRNA_ClpP")      

port_ClpP=plugin_pool_mRNA_ClpP.createPort()
port_ClpP.setId("port_ClpP")
port_ClpP.setIdRef("ClpP")      

writeSBMLToFile(document_pool_mRNA_ClpP,'pool_mRNA_ClpP.xml')

