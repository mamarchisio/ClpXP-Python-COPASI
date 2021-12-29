#! /usr/bin/python
import sys
import re
import os

from libsbml import *

ns=SBMLNamespaces(3, 1, "comp", 1)
document_tu = SBMLDocument(ns)                 # Creating an SBMLDocument 
plugin_document_tu=document_tu.getPlugin("comp")
plugin_document_tu.setRequired(True)

## TUe_LHV (LexA-HBD(hER)-VP64) transcription unit (nucleus)
#   DEG1t-pCYC1noTATA-LexA-HBD-VP64-CYC1t 
#   output: mrna_LHV
## reactions
# pre_mRNA_LHV synthesis: 
# pre_mRNA_LHV degradation
# mRNA_LHV maturation and transport



TUe_LHV=plugin_document_tu.createModelDefinition()
TUe_LHV.setId("TUe_LHV")
TUe_LHV.setName("TUe_LHV")

# Creating the nucleus compartment for TUe_LHV
nucleus=TUe_LHV.createCompartment()
nucleus.setId("nucleus")
nucleus.setSpatialDimensions(3)
nucleus.setConstant(True)
nucleus.setSize(2.9e-15)
nucleus.setUnits('litre')


# Species: pDg1 (constitutive promoter)
pDg1=TUe_LHV.createSpecies()
pDg1.setId('pDg1')
pDg1.setCompartment('nucleus')
pDg1.setConstant(False)               
pDg1.setSubstanceUnits('mole')
pDg1.setInitialConcentration(5.73e-10)
pDg1.setBoundaryCondition(False)
pDg1.setHasOnlySubstanceUnits(False)  

# Species pm_LHV (pre-mRNA)
pm_LHV=TUe_LHV.createSpecies()
pm_LHV.setId('pm_LHV')
pm_LHV.setCompartment('nucleus')
pm_LHV.setConstant(False)               
pm_LHV.setSubstanceUnits('mole')
pm_LHV.setInitialConcentration(0)
pm_LHV.setBoundaryCondition(False)
pm_LHV.setHasOnlySubstanceUnits(False)  

# Species mRNA_LHV, mature mrna
mRNA_LHV=TUe_LHV.createSpecies()
mRNA_LHV.setId('mRNA_LHV')
mRNA_LHV.setCompartment('cytoplasm') 
mRNA_LHV.setConstant(False)               
mRNA_LHV.setSubstanceUnits('mole')
mRNA_LHV.setInitialConcentration(0)
mRNA_LHV.setBoundaryCondition(False)
mRNA_LHV.setHasOnlySubstanceUnits(False)  

# REACTION:  pDg1  ->  pDg1 + pm_LHV  (k2) 
reaction1=TUe_LHV.createReaction()
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
reaction1_p2.setSpecies('pm_LHV')
reaction1_p2.setStoichiometry(1)
reaction1_p2.setConstant(False)  

k2=TUe_LHV.createParameter()   # pDg1 transcription initiation rate-constant
k2.setId('k2')
k2.setConstant(True)
k2.setValue(0.1170549194)

# kinetic law for reaction1
kinetics_reaction1 = reaction1.createKineticLaw()
math_reaction1 = parseL3Formula('nucleus * k2 * pDg1')
kinetics_reaction1.setMath(math_reaction1)

# REACTION: pm_LHV maturation and transport; pm_LHV -> mRNA_LHV (kmt)
# IMPORTANT: V_cytoplasm * dmRNA/dt = kmt*V_nucleus*pm_LHV-kdm*V_cytoplasm*mRNA; V_nucleus shall be included into the kinetic law otherwise the concentrations of mRNA and pm_LHV are calculated wrongly in COPASI
reaction2=TUe_LHV.createReaction()
reaction2.setReversible(False)
reaction2.setFast(False)
reaction2.setId('reaction2')

reaction2_r1 = reaction2.createReactant()
reaction2_r1.setSpecies('pm_LHV')
reaction2_r1.setStoichiometry(1)
reaction2_r1.setConstant(False)

reaction2_p1 = reaction2.createProduct()
reaction2_p1.setSpecies('mRNA_LHV')
reaction2_p1.setStoichiometry(1)
reaction2_p1.setConstant(False)  

kmt=TUe_LHV.createParameter()   # maturation and transport rate-constant
kmt.setId('kmt')
kmt.setConstant(True)
kmt.setValue(5.5e-4)

