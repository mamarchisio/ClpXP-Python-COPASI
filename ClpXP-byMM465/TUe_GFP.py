#! /usr/bin/python
import sys
import re
import os

from libsbml import *

ns=SBMLNamespaces(3, 1, "comp", 1)
document_tu = SBMLDocument(ns)                 # Creating an SBMLDocument 
plugin_document_tu=document_tu.getPlugin("comp")
plugin_document_tu.setRequired(True)

## TUe_GFP transcription unit (nucleus)
#   DEG1t-pCYC1noTATA-yEGFP_ssrA-CYC1t           
#   output: mRNA_GFP
#
## reactions
# pre_mRNA_GFP synthesis
# pre_mRNA_GFP degradation       
# mRNA maturation and transport


TUe_GFP=plugin_document_tu.createModelDefinition()
TUe_GFP.setId("TUe_GFP")
TUe_GFP.setName("TUe_GFP")

# Creating the nucleus compartment for TUe_GFP
nucleus=TUe_GFP.createCompartment()
nucleus.setId("nucleus")
nucleus.setSpatialDimensions(3)
nucleus.setConstant(True)
nucleus.setSize(2.9e-15)
nucleus.setUnits('litre')


# Species: pDg1 
pDg1=TUe_GFP.createSpecies()
pDg1.setId('pDg1')
pDg1.setCompartment('nucleus')
pDg1.setConstant(False)               
pDg1.setSubstanceUnits('mole')
pDg1.setInitialConcentration(5.73e-10)
pDg1.setBoundaryCondition(False)
pDg1.setHasOnlySubstanceUnits(False)  

# Species pm_GFP (premRNA_GFP)
pm_GFP=TUe_GFP.createSpecies()
pm_GFP.setId('pm_GFP')
pm_GFP.setCompartment('nucleus')
pm_GFP.setConstant(False)               
pm_GFP.setSubstanceUnits('mole')
pm_GFP.setInitialConcentration(0)
pm_GFP.setBoundaryCondition(False)
pm_GFP.setHasOnlySubstanceUnits(False)  

# Species mRNA_GFP, mature mRNA
mRNA_GFP=TUe_GFP.createSpecies()
mRNA_GFP.setId('mRNA_GFP')
mRNA_GFP.setCompartment('cytoplasm') 
mRNA_GFP.setConstant(False)               
mRNA_GFP.setSubstanceUnits('mole')
mRNA_GFP.setInitialConcentration(0)
mRNA_GFP.setBoundaryCondition(False)
mRNA_GFP.setHasOnlySubstanceUnits(False)  

# REACTION:  pDg1 -> pDg1 + pmGFP  
reaction1=TUe_GFP.createReaction()
reaction1.setReversible(False)
reaction1.setFast(False)
reaction1.setId('reaction1')

reaction1_r1 = reaction1.createReactant()
reaction1_r1.setSpecies('pDg1')
reaction1_r1.setStoichiometry(1)
reaction1_r1.setConstant(False)

reaction1_p1 = reaction1.createProduct()
reaction1_p1.setSpecies('pDg1')
reaction1_p1.setStoichiometry(1)
reaction1_p1.setConstant(False)  

reaction1_p2 = reaction1.createProduct()
reaction1_p2.setSpecies('pm_GFP')
reaction1_p2.setStoichiometry(1)
reaction1_p2.setConstant(False)  

k2=TUe_GFP.createParameter()   # pDg1 transcription initiation rate-constant
k2.setId('k2')
k2.setConstant(True)
k2.setValue(0.1170549194)


# kinetic law for reaction 1
kinetics_reaction1 = reaction1.createKineticLaw()
math_reaction1 = parseL3Formula('nucleus * k2 * pDg1')
kinetics_reaction1.setMath(math_reaction1)


