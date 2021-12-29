#! /usr/bin/python
import sys
import re
import os

from libsbml import *

# Each module corresponds to a SUBMODEL (whose file will be used to refer to an EXTERNAL MODEL DEFINITION).
# Each input is a REPLACED ELEMENT into the corresponding module.
# Each output is a REPLACED BY into the corresponding module provided that it is different from any input of the same module. 

modules=[]

ns=SBMLNamespaces(3, 1, "comp", 1)
document = SBMLDocument(ns)                 # Creating an SBMLDocument 
plugin_document=document.getPlugin("comp")
plugin_document.setRequired(True)

#### Cell module. 
cell=document.createModel()
cell.setId("cell")
cell.setName("cell")
cell.setSubstanceUnits("mole")
cell.setTimeUnits("second")
cell.setVolumeUnits("litre")
cell.setLengthUnits("dimensionless")
cell.setAreaUnits("dimensionless")
cell.setExtentUnits("mole")
plugin_cell=cell.getPlugin("comp")

# creating the cell compartments
# nucleus
nucleus=cell.createCompartment()
nucleus.setId("nucleus")
nucleus.setSpatialDimensions(3)
nucleus.setConstant(True)
nucleus.setSize(2.9e-15)
nucleus.setUnits('litre')
nucleus_plugin=nucleus.getPlugin("comp")
# cytoplasm
cytoplasm=cell.createCompartment()
cytoplasm.setId("cytoplasm")
cytoplasm.setSpatialDimensions(3)
cytoplasm.setConstant(True)
cytoplasm.setSize(39.1e-15)
cytoplasm.setUnits('litre')
cytoplasm_plugin=cytoplasm.getPlugin("comp")

n_modules=("TUe_ClpX","TUe_ClpP","TUe_GFP","TUe_LHV")
c_modules=("pool_mRNA_ClpX","pool_mRNA_ClpP","pool_mRNA_GFP","pool_mRNA_LHV","pool_deg")

nucleus_plugin=nucleus.getPlugin("comp")
for i in range(0,len(n_modules)):
    re_nucleus=nucleus_plugin.createReplacedElement()
    re_nucleus.setSubmodelRef(n_modules[i])
    re_nucleus.setIdRef("nucleus")

cytoplasm_plugin=cytoplasm.getPlugin("comp")
for i in range(0,len(c_modules)):
    re_cytoplasm=cytoplasm_plugin.createReplacedElement()
    re_cytoplasm.setSubmodelRef(c_modules[i])
    re_cytoplasm.setIdRef("cytoplasm")
    
while(0):
    for i in range(0,len(n_modules)):
        print(n_modules[i])
        
    for i in range(0,len(c_modules)):
        print(c_modules[i])    

submodels=[]
extmodels=[]
# Creating the cell's Submodels: transcription units and pools. Creating document's ExternalModelDefinitions as well. 
# n_modules
for i in range(0,len(n_modules)):
    sub_mod=plugin_cell.createSubmodel()
    sub_mod.setId(n_modules[i])
    sub_mod.setModelRef(n_modules[i])
    submodels.append(sub_mod)
    #    
    ext_mod=plugin_document.createExternalModelDefinition()
    ext_mod.setId(n_modules[i])
    ext_mod.setModelRef(n_modules[i])
    source=n_modules[i]+'.xml'
    ext_mod.setSource(source)
    extmodels.append(ext_mod)

# c_modules
for i in range(0,len(c_modules)):
    sub_mod=plugin_cell.createSubmodel()
    sub_mod.setId(c_modules[i])
    sub_mod.setModelRef(c_modules[i])
    submodels.append(sub_mod)
    #    
    ext_mod=plugin_document.createExternalModelDefinition()
    ext_mod.setId(c_modules[i])
    ext_mod.setModelRef(c_modules[i])
    source=c_modules[i]+'.xml'
    ext_mod.setSource(source)
    extmodels.append(ext_mod)

# species to be declared in the cell model
n_species=("LHVe")
c_species=("be","mRNA_ClpX","mRNA_ClpP","mRNA_GFP","mRNA_LHV","ClpX","ClpP","GFP")
nc_species=(n_species,c_species)