# kinetic law for reaction2
kinetics_reaction2 = reaction2.createKineticLaw()
math_reaction2 = parseL3Formula('nucleus * kmt * pm_LHV')
kinetics_reaction2.setMath(math_reaction2)

# REACTION: pm_LHV degradation. pm_LHV ->  (kd)
reaction3=TUe_LHV.createReaction()
reaction3.setReversible(False)
reaction3.setFast(False)
reaction3.setId('reaction3')

reaction3_r1 = reaction3.createReactant()
reaction3_r1.setSpecies('pm_LHV')
reaction3_r1.setStoichiometry(1)
reaction3_r1.setConstant(False)

kd=TUe_LHV.createParameter()   # pre-mRNA decay rate
kd.setId('kd')
kd.setConstant(True)
kd.setValue(5.7e-4)

# kinetic law for reaction3
kinetics_reaction3 = reaction3.createKineticLaw()
math_reaction3 = parseL3Formula('nucleus * kd * pm_LHV')
kinetics_reaction3.setMath(math_reaction3)

######
# Defining Ports
plugin_TUe_LHV=TUe_LHV.getPlugin("comp")

port_mrna_LHV=plugin_TUe_LHV.createPort()
port_mrna_LHV.setId("port_mRNA_LHV")
port_mrna_LHV.setIdRef("mRNA_LHV")          

writeSBMLToFile(document_tu,'TUe_LHV.xml')

###### pool_mRNA_LHV
# Protein synthesis: LHV is an inactive acivator in the cytoplasm. 
#    mrna_LHV  ->  mrna_LHV + LHV
# mRNA degradation
#   mrna_LHV ->
# Protein binding to the inducer, beta-estradiol
#    be + LHV <--> LHVe_c  (kb,ku)
# Protein transport into the nucleus
#   LHVe_c -> LHVe
# Cytoplasmic protein degradation
#   LHV ->
#   LHVe_c ->


document_pool_mRNA_LHV = SBMLDocument(ns)                 # Creating an SBMLDocument 
plugin_document_pool_mRNA_LHV=document_pool_mRNA_LHV.getPlugin("comp")
plugin_document_pool_mRNA_LHV.setRequired(True)

pool_mRNA_LHV=plugin_document_pool_mRNA_LHV.createModelDefinition()
pool_mRNA_LHV.setId("pool_mRNA_LHV")
pool_mRNA_LHV.setName("pool_mRNA_LHV")

# Creating the cytoplasm compartment for the mRNA
cytoplasm=pool_mRNA_LHV.createCompartment()
cytoplasm.setId("cytoplasm")
cytoplasm.setSpatialDimensions(3)
cytoplasm.setConstant(True)
cytoplasm.setSize(39.1e-15)
cytoplasm.setUnits('litre')

# Input species be (beta-estradiol), will be replaced by be into the cytoplasm
be=pool_mRNA_LHV.createSpecies()
be.setId('be')
be.setCompartment('cytoplasm')
be.setConstant(False)
be.setInitialConcentration(0)
be.setSubstanceUnits('mole')
be.setBoundaryCondition(False)
be.setHasOnlySubstanceUnits(False)  

# Input species mrna, will be replaced by the species mrna produced in the nucleus
mRNA_LHV=pool_mRNA_LHV.createSpecies()
mRNA_LHV.setId('mRNA_LHV')
mRNA_LHV.setCompartment('cytoplasm')
mRNA_LHV.setConstant(False)
mRNA_LHV.setInitialConcentration(0)
mRNA_LHV.setSubstanceUnits('mole')
mRNA_LHV.setBoundaryCondition(False)
mRNA_LHV.setHasOnlySubstanceUnits(False)  

# Species LHV
LHV=pool_mRNA_LHV.createSpecies()
LHV.setId('LHV')
LHV.setCompartment('cytoplasm')
LHV.setConstant(False)               
LHV.setSubstanceUnits('mole')
LHV.setInitialConcentration(0)
LHV.setBoundaryCondition(False)
LHV.setHasOnlySubstanceUnits(False)  

