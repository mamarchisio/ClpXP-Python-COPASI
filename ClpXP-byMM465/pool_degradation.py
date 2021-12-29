#! /usr/bin/python
import sys
import re
import os

from libsbml import *

ns=SBMLNamespaces(3, 1, "comp", 1)
document_tu = SBMLDocument(ns)                 # Creating an SBMLDocument 
plugin_document_tu=document_tu.getPlugin("comp")
plugin_document_tu.setRequired(True)

## pool_degradation (cytoplasm)
#   input: ClpX, ClpP, GFP          
#   
#
## reactions
#  ClpX + ClpP <--> ClpXP (k1,k_1)
#  ClpX -> (k_dx)
#  ClpP -> (k_dp)
#  ClpXP -> (kdxp)
#  GFP ->  (k_dg) 
#  ClpXP + GFP -> ClpXP (k_df)


pool_deg=plugin_document_tu.createModelDefinition()
pool_deg.setId("pool_deg")
pool_deg.setName("pool_deg")

# Creating the cytoplasm compartment for the mRNA
cytoplasm=pool_deg.createCompartment()
cytoplasm.setId("cytoplasm")
cytoplasm.setSpatialDimensions(3)
cytoplasm.setConstant(True)
cytoplasm.setSize(39.1e-15)
cytoplasm.setUnits('litre')


# Input species: ClpX, ClpP, GFP. All are replaced by the corresponding one in the cell model
ClpX=pool_deg.createSpecies()
ClpX.setId('ClpX')
ClpX.setCompartment('cytoplasm')
ClpX.setConstant(False)               
ClpX.setSubstanceUnits('mole')
ClpX.setInitialConcentration(0)
ClpX.setBoundaryCondition(False)
ClpX.setHasOnlySubstanceUnits(False)  

ClpP=pool_deg.createSpecies()
ClpP.setId('ClpP')
ClpP.setCompartment('cytoplasm')
ClpP.setConstant(False)               
ClpP.setSubstanceUnits('mole')
ClpP.setInitialConcentration(0)
ClpP.setBoundaryCondition(False)
ClpP.setHasOnlySubstanceUnits(False)  

GFP=pool_deg.createSpecies()
GFP.setId('GFP')
GFP.setCompartment('cytoplasm')
GFP.setConstant(False)               
GFP.setSubstanceUnits('mole')
GFP.setInitialConcentration(0)
GFP.setBoundaryCondition(False)
GFP.setHasOnlySubstanceUnits(False)  


# Species: ClpXP 
ClpXP=pool_deg.createSpecies()
ClpXP.setId('ClpXP')
ClpXP.setCompartment('cytoplasm')
ClpXP.setConstant(False)               
ClpXP.setSubstanceUnits('mole')
ClpXP.setInitialConcentration(0)
ClpXP.setBoundaryCondition(False)
ClpXP.setHasOnlySubstanceUnits(False)  

# Species: ClpXP_GFP
ClpXP_GFP=pool_deg.createSpecies()
ClpXP_GFP.setId('ClpXP_GFP')
ClpXP_GFP.setCompartment('cytoplasm')
ClpXP_GFP.setConstant(False)               
ClpXP_GFP.setSubstanceUnits('mole')
ClpXP_GFP.setInitialConcentration(0)
ClpXP_GFP.setBoundaryCondition(False)
ClpXP_GFP.setHasOnlySubstanceUnits(False)  


# REACTION: ClpX + ClpP -> ClpXP  (k1)  
reaction1=pool_deg.createReaction()
reaction1.setReversible(False)
reaction1.setFast(False)
reaction1.setId('reaction1')

reaction1_r1 = reaction1.createReactant()
reaction1_r1.setSpecies('ClpX')
reaction1_r1.setStoichiometry(1)
reaction1_r1.setConstant(False)

reaction1_r2 = reaction1.createReactant()
reaction1_r2.setSpecies('ClpP')
reaction1_r2.setStoichiometry(1)
reaction1_r2.setConstant(False)