##### Creating species
# LHVe
LHVe=cell.createSpecies()
LHVe.setId("LHVe")
LHVe.setConstant(False)
LHVe.setCompartment('nucleus')
LHVe.setSubstanceUnits('mole')
LHVe.setInitialConcentration(0)
LHVe.setBoundaryCondition(False)
LHVe.setHasOnlySubstanceUnits(False)
LHVe_plugin=LHVe.getPlugin("comp") 

                
# be (beta-estradiol)
be=cell.createSpecies()
be.setId("be")
be.setConstant(False)
be.setCompartment('cytoplasm')
be.setSubstanceUnits('mole')
be.setInitialConcentration(0)
be.setBoundaryCondition(False)
be.setHasOnlySubstanceUnits(False)
be_plugin=be.getPlugin("comp") 

# Replaced Element
module="pool_mRNA_LHV"
be_re=be_plugin.createReplacedElement()         
be_re.setSubmodelRef(module)
be_re.setPortRef("port_be")                

# ClpX
ClpX=cell.createSpecies()
ClpX.setId("ClpX")
ClpX.setConstant(False)
ClpX.setCompartment('cytoplasm')
ClpX.setSubstanceUnits('mole')
ClpX.setInitialConcentration(0)
ClpX.setBoundaryCondition(False)
ClpX.setHasOnlySubstanceUnits(False)
ClpX_plugin=ClpX.getPlugin("comp") 

# ClpP
ClpP=cell.createSpecies()
ClpP.setId("ClpP")
ClpP.setCompartment('cytoplasm')
ClpP.setConstant(False)               
ClpP.setSubstanceUnits('mole')
ClpP.setInitialConcentration(0)
ClpP.setBoundaryCondition(False)
ClpP.setHasOnlySubstanceUnits(False)
ClpP_plugin=ClpP.getPlugin("comp") 

# GFP
GFP=cell.createSpecies()
GFP.setId("GFP")
GFP.setConstant(False)
GFP.setCompartment('cytoplasm')
GFP.setSubstanceUnits('mole')
GFP.setInitialConcentration(0)
GFP.setBoundaryCondition(False)
GFP.setHasOnlySubstanceUnits(False)
GFP_plugin=GFP.getPlugin("comp") 


# mRNA_ClpX
mRNA_ClpX=cell.createSpecies()
mRNA_ClpX.setId("mRNA_ClpX")
mRNA_ClpX.setConstant(False)
mRNA_ClpX.setCompartment('cytoplasm')
mRNA_ClpX.setSubstanceUnits('mole')
mRNA_ClpX.setInitialConcentration(0)
mRNA_ClpX.setBoundaryCondition(False)
mRNA_ClpX.setHasOnlySubstanceUnits(False)
mRNA_ClpX_plugin=mRNA_ClpX.getPlugin("comp") 

# mRNA_ClpP
mRNA_ClpP=cell.createSpecies()
mRNA_ClpP.setId("mRNA_ClpP")
mRNA_ClpP.setConstant(False)
mRNA_ClpP.setCompartment('cytoplasm')
mRNA_ClpP.setSubstanceUnits('mole')
mRNA_ClpP.setInitialConcentration(0)
mRNA_ClpP.setBoundaryCondition(False)
mRNA_ClpP.setHasOnlySubstanceUnits(False)
mRNA_ClpP_plugin=mRNA_ClpP.getPlugin("comp") 

# mRNA_GFP
mRNA_GFP=cell.createSpecies()
mRNA_GFP.setId("mRNA_GFP")
mRNA_GFP.setConstant(False)
mRNA_GFP.setCompartment('cytoplasm')
mRNA_GFP.setSubstanceUnits('mole')
mRNA_GFP.setInitialConcentration(0)
mRNA_GFP.setBoundaryCondition(False)
mRNA_GFP.setHasOnlySubstanceUnits(False)
mRNA_GFP_plugin=mRNA_GFP.getPlugin("comp") 