# Species LHVe_c
LHVe_c=pool_mRNA_LHV.createSpecies()
LHVe_c.setId('LHVe_c')
LHVe_c.setCompartment('cytoplasm')
LHVe_c.setConstant(False)               
LHVe_c.setSubstanceUnits('mole')
LHVe_c.setInitialConcentration(0)
LHVe_c.setBoundaryCondition(False)
LHVe_c.setHasOnlySubstanceUnits(False)

# Species LHVe
LHVe=pool_mRNA_LHV.createSpecies()
LHVe.setId('LHVe')
LHVe.setCompartment('nucleus')
LHVe.setConstant(False)               
LHVe.setSubstanceUnits('mole')
LHVe.setInitialConcentration(0)
LHVe.setBoundaryCondition(False)
LHVe.setHasOnlySubstanceUnits(False)  

# REACTION: LHV generation 
reaction1=pool_mRNA_LHV.createReaction()
reaction1.setReversible(False)
reaction1.setFast(False)
reaction1.setId('reaction1')

reaction1_r1 = reaction1.createReactant()
reaction1_r1.setSpecies('mRNA_LHV')
reaction1_r1.setStoichiometry(1)
reaction1_r1.setConstant(False)

reaction1_p1 = reaction1.createProduct()
reaction1_p1.setSpecies('mRNA_LHV')
reaction1_p1.setStoichiometry(1)
reaction1_p1.setConstant(False)  

reaction1_p2 = reaction1.createProduct()
reaction1_p2.setSpecies('LHV')
reaction1_p2.setStoichiometry(1)
reaction1_p2.setConstant(False)  

k2r=pool_mRNA_LHV.createParameter()      # translation initiation rate 
k2r.setId('k2r')
k2r.setConstant(True)
k2r.setValue(0.01)


# kinetic law 
kinetics_reaction1 = reaction1.createKineticLaw()
math_reaction1 = parseL3Formula('cytoplasm * k2r * mRNA_LHV')
kinetics_reaction1.setMath(math_reaction1)

#REACTION: mRNA degradation; mrna  ->   (kd)
reaction2=pool_mRNA_LHV.createReaction()
reaction2.setReversible(False)
reaction2.setFast(False)
reaction2.setId('reaction2')

reaction2_r1 = reaction2.createReactant()
reaction2_r1.setSpecies('mRNA_LHV')
reaction2_r1.setStoichiometry(1)
reaction2_r1.setConstant(False)

kd=pool_mRNA_LHV.createParameter()
kd.setId('kd')
kd.setConstant(True)
kd.setValue(5.7e-4)

# kinetic law 
kinetics_reaction2 = reaction2.createKineticLaw()
math_reaction2 = parseL3Formula('cytoplasm * kd * mRNA_LHV')
kinetics_reaction2.setMath(math_reaction2)


# REACTION: LHVe_c generation.  be + LHV -> LHVe_c
reaction3=pool_mRNA_LHV.createReaction()
reaction3.setReversible(False)
reaction3.setFast(False)
reaction3.setId('reaction3')

reaction3_r1 = reaction3.createReactant()
reaction3_r1.setSpecies('be')
reaction3_r1.setStoichiometry(1)
reaction3_r1.setConstant(False)

reaction3_r2 = reaction3.createReactant()
reaction3_r2.setSpecies('LHV')
reaction3_r2.setStoichiometry(1)
reaction3_r2.setConstant(False)

reaction3_p1 = reaction3.createProduct()
reaction3_p1.setSpecies('LHVe_c')
reaction3_p1.setStoichiometry(1)
reaction3_p1.setConstant(False)  


kb=pool_mRNA_LHV.createParameter()    
kb.setId('kb')
kb.setConstant(True)
kb.setValue(39365309.42)


# kinetic law 
kinetics_reaction3 = reaction3.createKineticLaw()
math_reaction3 = parseL3Formula('cytoplasm * kb * be * LHV')
kinetics_reaction3.setMath(math_reaction3)


# REACTION: LHVe_c dissociation.    LHVe_c -> be + LHV
reaction4=pool_mRNA_LHV.createReaction()
reaction4.setReversible(False)
reaction4.setFast(False)
reaction4.setId('reaction4')

reaction4_r1 = reaction4.createReactant()
reaction4_r1.setSpecies('LHVe_c')
reaction4_r1.setStoichiometry(1)
reaction4_r1.setConstant(False)

reaction4_p1 = reaction4.createProduct()
reaction4_p1.setSpecies('be')
reaction4_p1.setStoichiometry(1)
reaction4_p1.setConstant(False)  

