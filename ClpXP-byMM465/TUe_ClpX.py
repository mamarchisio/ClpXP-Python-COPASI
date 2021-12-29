#! /usr/bin/python
import sys
import re
import os

from libsbml import *

ns=SBMLNamespaces(3, 1, "comp", 1)
document_tu = SBMLDocument(ns)                 # Creating an SBMLDocument 
plugin_document_tu=document_tu.getPlugin("comp")
plugin_document_tu.setRequired(True)

## TUe_ClpX transcription unit (nucleus)
#   3lexOp2pCYC1min-ClpX-CYC1t
#   input: LexA-HBD-VP64 bound to beta-estradiol, LHVe
#   output: mRNA_ClpX
## reactions
# pre_mRNA_ClpX synthesis: induced by the presence of LHVe
# pre_mRNA_ClpX degradation        
# mRNA maturation and transport


TUe_ClpX=plugin_document_tu.createModelDefinition()
TUe_ClpX.setId("TUe_ClpX")
TUe_ClpX.setName("TUe_ClpX")

# Creating the nucleus compartment for TUe_ClpX
nucleus=TUe_ClpX.createCompartment()
nucleus.setId("nucleus")
nucleus.setSpatialDimensions(3)
nucleus.setConstant(True)
nucleus.setSize(2.9e-15)
nucleus.setUnits('litre')

# Input species LHVe. LHVe is replaced by LHVe in the cell model
LHVe=TUe_ClpX.createSpecies()
LHVe.setId('LHVe')
LHVe.setCompartment('nucleus')
LHVe.setConstant(False)               
LHVe.setSubstanceUnits('mole')
LHVe.setInitialConcentration(0)
LHVe.setBoundaryCondition(False)
LHVe.setHasOnlySubstanceUnits(False)  

# Species: psCYC1 (inducible promoter)
psCYC1=TUe_ClpX.createSpecies()
psCYC1.setId('psCYC1')
psCYC1.setCompartment('nucleus')
psCYC1.setConstant(False)               
psCYC1.setSubstanceUnits('mole')
psCYC1.setInitialConcentration(5.73e-10)
psCYC1.setBoundaryCondition(False)
psCYC1.setHasOnlySubstanceUnits(False)  

# Species pm_ClpX (premRNA_ClpX)
pm_ClpX=TUe_ClpX.createSpecies()
pm_ClpX.setId('pm_ClpX')
pm_ClpX.setCompartment('nucleus')
pm_ClpX.setConstant(False)               
pm_ClpX.setSubstanceUnits('mole')
pm_ClpX.setInitialConcentration(0)
pm_ClpX.setBoundaryCondition(False)
pm_ClpX.setHasOnlySubstanceUnits(False)  

# Species mRNA_ClpX, mature mRNA
mRNA_ClpX=TUe_ClpX.createSpecies()
mRNA_ClpX.setId('mRNA_ClpX')
mRNA_ClpX.setCompartment('cytoplasm') 
mRNA_ClpX.setConstant(False)               
mRNA_ClpX.setSubstanceUnits('mole')
mRNA_ClpX.setInitialConcentration(0)
mRNA_ClpX.setBoundaryCondition(False)
mRNA_ClpX.setHasOnlySubstanceUnits(False)  

# REACTION: LHVe + psCYC1 <-> [LHVe-psCYC1] -> LHVe + psCYC1 + pm_ClpX  
reaction1=TUe_ClpX.createReaction()
reaction1.setReversible(False)
reaction1.setFast(False)
reaction1.setId('reaction1')

reaction1_r1 = reaction1.createReactant()
reaction1_r1.setSpecies('LHVe')
reaction1_r1.setStoichiometry(1)
reaction1_r1.setConstant(False)

reaction1_r2 = reaction1.createReactant()
reaction1_r2.setSpecies('psCYC1')
reaction1_r2.setStoichiometry(1)
reaction1_r2.setConstant(False)

reaction1_p1 = reaction1.createProduct()
reaction1_p1.setSpecies('LHVe')
reaction1_p1.setStoichiometry(1)
reaction1_p1.setConstant(False)  

reaction1_p2 = reaction1.createProduct()
reaction1_p2.setSpecies('psCYC1')
reaction1_p2.setStoichiometry(1)
reaction1_p2.setConstant(False)  

reaction1_p3 = reaction1.createProduct()
reaction1_p3.setSpecies('pm_ClpX')
reaction1_p3.setStoichiometry(1)
reaction1_p3.setConstant(False)  

k2=TUe_ClpX.createParameter()   # psCYC1 transcription initiation rate-constant
k2.setId('k2')
k2.setConstant(True)
k2.setValue(0.5846443879)

km=TUe_ClpX.createParameter()   # Hill constant
km.setId('km')
km.setConstant(True)
km.setValue(8.75086e-7)

nh=TUe_ClpX.createParameter()   # Hill coefficient
nh.setId('nh')
nh.setConstant(True)
nh.setValue(1.518893334)

# kinetic law for reaction1
kinetics_reaction1 = reaction1.createKineticLaw()
math_reaction1 = parseL3Formula('nucleus * k2 * psCYC1 * (LHVe/km)^nh/(1+(LHVe/km)^nh)')
kinetics_reaction1.setMath(math_reaction1)


# REACTION: pm_ClpX maturation and transport; pm_ClpX -> mRNA (kmt)
# IMPORTANT: V_cytoplasm * dmRNA/dt = kmt*V_nucleus*pm_ClpX-kdm*V_cytoplasm*mRNA; V_nucleus shall be included into the kinetic law otherwise the concentrations of mRNA and pm_ClpX are calculated wrongly in COPASI
reaction2=TUe_ClpX.createReaction()
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