# REACTION: pm_GFP maturation and transport; pm_GFP -> mRNA (kmt)
# IMPORTANT: V_cytoplasm * dmRNA/dt = kmt*V_nucleus*pm_GFP-kdm*V_cytoplasm*mRNA; V_nucleus shall be included into the kinetic law otherwise the concentrations of mRNA and pm_GFP are calculated wrongly in COPASI
reaction2=TUe_GFP.createReaction()
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

kmt=TUe_GFP.createParameter()   # maturation and transport rate-constant
kmt.setId('kmt')
kmt.setConstant(True)
kmt.setValue(5.5e-4)

# kinetic law for reaction2
kinetics_reaction2 = reaction2.createKineticLaw()
math_reaction2 = parseL3Formula('nucleus * kmt * pm_GFP')
kinetics_reaction2.setMath(math_reaction2)

# REACTION: pm_GFP degradation. pm_GFP ->  (kd)
reaction3=TUe_GFP.createReaction()
reaction3.setReversible(False)
reaction3.setFast(False)
reaction3.setId('reaction3')

reaction3_r1 = reaction3.createReactant()
reaction3_r1.setSpecies('pm_GFP')
reaction3_r1.setStoichiometry(1)
reaction3_r1.setConstant(False)

kd=TUe_GFP.createParameter()   # pre-mRNA decay rate
kd.setId('kd')
kd.setConstant(True)
kd.setValue(5.7e-4)

# kinetic law for reaction3
kinetics_reaction3 = reaction3.createKineticLaw()
math_reaction3 = parseL3Formula('nucleus * kd * pm_GFP')
kinetics_reaction3.setMath(math_reaction3)

######
# Defining Ports
plugin_TUe_GFP=TUe_GFP.getPlugin("comp")

port_mRNA_GFP=plugin_TUe_GFP.createPort()
port_mRNA_GFP.setId("port_mRNA_GFP")
port_mRNA_GFP.setIdRef("mRNA_GFP")          

writeSBMLToFile(document_tu,'TUe_GFP.xml')

###### pool_mRNA_GFP
# Protein synthesis: GFP stays in the cytoplasm. 
#   input: rib, mRNA_GFP
#   output: GFP
#   GFP synthesis
#   mRNA degradation
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


# Input species mRNA, will be replaced by the species mRNA produced in the nucleus
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
reaction1_r1.setSpecies('mRNA_GFP')
reaction1_r1.setStoichiometry(1)
reaction1_r1.setConstant(False)

reaction1_p1 = reaction1.createProduct()
reaction1_p1.setSpecies('mRNA_GFP')
reaction1_p1.setStoichiometry(1)
reaction1_p1.setConstant(False)  

reaction1_p2 = reaction1.createProduct()
reaction1_p2.setSpecies('GFP')
reaction1_p2.setStoichiometry(1)
reaction1_p2.setConstant(False)  

k2r=pool_mRNA_GFP.createParameter()      # translation initiation rate at mRNA
k2r.setId('k2r')
k2r.setConstant(True)
k2r.setValue(0.01)


# kinetic law 
kinetics_reaction1 = reaction1.createKineticLaw()
math_reaction1 = parseL3Formula('cytoplasm * k2r * mRNA_GFP')
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

# kinetic law for re2
kinetics_reaction2 = reaction2.createKineticLaw()
math_reaction2 = parseL3Formula('cytoplasm * kd * mRNA_GFP')
kinetics_reaction2.setMath(math_reaction2)


# Defining Ports
plugin_pool_mRNA_GFP=pool_mRNA_GFP.getPlugin("comp")

port_mRNA_GFP=plugin_pool_mRNA_GFP.createPort()
port_mRNA_GFP.setId("port_mRNA_GFP")
port_mRNA_GFP.setIdRef("mRNA_GFP")      

port_GFP=plugin_pool_mRNA_GFP.createPort()
port_GFP.setId("port_GFP")
port_GFP.setIdRef("GFP")      

writeSBMLToFile(document_pool_mRNA_GFP,'pool_mRNA_GFP.xml')