reaction1_p1 = reaction1.createProduct()
reaction1_p1.setSpecies('ClpXP')
reaction1_p1.setStoichiometry(1)
reaction1_p1.setConstant(False)  


k1=pool_deg.createParameter()   # association rate-constant
k1.setId('k1')
k1.setConstant(True)
k1.setValue(129696)

# kinetic law for reaction1
kinetics_reaction1 = reaction1.createKineticLaw()
math_reaction1 = parseL3Formula('cytoplasm * k1 * ClpX * ClpP')
kinetics_reaction1.setMath(math_reaction1)

# REACTION: ClpXP -> ClpX + ClpP -> (k_1)  
reaction2=pool_deg.createReaction()
reaction2.setReversible(False)
reaction2.setFast(False)
reaction2.setId('reaction2')

reaction2_r1 = reaction2.createReactant()
reaction2_r1.setSpecies('ClpXP')
reaction2_r1.setStoichiometry(1)
reaction2_r1.setConstant(False)

reaction2_p1 = reaction2.createProduct()
reaction2_p1.setSpecies('ClpX')
reaction2_p1.setStoichiometry(1)
reaction2_p1.setConstant(False)  

reaction2_p2 = reaction2.createProduct()
reaction2_p2.setSpecies('ClpP')
reaction2_p2.setStoichiometry(1)
reaction2_p2.setConstant(False)


k_1=pool_deg.createParameter()   # dissociation rate-constant
k_1.setId('k_1')
k_1.setConstant(True)
k_1.setValue(0.707632)

# kinetic law for reaction2
kinetics_reaction2 = reaction2.createKineticLaw()
math_reaction2 = parseL3Formula('cytoplasm * k_1 * ClpXP')
kinetics_reaction2.setMath(math_reaction2)


# REACTION: ClpX degradation. ClpX ->  (kdx)
reaction3=pool_deg.createReaction()
reaction3.setReversible(False)
reaction3.setFast(False)
reaction3.setId('reaction3')

reaction3_r1 = reaction3.createReactant()
reaction3_r1.setSpecies('ClpX')
reaction3_r1.setStoichiometry(1)
reaction3_r1.setConstant(False)

kdx=pool_deg.createParameter()   # pre-mRNA decay rate
kdx.setId('kdx')
kdx.setConstant(True)
kdx.setValue(2.7e-4)

# kinetic law for reaction3
kinetics_reaction3 = reaction3.createKineticLaw()
math_reaction3 = parseL3Formula('cytoplasm * kdx * ClpX')
kinetics_reaction3.setMath(math_reaction3)

# REACTION: ClpP degradation. ClpP ->  (kdp)
reaction4=pool_deg.createReaction()
reaction4.setReversible(False)
reaction4.setFast(False)
reaction4.setId('reaction4')

reaction4_r1 = reaction4.createReactant()
reaction4_r1.setSpecies('ClpP')
reaction4_r1.setStoichiometry(1)
reaction4_r1.setConstant(False)

kdp=pool_deg.createParameter()   
kdp.setId('kdp')
kdp.setConstant(True)
kdp.setValue(2.7e-4)

# kinetic law for reaction4
kinetics_reaction4 = reaction4.createKineticLaw()
math_reaction4 = parseL3Formula('cytoplasm * kdp * ClpP')
kinetics_reaction4.setMath(math_reaction4)

# REACTION: ClpXP degradation. ClpXP ->  (kdxp)
reaction5=pool_deg.createReaction()
reaction5.setReversible(False)
reaction5.setFast(False)
reaction5.setId('reaction5')

reaction5_r1 = reaction5.createReactant()
reaction5_r1.setSpecies('ClpXP')
reaction5_r1.setStoichiometry(1)
reaction5_r1.setConstant(False)

kdxp=pool_deg.createParameter()   
kdxp.setId('kdxp')
kdxp.setConstant(True)
kdxp.setValue(2.7e-4)