kmt=TUe_ClpX.createParameter()   # maturation and transport rate-constant
kmt.setId('kmt')
kmt.setConstant(True)
kmt.setValue(5.5e-4)

# kinetic law for reaction2
kinetics_reaction2 = reaction2.createKineticLaw()
math_reaction2 = parseL3Formula('nucleus * kmt * pm_ClpX')
kinetics_reaction2.setMath(math_reaction2)

# REACTION: pm_ClpX degradation. pm_ClpX ->  (kd)
reaction3=TUe_ClpX.createReaction()
reaction3.setReversible(False)
reaction3.setFast(False)
reaction3.setId('reaction3')

reaction3_r1 = reaction3.createReactant()
reaction3_r1.setSpecies('pm_ClpX')
reaction3_r1.setStoichiometry(1)
reaction3_r1.setConstant(False)

kd=TUe_ClpX.createParameter()   # pre-mRNA decay rate
kd.setId('kd')
kd.setConstant(True)
kd.setValue(5.7e-4)

# kinetic law for reaction3
kinetics_reaction3 = reaction3.createKineticLaw()
math_reaction3 = parseL3Formula('nucleus * kd * pm_ClpX')
kinetics_reaction3.setMath(math_reaction3)

# REACTION: LHVe degradation. LHVe ->  be 
reaction4=TUe_ClpX.createReaction()
reaction4.setReversible(False)
reaction4.setFast(False)
reaction4.setId('reaction4')

reaction4_r1 = reaction4.createReactant()
reaction4_r1.setSpecies('LHVe')
reaction4_r1.setStoichiometry(1)
reaction4_r1.setConstant(False)

reaction4_p1 = reaction4.createProduct()
reaction4_p1.setSpecies('be')
reaction4_p1.setStoichiometry(1)
reaction4_p1.setConstant(False)  

kdp=TUe_ClpX.createParameter()   # protein decay rate
kdp.setId('kdp')
kdp.setConstant(True)
kdp.setValue(2.7e-4)

# kinetic law for reaction4
kinetics_reaction4 = reaction4.createKineticLaw()
math_reaction4 = parseL3Formula('nucleus * kdp * LHVe')
kinetics_reaction4.setMath(math_reaction4)


# REACTION: psCYC1  ->  psCYC1 + pm_ClpX  (k2lk)  leakage
reaction5=TUe_ClpX.createReaction()
reaction5.setReversible(False)
reaction5.setFast(False)
reaction5.setId('reaction5')

reaction5_r1 = reaction5.createReactant()
reaction5_r1.setSpecies('psCYC1')
reaction5_r1.setStoichiometry(1)
reaction5_r1.setConstant(False)

reaction5_p1 = reaction5.createProduct()
reaction5_p1.setSpecies('psCYC1')
reaction5_p1.setStoichiometry(1)
reaction5_p1.setConstant(False)  

reaction5_p2 = reaction5.createProduct()
reaction5_p2.setSpecies('pm_ClpX')
reaction5_p2.setStoichiometry(1)
reaction5_p2.setConstant(False)  

k2lk=TUe_ClpX.createParameter()   
k2lk.setId('k2lk')
k2lk.setConstant(True)
k2lk.setValue(0.0293236)

# kinetic law for reaction5
kinetics_reaction5 = reaction5.createKineticLaw()
math_reaction5 = parseL3Formula('nucleus * k2lk * psCYC1')
kinetics_reaction5.setMath(math_reaction5)

######
# Defining Ports
plugin_TUe_ClpX=TUe_ClpX.getPlugin("comp")
port_LHVe=plugin_TUe_ClpX.createPort()
port_LHVe.setId("port_LHVe")
port_LHVe.setIdRef("LHVe")      # one TUe_ClpX port is associated with the species LHVe

port_mRNA_ClpX=plugin_TUe_ClpX.createPort()
port_mRNA_ClpX.setId("port_mRNA_ClpX")
port_mRNA_ClpX.setIdRef("mRNA_ClpX")          # the other TUe_ClpX port is associated with the species mRNA_ClpX

writeSBMLToFile(document_tu,'TUe_ClpX.xml')

###### pool_mRNA_ClpX
# Protein synthesis:  ClpX stays in the cytoplasm. 
#   input: mRNA_ClpX
#   output: ClpX
#   mRNA_ClpX ->  mRNA_ClpX + ClpX
#   mRNA degradation
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
reaction1_r1.setSpecies('mRNA_ClpX')
reaction1_r1.setStoichiometry(1)
reaction1_r1.setConstant(False)

reaction1_p1 = reaction1.createProduct()
reaction1_p1.setSpecies('mRNA_ClpX')
reaction1_p1.setStoichiometry(1)
reaction1_p1.setConstant(False)  

reaction1_p2 = reaction1.createProduct()
reaction1_p2.setSpecies('ClpX')
reaction1_p2.setStoichiometry(1)
reaction1_p2.setConstant(False)  

k2r=pool_mRNA_ClpX.createParameter()      # translation initiation rate 
k2r.setId('k2r')
k2r.setConstant(True)
k2r.setValue(0.01)


# kinetic law 
kinetics_reaction1 = reaction1.createKineticLaw()
math_reaction1 = parseL3Formula('cytoplasm * k2r * mRNA_ClpX')
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

port_mRNA_ClpX=plugin_pool_mRNA_ClpX.createPort()
port_mRNA_ClpX.setId("port_mRNA_ClpX")
port_mRNA_ClpX.setIdRef("mRNA_ClpX")      

port_ClpX=plugin_pool_mRNA_ClpX.createPort()
port_ClpX.setId("port_ClpX")
port_ClpX.setIdRef("ClpX")      

writeSBMLToFile(document_pool_mRNA_ClpX,'pool_mRNA_ClpX.xml')