reaction4_p2 = reaction4.createProduct()
reaction4_p2.setSpecies('LHV')
reaction4_p2.setStoichiometry(1)
reaction4_p2.setConstant(False)  

ku=pool_mRNA_LHV.createParameter()    
ku.setId('ku')
ku.setConstant(True)
ku.setValue(0.9812374813)

# kinetic law 
kinetics_reaction4 = reaction4.createKineticLaw()
math_reaction4 = parseL3Formula('cytoplasm * ku * LHVe_c')
kinetics_reaction4.setMath(math_reaction4)


#####
# REACTION: LHVe_c transport into the nucleus. LHVe_c -> LHVe (kt)
reaction5=pool_mRNA_LHV.createReaction()
reaction5.setReversible(False)
reaction5.setFast(False)
reaction5.setId('reaction5')

reaction5_r1 = reaction5.createReactant()
reaction5_r1.setSpecies('LHVe_c')
reaction5_r1.setStoichiometry(1)
reaction5_r1.setConstant(False)

reaction5_p1 = reaction5.createProduct()
reaction5_p1.setSpecies('LHVe')
reaction5_p1.setStoichiometry(1)
reaction5_p1.setConstant(False)  

kt=pool_mRNA_LHV.createParameter()
kt.setId('kt')
kt.setConstant(True)
kt.setValue(8.3e-3)

# kinetic law for reaction5
# AS ABOVE, a transport reaction demands to take into account the volume of the compartment of the reactant in the flux calculation
kinetics_reaction5 = reaction5.createKineticLaw()
math_reaction5 = parseL3Formula('cytoplasm * kt * LHVe_c')
kinetics_reaction5.setMath(math_reaction5)

########
# REACTION: LHVe_c degradation; LHVe_c ->  be (kdpe)
reaction6=pool_mRNA_LHV.createReaction()
reaction6.setReversible(False)
reaction6.setFast(False)
reaction6.setId('reaction6')

reaction6_r1 = reaction6.createReactant()
reaction6_r1.setSpecies('LHVe_c')
reaction6_r1.setStoichiometry(1)
reaction6_r1.setConstant(False)

reaction6_p1 = reaction6.createProduct()
reaction6_p1.setSpecies('be')
reaction6_p1.setStoichiometry(1)
reaction6_p1.setConstant(False)


kdpe=pool_mRNA_LHV.createParameter()
kdpe.setId('kdpe')
kdpe.setConstant(True)
kdpe.setValue(2.7e-4)

# kinetic law 
kinetics_reaction6 = reaction6.createKineticLaw()
math_reaction6 = parseL3Formula('cytoplasm * kdpe * LHVe_c')
kinetics_reaction6.setMath(math_reaction6)

#######

# REACTION: LHV degradation; LHV ->   (kdp)
reaction7=pool_mRNA_LHV.createReaction()
reaction7.setReversible(False)
reaction7.setFast(False)
reaction7.setId('reaction7')

reaction7_r1 = reaction7.createReactant()
reaction7_r1.setSpecies('LHV')
reaction7_r1.setStoichiometry(1)
reaction7_r1.setConstant(False)

kdp=pool_mRNA_LHV.createParameter()
kdp.setId('kdp')
kdp.setConstant(True)
kdp.setValue(2.7e-4)

# kinetic law 
kinetics_reaction7 = reaction7.createKineticLaw()
math_reaction7 = parseL3Formula('cytoplasm * kdp * LHV')
kinetics_reaction7.setMath(math_reaction7)

#######



# Defining Ports
plugin_pool_mRNA_LHV=pool_mRNA_LHV.getPlugin("comp")
port_be=plugin_pool_mRNA_LHV.createPort()
port_be.setId("port_be")
port_be.setIdRef("be")       

port_mRNA_LHV=plugin_pool_mRNA_LHV.createPort()
port_mRNA_LHV.setId("port_mRNA_LHV")
port_mRNA_LHV.setIdRef("mRNA_LHV")      

port_LHVe=plugin_pool_mRNA_LHV.createPort()
port_LHVe.setId("port_LHVe")
port_LHVe.setIdRef("LHVe")      

writeSBMLToFile(document_pool_mRNA_LHV,'pool_mRNA_LHV.xml')