# mRNA_LHV
mRNA_LHV=cell.createSpecies()
mRNA_LHV.setId("mRNA_LHV")
mRNA_LHV.setConstant(False)
mRNA_LHV.setCompartment('cytoplasm')
mRNA_LHV.setSubstanceUnits('mole')
mRNA_LHV.setInitialConcentration(0)
mRNA_LHV.setBoundaryCondition(False)
mRNA_LHV.setHasOnlySubstanceUnits(False)
mRNA_LHV_plugin=mRNA_LHV.getPlugin("comp") 



# Replaced Elements (re) and Repleaced By (rb)

# ClpX
ClpX_re=ClpX_plugin.createReplacedElement()
ClpX_re.setSubmodelRef("pool_deg")
ClpX_re.setPortRef("port_ClpX")                

ClpX_rb=ClpX_plugin.createReplacedBy()    
ClpX_rb.setSubmodelRef("pool_mRNA_ClpX")
ClpX_rb.setPortRef("port_ClpX")

# ClpP
ClpP_re=ClpP_plugin.createReplacedElement()
ClpP_re.setSubmodelRef("pool_deg")
ClpP_re.setPortRef("port_ClpP")                

ClpP_rb=ClpP_plugin.createReplacedBy()    
ClpP_rb.setSubmodelRef("pool_mRNA_ClpP")
ClpP_rb.setPortRef("port_ClpP")

# GFP
GFP_re=GFP_plugin.createReplacedElement()
GFP_re.setSubmodelRef("pool_deg")
GFP_re.setPortRef("port_GFP")                

GFP_rb=GFP_plugin.createReplacedBy()    
GFP_rb.setSubmodelRef("pool_mRNA_GFP")
GFP_rb.setPortRef("port_GFP")

# LHVe
LHVe_re=LHVe_plugin.createReplacedElement()
LHVe_re.setSubmodelRef("TUe_ClpX")
LHVe_re.setPortRef("port_LHVe")                

LHVe_rb=LHVe_plugin.createReplacedBy()    
LHVe_rb.setSubmodelRef("pool_mRNA_LHV")
LHVe_rb.setPortRef("port_LHVe")


# mRNA_ClpX
mRNA_ClpX_re=mRNA_ClpX_plugin.createReplacedElement()
mRNA_ClpX_re.setSubmodelRef("TUe_ClpX")
mRNA_ClpX_re.setPortRef("port_mRNA_ClpX")                

mRNA_ClpX_rb=mRNA_ClpX_plugin.createReplacedBy()    
mRNA_ClpX_rb.setSubmodelRef("pool_mRNA_ClpX")
mRNA_ClpX_rb.setPortRef("port_mRNA_ClpX")

# mRNA_ClpP
mRNA_ClpP_re=mRNA_ClpP_plugin.createReplacedElement()
mRNA_ClpP_re.setSubmodelRef("pool_mRNA_ClpP")
mRNA_ClpP_re.setPortRef("port_mRNA_ClpP")                

mRNA_ClpP_rb=mRNA_ClpP_plugin.createReplacedBy()    
mRNA_ClpP_rb.setSubmodelRef("TUe_ClpP")
mRNA_ClpP_rb.setPortRef("port_mRNA_ClpP")

# mRNA_GFP
mRNA_GFP_re=mRNA_GFP_plugin.createReplacedElement()
mRNA_GFP_re.setSubmodelRef("pool_mRNA_GFP")
mRNA_GFP_re.setPortRef("port_mRNA_GFP")                

mRNA_GFP_rb=mRNA_GFP_plugin.createReplacedBy()    
mRNA_GFP_rb.setSubmodelRef("TUe_GFP")
mRNA_GFP_rb.setPortRef("port_mRNA_GFP")

# mRNA_LHV
mRNA_LHV_re=mRNA_LHV_plugin.createReplacedElement()
mRNA_LHV_re.setSubmodelRef("pool_mRNA_LHV")
mRNA_LHV_re.setPortRef("port_mRNA_LHV")                

mRNA_LHV_rb=mRNA_LHV_plugin.createReplacedBy()    
mRNA_LHV_rb.setSubmodelRef("TUe_LHV")
mRNA_LHV_rb.setPortRef("port_mRNA_LHV")


                    
writeSBMLToFile(document,'cell_e.xml')