# kinetic law for reaction5
kinetics_reaction5 = reaction5.createKineticLaw()
math_reaction5 = parseL3Formula('cytoplasm * kdxp * ClpXP')
kinetics_reaction5.setMath(math_reaction5)

# REACTION: GFP degradation. GFP ->  (kdg)
reaction6=pool_deg.createReaction()
reaction6.setReversible(False)
reaction6.setFast(False)
reaction6.setId('reaction6')

reaction6_r1 = reaction6.createReactant()
reaction6_r1.setSpecies('GFP')
reaction6_r1.setStoichiometry(1)
reaction6_r1.setConstant(False)

kdg=pool_deg.createParameter()   
kdg.setId('kdg')
kdg.setConstant(True)
kdg.setValue(8.25E-5)

# kinetic law for reaction6
kinetics_reaction6 = reaction6.createKineticLaw()
math_reaction6 = parseL3Formula('cytoplasm * kdg * GFP')
kinetics_reaction6.setMath(math_reaction6)

# REACTION: ClpXP + GFP -> ClpXP  (kc)  
reaction7=pool_deg.createReaction()
reaction7.setReversible(False)
reaction7.setFast(False)
reaction7.setId('reaction7')

reaction7_r1 = reaction7.createReactant()
reaction7_r1.setSpecies('ClpXP')
reaction7_r1.setStoichiometry(1)
reaction7_r1.setConstant(False)

reaction7_r2 = reaction7.createReactant()
reaction7_r2.setSpecies('GFP')
reaction7_r2.setStoichiometry(1)
reaction7_r2.setConstant(False)

reaction7_p1 = reaction7.createProduct()
reaction7_p1.setSpecies('ClpXP_GFP')
reaction7_p1.setStoichiometry(1)
reaction7_p1.setConstant(False)  


kc=pool_deg.createParameter()
kc.setId('kc')
kc.setConstant(True)
#kc.setValue(5.25E-04)
kc.setValue(120099)

# kinetic law for reaction7
kinetics_reaction7 = reaction7.createKineticLaw()
math_reaction7 = parseL3Formula('cytoplasm * kc * ClpXP * GFP')
kinetics_reaction7.setMath(math_reaction7)

# REACTION: ClpXP_GFP fast degradation. ClpXP_GFP ->  ClpXP (kdf)
reaction8=pool_deg.createReaction()
reaction8.setReversible(False)
reaction8.setFast(False)
reaction8.setId('reaction8')

reaction8_r1 = reaction8.createReactant()
reaction8_r1.setSpecies('ClpXP_GFP')
reaction8_r1.setStoichiometry(1)
reaction8_r1.setConstant(False)

reaction8_p1 = reaction8.createProduct()
reaction8_p1.setSpecies('ClpXP')
reaction8_p1.setStoichiometry(1)
reaction8_p1.setConstant(False)

kdf=pool_deg.createParameter()   
kdf.setId('kdf')
kdf.setConstant(True)
kdf.setValue(0.0023)

# kinetic law for reaction8
kinetics_reaction8 = reaction8.createKineticLaw()
math_reaction8 = parseL3Formula('cytoplasm * kdf * ClpXP_GFP')
kinetics_reaction8.setMath(math_reaction8)


######
# Defining Ports
plugin_pool_deg=pool_deg.getPlugin("comp")
port_ClpX=plugin_pool_deg.createPort()
port_ClpX.setId("port_ClpX")
port_ClpX.setIdRef("ClpX")      # one pool_deg port is associated with the species ClpX

port_ClpP=plugin_pool_deg.createPort()
port_ClpP.setId("port_ClpP")
port_ClpP.setIdRef("ClpP")      # one pool_deg port is associated with the species ClpP

port_GFP=plugin_pool_deg.createPort()
port_GFP.setId("port_GFP")
port_GFP.setIdRef("GFP")          # the other pool_deg port is associated with the species GFP

writeSBMLToFile(document_tu,'pool_deg.xml')

