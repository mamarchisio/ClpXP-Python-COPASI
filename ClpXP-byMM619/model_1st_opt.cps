<?xml version="1.0" encoding="UTF-8"?>
<!-- generated with COPASI 4.34 (Build 251) (http://www.copasi.org) at 2021-12-19T10:16:38Z -->
<?oxygen RNGSchema="http://www.copasi.org/static/schema/CopasiML.rng" type="xml"?>
<COPASI xmlns="http://www.copasi.org/static/schema" versionMajor="4" versionMinor="34" versionDevel="251" copasiSourcesModified="0">
  <ListOfFunctions>
    <Function key="Function_13" name="Mass action (irreversible)" type="MassAction" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
   <rdf:Description rdf:about="#Function_13">
   <CopasiMT:is rdf:resource="urn:miriam:obo.sbo:SBO:0000163" />
   </rdf:Description>
   </rdf:RDF>
      </MiriamAnnotation>
      <Comment>
        <body xmlns="http://www.w3.org/1999/xhtml">
<b>Mass action rate law for irreversible reactions</b>
<p>
Reaction scheme where the products are created from the reactants and the change of a product quantity is proportional to the product of reactant activities. The reaction scheme does not include any reverse process that creates the reactants from the products. The change of a product quantity is proportional to the quantity of one reactant.
</p>
</body>
      </Comment>
      <Expression>
        k1*PRODUCT&lt;substrate_i>
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_80" name="k1" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_81" name="substrate" order="1" role="substrate"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_40" name="Function for TU_ClpX__reaction1" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_40">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        TU_ClpX__k2*TU_ClpX__pGAL1*(Pol_II/TU_ClpX__km)/(1+Pol_II/TU_ClpX__km)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_250" name="Pol_II" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_265" name="TU_ClpX__k2" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_266" name="TU_ClpX__km" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_267" name="TU_ClpX__pGAL1" order="3" role="substrate"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_41" name="Function for TU_ClpX__reaction2" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_41">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        nucleus*TU_ClpX__kmt*TU_ClpX__pm_ClpX
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_262" name="TU_ClpX__kmt" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_272" name="TU_ClpX__pm_ClpX" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_273" name="nucleus" order="2" role="volume"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_42" name="Function for TU_ClpP__reaction1" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_42">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        TU_ClpP__k2*TU_ClpP__pGPD*(Pol_II/TU_ClpP__km)/(1+Pol_II/TU_ClpP__km)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_280" name="Pol_II" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_281" name="TU_ClpP__k2" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_282" name="TU_ClpP__km" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_283" name="TU_ClpP__pGPD" order="3" role="substrate"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_43" name="Function for TU_ClpP__reaction2" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_43">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        nucleus*TU_ClpP__kmt*TU_ClpP__pm_ClpP
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_278" name="TU_ClpP__kmt" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_288" name="TU_ClpP__pm_ClpP" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_289" name="nucleus" order="2" role="volume"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_44" name="Function for TU_GFP__reaction1" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_44">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        TU_GFP__k2*TU_GFP__pTs8*(Pol_II/TU_GFP__km)/(1+Pol_II/TU_GFP__km)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_296" name="Pol_II" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_297" name="TU_GFP__k2" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_298" name="TU_GFP__km" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_299" name="TU_GFP__pTs8" order="3" role="substrate"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_45" name="Function for TU_GFP__reaction2" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_45">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        nucleus*TU_GFP__kmt*TU_GFP__pm_GFP
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_294" name="TU_GFP__kmt" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_304" name="TU_GFP__pm_GFP" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_305" name="nucleus" order="2" role="volume"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_46" name="Function for pool_mRNA_ClpX__reaction1" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_46">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        pool_mRNA_ClpX__k2r*mRNA_ClpX*(rib/pool_mRNA_ClpX__kmr)/(1+rib/pool_mRNA_ClpX__kmr)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_312" name="mRNA_ClpX" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_313" name="pool_mRNA_ClpX__k2r" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_314" name="pool_mRNA_ClpX__kmr" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_315" name="rib" order="3" role="substrate"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_47" name="Function for pool_mRNA_ClpP__reaction1" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_47">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        pool_mRNA_ClpP__k2r*mRNA_ClpP*(rib/pool_mRNA_ClpP__kmr)/(1+rib/pool_mRNA_ClpP__kmr)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_322" name="mRNA_ClpP" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_323" name="pool_mRNA_ClpP__k2r" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_324" name="pool_mRNA_ClpP__kmr" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_325" name="rib" order="3" role="substrate"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_48" name="Function for pool_mRNA_GFP__reaction1" type="UserDefined" reversible="false">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Function_48">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        pool_mRNA_GFP__k2r*mRNA_GFP*(rib/pool_mRNA_GFP__kmr)/(1+rib/pool_mRNA_GFP__kmr)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_332" name="mRNA_GFP" order="0" role="substrate"/>
        <ParameterDescription key="FunctionParameter_333" name="pool_mRNA_GFP__k2r" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_334" name="pool_mRNA_GFP__kmr" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_335" name="rib" order="3" role="substrate"/>
      </ListOfParameterDescriptions>
    </Function>
  </ListOfFunctions>
  <Model key="Model_0" name="cell" simulationType="time" timeUnit="s" volumeUnit="l" areaUnit="1" lengthUnit="1" quantityUnit="mol" type="deterministic" avogadroConstant="6.0221417899999999e+23">
    <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Model_0">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2021-12-19T03:24:26Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

    </MiriamAnnotation>
    <ListOfCompartments>
      <Compartment key="Compartment_0" name="nucleus" simulationType="fixed" dimensionality="3" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Compartment_0">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Compartment>
      <Compartment key="Compartment_1" name="cytoplasm" simulationType="fixed" dimensionality="3" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Compartment_1">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Compartment>
    </ListOfCompartments>
    <ListOfMetabolites>
      <Metabolite key="Metabolite_0" name="Pol_II" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_0">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1" name="rib" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_1">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_2" name="TU_ClpX__pGAL1" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_2">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_3" name="TU_ClpX__pm_ClpX" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_3">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_4" name="TU_ClpP__pGPD" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_4">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_5" name="TU_ClpP__pm_ClpP" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_5">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_6" name="mRNA_ClpP" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_6">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_7" name="TU_GFP__pTs8" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_7">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_8" name="TU_GFP__pm_GFP" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_8">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_9" name="mRNA_GFP" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_9">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_10" name="mRNA_ClpX" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_10">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_11" name="ClpX" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_11">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_12" name="ClpP" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_12">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_13" name="GFP" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_13">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_14" name="pool_deg__ClpXP" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_14">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_15" name="pool_deg__ClpXP_GFP" simulationType="reactions" compartment="Compartment_1" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_15">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
    </ListOfMetabolites>
    <ListOfModelValues>
      <ModelValue key="ModelValue_0" name="TU_ClpX__k2" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"/>

        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1" name="TU_ClpX__km" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_1">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_2" name="TU_ClpX__kmt" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_2">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_3" name="TU_ClpX__kd" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_3">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_4" name="TU_ClpP__k2" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_4">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_5" name="TU_ClpP__km" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_5">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_6" name="TU_ClpP__kmt" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_6">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_7" name="TU_ClpP__kd" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_7">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_8" name="TU_GFP__k2" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"/>

        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_9" name="TU_GFP__km" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_9">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_10" name="TU_GFP__kmt" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_10">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_11" name="TU_GFP__kd" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_11">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_12" name="pool_mRNA_ClpX__k2r" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"/>

        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_13" name="pool_mRNA_ClpX__kmr" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_13">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_14" name="pool_mRNA_ClpX__kd" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_14">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_15" name="pool_mRNA_ClpP__k2r" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_15">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_16" name="pool_mRNA_ClpP__kmr" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_16">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_17" name="pool_mRNA_ClpP__kd" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_17">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_18" name="pool_mRNA_GFP__k2r" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_18">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_19" name="pool_mRNA_GFP__kmr" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_19">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_20" name="pool_mRNA_GFP__kd" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_20">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_21" name="pool_deg__k1" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"/>

        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_22" name="pool_deg__k_1" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_22">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_23" name="pool_deg__kdx" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_23">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_24" name="pool_deg__kdp" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_24">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_25" name="pool_deg__kdxp" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_25">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_26" name="pool_deg__kdg" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelValue_26">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_27" name="pool_deg__kc" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"/>

        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_28" name="pool_deg__kdf" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"/>

        </MiriamAnnotation>
      </ModelValue>
    </ListOfModelValues>
    <ListOfReactions>
      <Reaction key="Reaction_0" name="TU_ClpX__reaction1" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_0">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_0" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_2" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_0" stoichiometry="1"/>
          <Product metabolite="Metabolite_2" stoichiometry="1"/>
          <Product metabolite="Metabolite_3" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4352" name="TU_ClpX__k2" value="0.464124"/>
          <Constant key="Parameter_4351" name="TU_ClpX__km" value="8.75086e-07"/>
        </ListOfConstants>
        <KineticLaw function="Function_40" unitType="Default" scalingCompartment="CN=Root,Model=cell,Vector=Compartments[nucleus]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_250">
              <SourceParameter reference="Metabolite_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_265">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_266">
              <SourceParameter reference="ModelValue_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_267">
              <SourceParameter reference="Metabolite_2"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1" name="TU_ClpX__reaction2" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_1">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_3" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_10" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4355" name="TU_ClpX__kmt" value="0.00055"/>
        </ListOfConstants>
        <KineticLaw function="Function_41" unitType="Default">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_262">
              <SourceParameter reference="ModelValue_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_272">
              <SourceParameter reference="Metabolite_3"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_273">
              <SourceParameter reference="Compartment_0"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_2" name="TU_ClpX__reaction3" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_2">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_3" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_4353" name="k1" value="0.00057"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=cell,Vector=Compartments[nucleus]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="ModelValue_3"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_3"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_3" name="TU_ClpP__reaction1" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_3">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_0" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_4" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_0" stoichiometry="1"/>
          <Product metabolite="Metabolite_4" stoichiometry="1"/>
          <Product metabolite="Metabolite_5" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4356" name="TU_ClpP__k2" value="0.592806"/>
          <Constant key="Parameter_4357" name="TU_ClpP__km" value="1.55184e-11"/>
        </ListOfConstants>
        <KineticLaw function="Function_42" unitType="Default" scalingCompartment="CN=Root,Model=cell,Vector=Compartments[nucleus]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_280">
              <SourceParameter reference="Metabolite_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_281">
              <SourceParameter reference="ModelValue_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_282">
              <SourceParameter reference="ModelValue_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_283">
              <SourceParameter reference="Metabolite_4"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_4" name="TU_ClpP__reaction2" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_4">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_5" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_6" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4361" name="TU_ClpP__kmt" value="0.00055"/>
        </ListOfConstants>
        <KineticLaw function="Function_43" unitType="Default">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_278">
              <SourceParameter reference="ModelValue_6"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_288">
              <SourceParameter reference="Metabolite_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_289">
              <SourceParameter reference="Compartment_0"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_5" name="TU_ClpP__reaction3" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_5">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_5" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_4363" name="k1" value="0.00057"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=cell,Vector=Compartments[nucleus]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="ModelValue_7"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_5"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_6" name="TU_GFP__reaction1" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_6">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_0" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_7" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_0" stoichiometry="1"/>
          <Product metabolite="Metabolite_7" stoichiometry="1"/>
          <Product metabolite="Metabolite_8" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4364" name="TU_GFP__k2" value="0.213578"/>
          <Constant key="Parameter_4358" name="TU_GFP__km" value="9.71558e-06"/>
        </ListOfConstants>
        <KineticLaw function="Function_44" unitType="Default" scalingCompartment="CN=Root,Model=cell,Vector=Compartments[nucleus]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_296">
              <SourceParameter reference="Metabolite_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_297">
              <SourceParameter reference="ModelValue_8"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_298">
              <SourceParameter reference="ModelValue_9"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_299">
              <SourceParameter reference="Metabolite_7"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_7" name="TU_GFP__reaction2" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_7">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_8" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_9" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4360" name="TU_GFP__kmt" value="0.00055"/>
        </ListOfConstants>
        <KineticLaw function="Function_45" unitType="Default">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_294">
              <SourceParameter reference="ModelValue_10"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_304">
              <SourceParameter reference="Metabolite_8"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_305">
              <SourceParameter reference="Compartment_0"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_8" name="TU_GFP__reaction3" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_8">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_8" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_4359" name="k1" value="0.00057"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=cell,Vector=Compartments[nucleus]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="ModelValue_11"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_8"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_9" name="pool_mRNA_ClpX__reaction1" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_9">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_10" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1" stoichiometry="1"/>
          <Product metabolite="Metabolite_10" stoichiometry="1"/>
          <Product metabolite="Metabolite_11" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4362" name="pool_mRNA_ClpX__k2r" value="0.01"/>
          <Constant key="Parameter_4365" name="pool_mRNA_ClpX__kmr" value="1e-07"/>
        </ListOfConstants>
        <KineticLaw function="Function_46" unitType="Default" scalingCompartment="CN=Root,Model=cell,Vector=Compartments[cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_312">
              <SourceParameter reference="Metabolite_10"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_313">
              <SourceParameter reference="ModelValue_12"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_314">
              <SourceParameter reference="ModelValue_13"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_315">
              <SourceParameter reference="Metabolite_1"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_10" name="pool_mRNA_ClpX__reaction2" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_10">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_10" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_4366" name="k1" value="0.00057"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=cell,Vector=Compartments[cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="ModelValue_14"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_10"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_11" name="pool_mRNA_ClpP__reaction1" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"/>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_6" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1" stoichiometry="1"/>
          <Product metabolite="Metabolite_6" stoichiometry="1"/>
          <Product metabolite="Metabolite_12" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4375" name="pool_mRNA_ClpP__k2r" value="0.01"/>
          <Constant key="Parameter_4373" name="pool_mRNA_ClpP__kmr" value="1e-07"/>
        </ListOfConstants>
        <KineticLaw function="Function_47" unitType="Default" scalingCompartment="CN=Root,Model=cell,Vector=Compartments[cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_322">
              <SourceParameter reference="Metabolite_6"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_323">
              <SourceParameter reference="ModelValue_15"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_324">
              <SourceParameter reference="ModelValue_16"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_325">
              <SourceParameter reference="Metabolite_1"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_12" name="pool_mRNA_ClpP__reaction2" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"/>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_6" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_4372" name="k1" value="0.00057"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=cell,Vector=Compartments[cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="ModelValue_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_6"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_13" name="pool_mRNA_GFP__reaction1" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_13">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_9" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1" stoichiometry="1"/>
          <Product metabolite="Metabolite_9" stoichiometry="1"/>
          <Product metabolite="Metabolite_13" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4376" name="pool_mRNA_GFP__k2r" value="0.01"/>
          <Constant key="Parameter_4374" name="pool_mRNA_GFP__kmr" value="1e-07"/>
        </ListOfConstants>
        <KineticLaw function="Function_48" unitType="Default" scalingCompartment="CN=Root,Model=cell,Vector=Compartments[cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_332">
              <SourceParameter reference="Metabolite_9"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_333">
              <SourceParameter reference="ModelValue_18"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_334">
              <SourceParameter reference="ModelValue_19"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_335">
              <SourceParameter reference="Metabolite_1"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_14" name="pool_mRNA_GFP__reaction2" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_14">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_9" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_4370" name="k1" value="0.00057"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=cell,Vector=Compartments[cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="ModelValue_20"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_9"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_15" name="pool_deg__reaction1" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"/>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_11" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_12" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_14" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4368" name="k1" value="129696"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=cell,Vector=Compartments[cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="ModelValue_21"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_11"/>
              <SourceParameter reference="Metabolite_12"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_16" name="pool_deg__reaction2" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"/>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_14" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_11" stoichiometry="1"/>
          <Product metabolite="Metabolite_12" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4367" name="k1" value="0.707632"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=cell,Vector=Compartments[cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="ModelValue_22"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_14"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_17" name="pool_deg__reaction3" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"/>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_11" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_4371" name="k1" value="0.00027"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=cell,Vector=Compartments[cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="ModelValue_23"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_11"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_18" name="pool_deg__reaction4" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"/>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_12" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_4369" name="k1" value="0.00027"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=cell,Vector=Compartments[cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="ModelValue_24"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_12"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_19" name="pool_deg__reaction5" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"/>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_14" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_4390" name="k1" value="0.00027"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=cell,Vector=Compartments[cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="ModelValue_25"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_14"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_20" name="pool_deg__reaction6" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"/>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_13" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_4391" name="k1" value="8.25e-05"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=cell,Vector=Compartments[cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="ModelValue_26"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_13"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_21" name="pool_deg__reaction7" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"/>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_14" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_13" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_15" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4378" name="k1" value="120099"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=cell,Vector=Compartments[cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="ModelValue_27"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_14"/>
              <SourceParameter reference="Metabolite_13"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_22" name="pool_deg__reaction8" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"/>

        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_15" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_14" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4395" name="k1" value="0.0023"/>
        </ListOfConstants>
        <KineticLaw function="Function_13" unitType="Default" scalingCompartment="CN=Root,Model=cell,Vector=Compartments[cytoplasm]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_80">
              <SourceParameter reference="ModelValue_28"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="Metabolite_15"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
    </ListOfReactions>
    <ListOfModelParameterSets activeSet="ModelParameterSet_0">
      <ModelParameterSet key="ModelParameterSet_0" name="Initial State">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelParameterSet_0">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=cell" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[nucleus]" value="2.9000000000000002e-15" type="Compartment" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm]" value="3.9099999999999999e-14" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[nucleus],Vector=Metabolites[Pol_II]" value="2000" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[rib]" value="5000" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[nucleus],Vector=Metabolites[TU_ClpX__pGAL1]" value="1.0006993012443004" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[nucleus],Vector=Metabolites[TU_ClpX__pm_ClpX]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[nucleus],Vector=Metabolites[TU_ClpP__pGPD]" value="1.0006993012443004" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[nucleus],Vector=Metabolites[TU_ClpP__pm_ClpP]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[mRNA_ClpP]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[nucleus],Vector=Metabolites[TU_GFP__pTs8]" value="1.0006993012443004" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[nucleus],Vector=Metabolites[TU_GFP__pm_GFP]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[mRNA_GFP]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[mRNA_ClpX]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[ClpX]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[ClpP]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[GFP]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[pool_deg__ClpXP]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[pool_deg__ClpXP_GFP]" value="0" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[TU_ClpX__k2]" value="0.46412364270000001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[TU_ClpX__km]" value="8.7508577715315919e-07" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[TU_ClpX__kmt]" value="0.00055000000000000003" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[TU_ClpX__kd]" value="0.00056999999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[TU_ClpP__k2]" value="0.59280555779999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[TU_ClpP__km]" value="1.5518356947019932e-11" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[TU_ClpP__kmt]" value="0.00055000000000000003" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[TU_ClpP__kd]" value="0.00056999999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[TU_GFP__k2]" value="0.21357830350000001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[TU_GFP__km]" value="9.7155802720000002e-06" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[TU_GFP__kmt]" value="0.00055000000000000003" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[TU_GFP__kd]" value="0.00056999999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_mRNA_ClpX__k2r]" value="0.01" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_mRNA_ClpX__kmr]" value="9.9999999999999995e-08" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_mRNA_ClpX__kd]" value="0.00056999999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_mRNA_ClpP__k2r]" value="0.01" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_mRNA_ClpP__kmr]" value="9.9999999999999995e-08" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_mRNA_ClpP__kd]" value="0.00056999999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_mRNA_GFP__k2r]" value="0.01" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_mRNA_GFP__kmr]" value="9.9999999999999995e-08" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_mRNA_GFP__kd]" value="0.00056999999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_deg__k1]" value="129696.29849815887" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_deg__k_1]" value="0.70763191182029639" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_deg__kdx]" value="0.00027" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_deg__kdp]" value="0.00027" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_deg__kdxp]" value="0.00027" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_deg__kdg]" value="8.25e-05" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_deg__kc]" value="120099.37256908913" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_deg__kdf]" value="0.0023" type="ModelValue" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpX__reaction1]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpX__reaction1],ParameterGroup=Parameters,Parameter=TU_ClpX__k2" value="0.46412364270000001" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[TU_ClpX__k2],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpX__reaction1],ParameterGroup=Parameters,Parameter=TU_ClpX__km" value="8.7508577715315919e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[TU_ClpX__km],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpX__reaction2]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpX__reaction2],ParameterGroup=Parameters,Parameter=TU_ClpX__kmt" value="0.00055000000000000003" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[TU_ClpX__kmt],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpX__reaction3]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpX__reaction3],ParameterGroup=Parameters,Parameter=k1" value="0.00056999999999999998" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[TU_ClpX__kd],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpP__reaction1]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpP__reaction1],ParameterGroup=Parameters,Parameter=TU_ClpP__k2" value="0.59280555779999999" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[TU_ClpP__k2],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpP__reaction1],ParameterGroup=Parameters,Parameter=TU_ClpP__km" value="1.5518356947019932e-11" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[TU_ClpP__km],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpP__reaction2]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpP__reaction2],ParameterGroup=Parameters,Parameter=TU_ClpP__kmt" value="0.00055000000000000003" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[TU_ClpP__kmt],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpP__reaction3]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpP__reaction3],ParameterGroup=Parameters,Parameter=k1" value="0.00056999999999999998" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[TU_ClpP__kd],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[TU_GFP__reaction1]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[TU_GFP__reaction1],ParameterGroup=Parameters,Parameter=TU_GFP__k2" value="0.21357830350000001" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[TU_GFP__k2],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[TU_GFP__reaction1],ParameterGroup=Parameters,Parameter=TU_GFP__km" value="9.7155802720000002e-06" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[TU_GFP__km],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[TU_GFP__reaction2]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[TU_GFP__reaction2],ParameterGroup=Parameters,Parameter=TU_GFP__kmt" value="0.00055000000000000003" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[TU_GFP__kmt],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[TU_GFP__reaction3]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[TU_GFP__reaction3],ParameterGroup=Parameters,Parameter=k1" value="0.00056999999999999998" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[TU_GFP__kd],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_ClpX__reaction1]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_ClpX__reaction1],ParameterGroup=Parameters,Parameter=pool_mRNA_ClpX__k2r" value="0.01" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_mRNA_ClpX__k2r],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_ClpX__reaction1],ParameterGroup=Parameters,Parameter=pool_mRNA_ClpX__kmr" value="9.9999999999999995e-08" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_mRNA_ClpX__kmr],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_ClpX__reaction2]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_ClpX__reaction2],ParameterGroup=Parameters,Parameter=k1" value="0.00056999999999999998" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_mRNA_ClpX__kd],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_ClpP__reaction1]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_ClpP__reaction1],ParameterGroup=Parameters,Parameter=pool_mRNA_ClpP__k2r" value="0.01" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_mRNA_ClpP__k2r],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_ClpP__reaction1],ParameterGroup=Parameters,Parameter=pool_mRNA_ClpP__kmr" value="9.9999999999999995e-08" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_mRNA_ClpP__kmr],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_ClpP__reaction2]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_ClpP__reaction2],ParameterGroup=Parameters,Parameter=k1" value="0.00056999999999999998" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_mRNA_ClpP__kd],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_GFP__reaction1]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_GFP__reaction1],ParameterGroup=Parameters,Parameter=pool_mRNA_GFP__k2r" value="0.01" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_mRNA_GFP__k2r],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_GFP__reaction1],ParameterGroup=Parameters,Parameter=pool_mRNA_GFP__kmr" value="9.9999999999999995e-08" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_mRNA_GFP__kmr],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_GFP__reaction2]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_GFP__reaction2],ParameterGroup=Parameters,Parameter=k1" value="0.00056999999999999998" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_mRNA_GFP__kd],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction1]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction1],ParameterGroup=Parameters,Parameter=k1" value="129696.29849815887" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_deg__k1],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction2]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction2],ParameterGroup=Parameters,Parameter=k1" value="0.70763191182029639" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_deg__k_1],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction3]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction3],ParameterGroup=Parameters,Parameter=k1" value="0.00027" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_deg__kdx],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction4]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction4],ParameterGroup=Parameters,Parameter=k1" value="0.00027" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_deg__kdp],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction5]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction5],ParameterGroup=Parameters,Parameter=k1" value="0.00027" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_deg__kdxp],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction6]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction6],ParameterGroup=Parameters,Parameter=k1" value="8.25e-05" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_deg__kdg],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction7]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction7],ParameterGroup=Parameters,Parameter=k1" value="120099.37256908913" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_deg__kc],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction8]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction8],ParameterGroup=Parameters,Parameter=k1" value="0.0023" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_deg__kdf],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_1" name="Parameter Set 2021-12-19T18:04:28">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"/>

        </MiriamAnnotation>
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=cell" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[nucleus]" value="2.9000000000000002e-15" type="Compartment" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm]" value="3.9099999999999999e-14" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[nucleus],Vector=Metabolites[Pol_II]" value="2000" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[rib]" value="5000" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[nucleus],Vector=Metabolites[TU_ClpX__pGAL1]" value="1.0006993012443004" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[nucleus],Vector=Metabolites[TU_ClpX__pm_ClpX]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[nucleus],Vector=Metabolites[TU_ClpP__pGPD]" value="1.0006993012443004" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[nucleus],Vector=Metabolites[TU_ClpP__pm_ClpP]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[mRNA_ClpP]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[nucleus],Vector=Metabolites[TU_GFP__pTs8]" value="1.0006993012443004" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[nucleus],Vector=Metabolites[TU_GFP__pm_GFP]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[mRNA_GFP]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[mRNA_ClpX]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[ClpX]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[ClpP]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[GFP]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[pool_deg__ClpXP]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[pool_deg__ClpXP_GFP]" value="0" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[TU_ClpX__k2]" value="0.46412364267648593" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[TU_ClpX__km]" value="8.7508577715315919e-07" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[TU_ClpX__kmt]" value="0.00055000000000000003" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[TU_ClpX__kd]" value="0.00056999999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[TU_ClpP__k2]" value="0.59280555776143107" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[TU_ClpP__km]" value="1.5518356947019932e-11" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[TU_ClpP__kmt]" value="0.00055000000000000003" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[TU_ClpP__kd]" value="0.00056999999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[TU_GFP__k2]" value="0.21357830353283083" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[TU_GFP__km]" value="9.7155802720000002e-06" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[TU_GFP__kmt]" value="0.00055000000000000003" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[TU_GFP__kd]" value="0.00056999999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_mRNA_ClpX__k2r]" value="0.01" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_mRNA_ClpX__kmr]" value="9.9999999999999995e-08" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_mRNA_ClpX__kd]" value="0.00056999999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_mRNA_ClpP__k2r]" value="0.01" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_mRNA_ClpP__kmr]" value="9.9999999999999995e-08" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_mRNA_ClpP__kd]" value="0.00056999999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_mRNA_GFP__k2r]" value="0.01" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_mRNA_GFP__kmr]" value="9.9999999999999995e-08" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_mRNA_GFP__kd]" value="0.00056999999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_deg__k1]" value="129696.29849815887" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_deg__k_1]" value="0.70763191182029639" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_deg__kdx]" value="0.00027" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_deg__kdp]" value="0.00027" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_deg__kdxp]" value="0.00027" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_deg__kdg]" value="8.25e-05" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_deg__kc]" value="120099.37256908913" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_deg__kdf]" value="0.0023" type="ModelValue" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpX__reaction1]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpX__reaction1],ParameterGroup=Parameters,Parameter=TU_ClpX__k2" value="0.46412364267648593" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[TU_ClpX__k2],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpX__reaction1],ParameterGroup=Parameters,Parameter=TU_ClpX__km" value="8.7508577715315919e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[TU_ClpX__km],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpX__reaction2]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpX__reaction2],ParameterGroup=Parameters,Parameter=TU_ClpX__kmt" value="0.00055000000000000003" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[TU_ClpX__kmt],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpX__reaction3]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpX__reaction3],ParameterGroup=Parameters,Parameter=k1" value="0.00056999999999999998" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[TU_ClpX__kd],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpP__reaction1]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpP__reaction1],ParameterGroup=Parameters,Parameter=TU_ClpP__k2" value="0.59280555776143107" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[TU_ClpP__k2],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpP__reaction1],ParameterGroup=Parameters,Parameter=TU_ClpP__km" value="1.5518356947019932e-11" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[TU_ClpP__km],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpP__reaction2]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpP__reaction2],ParameterGroup=Parameters,Parameter=TU_ClpP__kmt" value="0.00055000000000000003" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[TU_ClpP__kmt],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpP__reaction3]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpP__reaction3],ParameterGroup=Parameters,Parameter=k1" value="0.00056999999999999998" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[TU_ClpP__kd],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[TU_GFP__reaction1]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[TU_GFP__reaction1],ParameterGroup=Parameters,Parameter=TU_GFP__k2" value="0.21357830353283083" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[TU_GFP__k2],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[TU_GFP__reaction1],ParameterGroup=Parameters,Parameter=TU_GFP__km" value="9.7155802720000002e-06" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[TU_GFP__km],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[TU_GFP__reaction2]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[TU_GFP__reaction2],ParameterGroup=Parameters,Parameter=TU_GFP__kmt" value="0.00055000000000000003" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[TU_GFP__kmt],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[TU_GFP__reaction3]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[TU_GFP__reaction3],ParameterGroup=Parameters,Parameter=k1" value="0.00056999999999999998" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[TU_GFP__kd],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_ClpX__reaction1]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_ClpX__reaction1],ParameterGroup=Parameters,Parameter=pool_mRNA_ClpX__k2r" value="0.01" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_mRNA_ClpX__k2r],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_ClpX__reaction1],ParameterGroup=Parameters,Parameter=pool_mRNA_ClpX__kmr" value="9.9999999999999995e-08" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_mRNA_ClpX__kmr],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_ClpX__reaction2]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_ClpX__reaction2],ParameterGroup=Parameters,Parameter=k1" value="0.00056999999999999998" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_mRNA_ClpX__kd],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_ClpP__reaction1]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_ClpP__reaction1],ParameterGroup=Parameters,Parameter=pool_mRNA_ClpP__k2r" value="0.01" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_mRNA_ClpP__k2r],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_ClpP__reaction1],ParameterGroup=Parameters,Parameter=pool_mRNA_ClpP__kmr" value="9.9999999999999995e-08" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_mRNA_ClpP__kmr],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_ClpP__reaction2]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_ClpP__reaction2],ParameterGroup=Parameters,Parameter=k1" value="0.00056999999999999998" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_mRNA_ClpP__kd],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_GFP__reaction1]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_GFP__reaction1],ParameterGroup=Parameters,Parameter=pool_mRNA_GFP__k2r" value="0.01" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_mRNA_GFP__k2r],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_GFP__reaction1],ParameterGroup=Parameters,Parameter=pool_mRNA_GFP__kmr" value="9.9999999999999995e-08" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_mRNA_GFP__kmr],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_GFP__reaction2]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_GFP__reaction2],ParameterGroup=Parameters,Parameter=k1" value="0.00056999999999999998" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_mRNA_GFP__kd],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction1]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction1],ParameterGroup=Parameters,Parameter=k1" value="129696.29849815887" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_deg__k1],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction2]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction2],ParameterGroup=Parameters,Parameter=k1" value="0.70763191182029639" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_deg__k_1],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction3]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction3],ParameterGroup=Parameters,Parameter=k1" value="0.00027" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_deg__kdx],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction4]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction4],ParameterGroup=Parameters,Parameter=k1" value="0.00027" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_deg__kdp],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction5]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction5],ParameterGroup=Parameters,Parameter=k1" value="0.00027" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_deg__kdxp],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction6]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction6],ParameterGroup=Parameters,Parameter=k1" value="8.25e-05" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_deg__kdg],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction7]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction7],ParameterGroup=Parameters,Parameter=k1" value="120099.37256908913" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_deg__kc],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction8]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction8],ParameterGroup=Parameters,Parameter=k1" value="0.0023" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_deg__kdf],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
      <ModelParameterSet key="ModelParameterSet_3" name="Parameter Set gal1-leakage">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"/>

        </MiriamAnnotation>
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=cell" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[nucleus]" value="2.9000000000000002e-15" type="Compartment" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm]" value="3.9099999999999999e-14" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[nucleus],Vector=Metabolites[Pol_II]" value="2000" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[rib]" value="5000" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[nucleus],Vector=Metabolites[TU_ClpX__pGAL1]" value="1.0006993012443004" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[nucleus],Vector=Metabolites[TU_ClpX__pm_ClpX]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[nucleus],Vector=Metabolites[TU_ClpP__pGPD]" value="1.0006993012443004" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[nucleus],Vector=Metabolites[TU_ClpP__pm_ClpP]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[mRNA_ClpP]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[nucleus],Vector=Metabolites[TU_GFP__pTs8]" value="1.0006993012443004" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[nucleus],Vector=Metabolites[TU_GFP__pm_GFP]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[mRNA_GFP]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[mRNA_ClpX]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[ClpX]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[ClpP]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[GFP]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[pool_deg__ClpXP]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[pool_deg__ClpXP_GFP]" value="0" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[TU_ClpX__k2]" value="0.0011900000000000001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[TU_ClpX__km]" value="8.7508577720000001e-07" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[TU_ClpX__kmt]" value="0.00055000000000000003" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[TU_ClpX__kd]" value="0.00056999999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[TU_ClpP__k2]" value="0.59280555776143107" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[TU_ClpP__km]" value="1.5518356947019932e-11" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[TU_ClpP__kmt]" value="0.00055000000000000003" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[TU_ClpP__kd]" value="0.00056999999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[TU_GFP__k2]" value="0.21357830353283083" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[TU_GFP__km]" value="9.7155802720000002e-06" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[TU_GFP__kmt]" value="0.00055000000000000003" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[TU_GFP__kd]" value="0.00056999999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_mRNA_ClpX__k2r]" value="0.01" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_mRNA_ClpX__kmr]" value="9.9999999999999995e-08" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_mRNA_ClpX__kd]" value="0.00056999999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_mRNA_ClpP__k2r]" value="0.01" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_mRNA_ClpP__kmr]" value="9.9999999999999995e-08" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_mRNA_ClpP__kd]" value="0.00056999999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_mRNA_GFP__k2r]" value="0.01" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_mRNA_GFP__kmr]" value="9.9999999999999995e-08" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_mRNA_GFP__kd]" value="0.00056999999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_deg__k1]" value="129696.29849815887" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_deg__k_1]" value="0.70763191182029639" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_deg__kdx]" value="0.00027" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_deg__kdp]" value="0.00027" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_deg__kdxp]" value="0.00027" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_deg__kdg]" value="8.25e-05" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_deg__kc]" value="120099.37256908913" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=cell,Vector=Values[pool_deg__kdf]" value="0.0023" type="ModelValue" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpX__reaction1]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpX__reaction1],ParameterGroup=Parameters,Parameter=TU_ClpX__k2" value="0.0011900000000000001" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[TU_ClpX__k2],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpX__reaction1],ParameterGroup=Parameters,Parameter=TU_ClpX__km" value="8.7508577720000001e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[TU_ClpX__km],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpX__reaction2]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpX__reaction2],ParameterGroup=Parameters,Parameter=TU_ClpX__kmt" value="0.00055000000000000003" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[TU_ClpX__kmt],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpX__reaction3]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpX__reaction3],ParameterGroup=Parameters,Parameter=k1" value="0.00056999999999999998" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[TU_ClpX__kd],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpP__reaction1]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpP__reaction1],ParameterGroup=Parameters,Parameter=TU_ClpP__k2" value="0.59280555776143107" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[TU_ClpP__k2],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpP__reaction1],ParameterGroup=Parameters,Parameter=TU_ClpP__km" value="1.5518356947019932e-11" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[TU_ClpP__km],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpP__reaction2]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpP__reaction2],ParameterGroup=Parameters,Parameter=TU_ClpP__kmt" value="0.00055000000000000003" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[TU_ClpP__kmt],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpP__reaction3]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[TU_ClpP__reaction3],ParameterGroup=Parameters,Parameter=k1" value="0.00056999999999999998" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[TU_ClpP__kd],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[TU_GFP__reaction1]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[TU_GFP__reaction1],ParameterGroup=Parameters,Parameter=TU_GFP__k2" value="0.21357830353283083" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[TU_GFP__k2],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[TU_GFP__reaction1],ParameterGroup=Parameters,Parameter=TU_GFP__km" value="9.7155802720000002e-06" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[TU_GFP__km],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[TU_GFP__reaction2]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[TU_GFP__reaction2],ParameterGroup=Parameters,Parameter=TU_GFP__kmt" value="0.00055000000000000003" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[TU_GFP__kmt],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[TU_GFP__reaction3]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[TU_GFP__reaction3],ParameterGroup=Parameters,Parameter=k1" value="0.00056999999999999998" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[TU_GFP__kd],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_ClpX__reaction1]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_ClpX__reaction1],ParameterGroup=Parameters,Parameter=pool_mRNA_ClpX__k2r" value="0.01" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_mRNA_ClpX__k2r],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_ClpX__reaction1],ParameterGroup=Parameters,Parameter=pool_mRNA_ClpX__kmr" value="9.9999999999999995e-08" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_mRNA_ClpX__kmr],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_ClpX__reaction2]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_ClpX__reaction2],ParameterGroup=Parameters,Parameter=k1" value="0.00056999999999999998" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_mRNA_ClpX__kd],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_ClpP__reaction1]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_ClpP__reaction1],ParameterGroup=Parameters,Parameter=pool_mRNA_ClpP__k2r" value="0.01" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_mRNA_ClpP__k2r],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_ClpP__reaction1],ParameterGroup=Parameters,Parameter=pool_mRNA_ClpP__kmr" value="9.9999999999999995e-08" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_mRNA_ClpP__kmr],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_ClpP__reaction2]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_ClpP__reaction2],ParameterGroup=Parameters,Parameter=k1" value="0.00056999999999999998" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_mRNA_ClpP__kd],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_GFP__reaction1]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_GFP__reaction1],ParameterGroup=Parameters,Parameter=pool_mRNA_GFP__k2r" value="0.01" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_mRNA_GFP__k2r],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_GFP__reaction1],ParameterGroup=Parameters,Parameter=pool_mRNA_GFP__kmr" value="9.9999999999999995e-08" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_mRNA_GFP__kmr],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_GFP__reaction2]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_mRNA_GFP__reaction2],ParameterGroup=Parameters,Parameter=k1" value="0.00056999999999999998" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_mRNA_GFP__kd],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction1]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction1],ParameterGroup=Parameters,Parameter=k1" value="129696.29849815887" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_deg__k1],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction2]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction2],ParameterGroup=Parameters,Parameter=k1" value="0.70763191182029639" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_deg__k_1],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction3]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction3],ParameterGroup=Parameters,Parameter=k1" value="0.00027" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_deg__kdx],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction4]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction4],ParameterGroup=Parameters,Parameter=k1" value="0.00027" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_deg__kdp],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction5]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction5],ParameterGroup=Parameters,Parameter=k1" value="0.00027" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_deg__kdxp],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction6]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction6],ParameterGroup=Parameters,Parameter=k1" value="8.25e-05" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_deg__kdg],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction7]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction7],ParameterGroup=Parameters,Parameter=k1" value="120099.37256908913" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_deg__kc],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction8]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=cell,Vector=Reactions[pool_deg__reaction8],ParameterGroup=Parameters,Parameter=k1" value="0.0023" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=cell,Vector=Values[pool_deg__kdf],Reference=InitialValue>
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
    </ListOfModelParameterSets>
    <StateTemplate>
      <StateTemplateVariable objectReference="Model_0"/>
      <StateTemplateVariable objectReference="Metabolite_14"/>
      <StateTemplateVariable objectReference="Metabolite_11"/>
      <StateTemplateVariable objectReference="Metabolite_8"/>
      <StateTemplateVariable objectReference="Metabolite_5"/>
      <StateTemplateVariable objectReference="Metabolite_3"/>
      <StateTemplateVariable objectReference="Metabolite_12"/>
      <StateTemplateVariable objectReference="Metabolite_13"/>
      <StateTemplateVariable objectReference="Metabolite_10"/>
      <StateTemplateVariable objectReference="Metabolite_6"/>
      <StateTemplateVariable objectReference="Metabolite_9"/>
      <StateTemplateVariable objectReference="Metabolite_15"/>
      <StateTemplateVariable objectReference="Metabolite_0"/>
      <StateTemplateVariable objectReference="Metabolite_2"/>
      <StateTemplateVariable objectReference="Metabolite_4"/>
      <StateTemplateVariable objectReference="Metabolite_7"/>
      <StateTemplateVariable objectReference="Metabolite_1"/>
      <StateTemplateVariable objectReference="Compartment_0"/>
      <StateTemplateVariable objectReference="Compartment_1"/>
      <StateTemplateVariable objectReference="ModelValue_0"/>
      <StateTemplateVariable objectReference="ModelValue_1"/>
      <StateTemplateVariable objectReference="ModelValue_2"/>
      <StateTemplateVariable objectReference="ModelValue_3"/>
      <StateTemplateVariable objectReference="ModelValue_4"/>
      <StateTemplateVariable objectReference="ModelValue_5"/>
      <StateTemplateVariable objectReference="ModelValue_6"/>
      <StateTemplateVariable objectReference="ModelValue_7"/>
      <StateTemplateVariable objectReference="ModelValue_8"/>
      <StateTemplateVariable objectReference="ModelValue_9"/>
      <StateTemplateVariable objectReference="ModelValue_10"/>
      <StateTemplateVariable objectReference="ModelValue_11"/>
      <StateTemplateVariable objectReference="ModelValue_12"/>
      <StateTemplateVariable objectReference="ModelValue_13"/>
      <StateTemplateVariable objectReference="ModelValue_14"/>
      <StateTemplateVariable objectReference="ModelValue_15"/>
      <StateTemplateVariable objectReference="ModelValue_16"/>
      <StateTemplateVariable objectReference="ModelValue_17"/>
      <StateTemplateVariable objectReference="ModelValue_18"/>
      <StateTemplateVariable objectReference="ModelValue_19"/>
      <StateTemplateVariable objectReference="ModelValue_20"/>
      <StateTemplateVariable objectReference="ModelValue_21"/>
      <StateTemplateVariable objectReference="ModelValue_22"/>
      <StateTemplateVariable objectReference="ModelValue_23"/>
      <StateTemplateVariable objectReference="ModelValue_24"/>
      <StateTemplateVariable objectReference="ModelValue_25"/>
      <StateTemplateVariable objectReference="ModelValue_26"/>
      <StateTemplateVariable objectReference="ModelValue_27"/>
      <StateTemplateVariable objectReference="ModelValue_28"/>
    </StateTemplate>
    <InitialState type="initialState">
      0 0 0 0 0 0 0 0 0 0 0 0 2000 1.0006993012443004 1.0006993012443004 1.0006993012443004 5000 2.9000000000000002e-15 3.9099999999999999e-14 0.46412364270000001 8.7508577715315919e-07 0.00055000000000000003 0.00056999999999999998 0.59280555779999999 1.5518356947019932e-11 0.00055000000000000003 0.00056999999999999998 0.21357830350000001 9.7155802720000002e-06 0.00055000000000000003 0.00056999999999999998 0.01 9.9999999999999995e-08 0.00056999999999999998 0.01 9.9999999999999995e-08 0.00056999999999999998 0.01 9.9999999999999995e-08 0.00056999999999999998 129696.29849815887 0.70763191182029639 0.00027 0.00027 0.00027 8.25e-05 120099.37256908913 0.0023 
    </InitialState>
  </Model>
  <ListOfTasks>
    <Task key="Task_13" name="Steady-State" type="steadyState" scheduled="false" updateModel="false">
      <Report reference="Report_10" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="JacobianRequested" type="bool" value="1"/>
        <Parameter name="StabilityAnalysisRequested" type="bool" value="1"/>
      </Problem>
      <Method name="Enhanced Newton" type="EnhancedNewton">
        <Parameter name="Resolution" type="unsignedFloat" value="1e-10"/>
        <Parameter name="Derivation Factor" type="unsignedFloat" value="1.0000000000000001e-15"/>
        <Parameter name="Use Newton" type="bool" value="0"/>
        <Parameter name="Use Integration" type="bool" value="1"/>
        <Parameter name="Use Back Integration" type="bool" value="0"/>
        <Parameter name="Accept Negative Concentrations" type="bool" value="0"/>
        <Parameter name="Iteration Limit" type="unsignedInteger" value="1000"/>
        <Parameter name="Maximum duration for forward integration" type="unsignedFloat" value="1000000000000000"/>
        <Parameter name="Maximum duration for backward integration" type="unsignedFloat" value="1000000"/>
        <Parameter name="Target Criterion" type="string" value="Distance and Rate"/>
      </Method>
    </Task>
    <Task key="Task_12" name="Time-Course" type="timeCourse" scheduled="false" updateModel="false">
      <Report reference="Report_9" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="AutomaticStepSize" type="bool" value="0"/>
        <Parameter name="StepNumber" type="unsignedInteger" value="100000"/>
        <Parameter name="StepSize" type="float" value="1"/>
        <Parameter name="Duration" type="float" value="100000"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
        <Parameter name="Output Event" type="bool" value="0"/>
        <Parameter name="Start in Steady State" type="bool" value="0"/>
        <Parameter name="Use Values" type="bool" value="0"/>
        <Parameter name="Values" type="string" value=""/>
      </Problem>
      <Method name="Deterministic (LSODA)" type="Deterministic(LSODA)">
        <Parameter name="Integrate Reduced Model" type="bool" value="0"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="9.9999999999999995e-07"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="9.9999999999999998e-13"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="100000"/>
        <Parameter name="Max Internal Step Size" type="unsignedFloat" value="0"/>
      </Method>
    </Task>
    <Task key="Task_11" name="Scan" type="scan" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="Subtask" type="unsignedInteger" value="1"/>
        <ParameterGroup name="ScanItems">
        </ParameterGroup>
        <Parameter name="Output in subtask" type="bool" value="1"/>
        <Parameter name="Adjust initial conditions" type="bool" value="0"/>
        <Parameter name="Continue on Error" type="bool" value="0"/>
      </Problem>
      <Method name="Scan Framework" type="ScanFramework">
      </Method>
    </Task>
    <Task key="Task_10" name="Elementary Flux Modes" type="fluxMode" scheduled="false" updateModel="false">
      <Report reference="Report_8" target="" append="1" confirmOverwrite="1"/>
      <Problem>
      </Problem>
      <Method name="EFM Algorithm" type="EFMAlgorithm">
      </Method>
    </Task>
    <Task key="Task_9" name="Optimization" type="optimization" scheduled="false" updateModel="true">
      <Report reference="Report_7" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Subtask" type="cn" value="CN=Root,Vector=TaskList[Steady-State]"/>
        <ParameterText name="ObjectiveExpression" type="expression">
          (&lt;CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[GFP],Reference=ParticleNumber>-50)^2
        </ParameterText>
        <Parameter name="Maximize" type="bool" value="0"/>
        <Parameter name="Randomize Start Values" type="bool" value="0"/>
        <Parameter name="Calculate Statistics" type="bool" value="1"/>
        <ParameterGroup name="OptimizationItemList">
          <ParameterGroup name="OptimizationItem">
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=cell,Vector=Values[TU_ClpP__k2],Reference=InitialValue"/>
            <Parameter name="LowerBound" type="cn" value="0.5"/>
            <Parameter name="UpperBound" type="cn" value="1.51E+00"/>
            <Parameter name="StartValue" type="float" value="0.59280555779999999"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=cell,Vector=Values[TU_ClpP__km],Reference=InitialValue"/>
            <Parameter name="LowerBound" type="cn" value="1e-12"/>
            <Parameter name="UpperBound" type="cn" value="1e-06"/>
            <Parameter name="StartValue" type="float" value="1.5518356947019932e-11"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=cell,Vector=Values[TU_ClpX__k2],Reference=InitialValue"/>
            <Parameter name="LowerBound" type="cn" value="4.62E-01"/>
            <Parameter name="UpperBound" type="cn" value="1.39E+00"/>
            <Parameter name="StartValue" type="float" value="0.46412364267648593"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=cell,Vector=Values[TU_ClpX__km],Reference=InitialValue"/>
            <Parameter name="LowerBound" type="cn" value="1e-12"/>
            <Parameter name="UpperBound" type="cn" value="1e-6"/>
            <Parameter name="StartValue" type="float" value="8.7508577715315919e-07"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=cell,Vector=Values[pool_deg__k_1],Reference=InitialValue"/>
            <Parameter name="LowerBound" type="cn" value="0.1"/>
            <Parameter name="UpperBound" type="cn" value="1"/>
            <Parameter name="StartValue" type="float" value="0.70763191182029639"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=cell,Vector=Values[pool_deg__k1],Reference=InitialValue"/>
            <Parameter name="LowerBound" type="cn" value="1e5"/>
            <Parameter name="UpperBound" type="cn" value="1e8"/>
            <Parameter name="StartValue" type="float" value="129696.29849815887"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=cell,Vector=Values[pool_deg__kc],Reference=InitialValue"/>
            <Parameter name="LowerBound" type="cn" value="1e5"/>
            <Parameter name="UpperBound" type="cn" value="1e8"/>
            <Parameter name="StartValue" type="float" value="120099.37256908913"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=cell,Vector=Values[pool_deg__kdf],Reference=InitialValue"/>
            <Parameter name="LowerBound" type="cn" value="0.0023"/>
            <Parameter name="UpperBound" type="cn" value="0.0058"/>
            <Parameter name="StartValue" type="float" value="0.0023"/>
          </ParameterGroup>
        </ParameterGroup>
        <ParameterGroup name="OptimizationConstraintList">
        </ParameterGroup>
      </Problem>
      <Method name="Genetic Algorithm" type="GeneticAlgorithm">
        <Parameter name="Log Verbosity" type="unsignedInteger" value="0"/>
        <Parameter name="Number of Generations" type="unsignedInteger" value="200"/>
        <Parameter name="Population Size" type="unsignedInteger" value="20"/>
        <Parameter name="Random Number Generator" type="unsignedInteger" value="1"/>
        <Parameter name="Seed" type="unsignedInteger" value="0"/>
        <Parameter name="Mutation Variance" type="float" value="0.10000000000000001"/>
        <Parameter name="Stop after # Stalled Generations" type="unsignedInteger" value="0"/>
      </Method>
    </Task>
    <Task key="Task_8" name="Parameter Estimation" type="parameterFitting" scheduled="false" updateModel="false">
      <Report reference="Report_6" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Maximize" type="bool" value="0"/>
        <Parameter name="Randomize Start Values" type="bool" value="0"/>
        <Parameter name="Calculate Statistics" type="bool" value="1"/>
        <ParameterGroup name="OptimizationItemList">
        </ParameterGroup>
        <ParameterGroup name="OptimizationConstraintList">
        </ParameterGroup>
        <Parameter name="Steady-State" type="cn" value="CN=Root,Vector=TaskList[Steady-State]"/>
        <Parameter name="Time-Course" type="cn" value="CN=Root,Vector=TaskList[Time-Course]"/>
        <Parameter name="Create Parameter Sets" type="bool" value="0"/>
        <Parameter name="Use Time Sens" type="bool" value="0"/>
        <Parameter name="Time-Sens" type="cn" value=""/>
        <ParameterGroup name="Experiment Set">
        </ParameterGroup>
        <ParameterGroup name="Validation Set">
          <Parameter name="Weight" type="unsignedFloat" value="1"/>
          <Parameter name="Threshold" type="unsignedInteger" value="5"/>
        </ParameterGroup>
      </Problem>
      <Method name="Evolutionary Programming" type="EvolutionaryProgram">
        <Parameter name="Log Verbosity" type="unsignedInteger" value="0"/>
        <Parameter name="Number of Generations" type="unsignedInteger" value="200"/>
        <Parameter name="Population Size" type="unsignedInteger" value="20"/>
        <Parameter name="Random Number Generator" type="unsignedInteger" value="1"/>
        <Parameter name="Seed" type="unsignedInteger" value="0"/>
        <Parameter name="Stop after # Stalled Generations" type="unsignedInteger" value="0"/>
      </Method>
    </Task>
    <Task key="Task_7" name="Metabolic Control Analysis" type="metabolicControlAnalysis" scheduled="false" updateModel="false">
      <Report reference="Report_5" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Steady-State" type="key" value="Task_13"/>
      </Problem>
      <Method name="MCA Method (Reder)" type="MCAMethod(Reder)">
        <Parameter name="Modulation Factor" type="unsignedFloat" value="1.0000000000000001e-09"/>
        <Parameter name="Use Reder" type="bool" value="1"/>
        <Parameter name="Use Smallbone" type="bool" value="1"/>
      </Method>
    </Task>
    <Task key="Task_6" name="Lyapunov Exponents" type="lyapunovExponents" scheduled="false" updateModel="false">
      <Report reference="Report_4" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="ExponentNumber" type="unsignedInteger" value="3"/>
        <Parameter name="DivergenceRequested" type="bool" value="1"/>
        <Parameter name="TransientTime" type="float" value="0"/>
      </Problem>
      <Method name="Wolf Method" type="WolfMethod">
        <Parameter name="Orthonormalization Interval" type="unsignedFloat" value="1"/>
        <Parameter name="Overall time" type="unsignedFloat" value="1000"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="9.9999999999999995e-07"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="9.9999999999999998e-13"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="10000"/>
      </Method>
    </Task>
    <Task key="Task_5" name="Time Scale Separation Analysis" type="timeScaleSeparationAnalysis" scheduled="false" updateModel="false">
      <Report reference="Report_3" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="0.01"/>
        <Parameter name="Duration" type="float" value="1"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
      </Problem>
      <Method name="ILDM (LSODA,Deuflhard)" type="TimeScaleSeparation(ILDM,Deuflhard)">
        <Parameter name="Deuflhard Tolerance" type="unsignedFloat" value="0.0001"/>
      </Method>
    </Task>
    <Task key="Task_16" name="Sensitivities" type="sensitivities" scheduled="false" updateModel="false">
      <Report reference="Report_2" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="SubtaskType" type="unsignedInteger" value="1"/>
        <ParameterGroup name="TargetFunctions">
          <Parameter name="SingleObject" type="cn" value=""/>
          <Parameter name="ObjectListType" type="unsignedInteger" value="7"/>
        </ParameterGroup>
        <ParameterGroup name="ListOfVariables">
          <ParameterGroup name="Variables">
            <Parameter name="SingleObject" type="cn" value=""/>
            <Parameter name="ObjectListType" type="unsignedInteger" value="41"/>
          </ParameterGroup>
          <ParameterGroup name="Variables">
            <Parameter name="SingleObject" type="cn" value=""/>
            <Parameter name="ObjectListType" type="unsignedInteger" value="0"/>
          </ParameterGroup>
        </ParameterGroup>
      </Problem>
      <Method name="Sensitivities Method" type="SensitivitiesMethod">
        <Parameter name="Delta factor" type="unsignedFloat" value="0.001"/>
        <Parameter name="Delta minimum" type="unsignedFloat" value="9.9999999999999998e-13"/>
      </Method>
    </Task>
    <Task key="Task_15" name="Moieties" type="moieties" scheduled="false" updateModel="false">
      <Report reference="Report_1" target="" append="1" confirmOverwrite="1"/>
      <Problem>
      </Problem>
      <Method name="Householder Reduction" type="Householder">
      </Method>
    </Task>
    <Task key="Task_4" name="Cross Section" type="crosssection" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="AutomaticStepSize" type="bool" value="0"/>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="0.01"/>
        <Parameter name="Duration" type="float" value="1"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
        <Parameter name="Output Event" type="bool" value="0"/>
        <Parameter name="Start in Steady State" type="bool" value="0"/>
        <Parameter name="Use Values" type="bool" value="0"/>
        <Parameter name="Values" type="string" value=""/>
        <Parameter name="LimitCrossings" type="bool" value="0"/>
        <Parameter name="NumCrossingsLimit" type="unsignedInteger" value="0"/>
        <Parameter name="LimitOutTime" type="bool" value="0"/>
        <Parameter name="LimitOutCrossings" type="bool" value="0"/>
        <Parameter name="PositiveDirection" type="bool" value="1"/>
        <Parameter name="NumOutCrossingsLimit" type="unsignedInteger" value="0"/>
        <Parameter name="LimitUntilConvergence" type="bool" value="0"/>
        <Parameter name="ConvergenceTolerance" type="float" value="0"/>
        <Parameter name="Threshold" type="float" value="0"/>
        <Parameter name="DelayOutputUntilConvergence" type="bool" value="0"/>
        <Parameter name="OutputConvergenceTolerance" type="float" value="0"/>
        <ParameterText name="TriggerExpression" type="expression">
          
        </ParameterText>
        <Parameter name="SingleVariable" type="cn" value=""/>
      </Problem>
      <Method name="Deterministic (LSODA)" type="Deterministic(LSODA)">
        <Parameter name="Integrate Reduced Model" type="bool" value="0"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="9.9999999999999995e-07"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="9.9999999999999998e-13"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="100000"/>
        <Parameter name="Max Internal Step Size" type="unsignedFloat" value="0"/>
      </Method>
    </Task>
    <Task key="Task_3" name="Linear Noise Approximation" type="linearNoiseApproximation" scheduled="false" updateModel="false">
      <Report reference="Report_0" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Steady-State" type="key" value="Task_13"/>
      </Problem>
      <Method name="Linear Noise Approximation" type="LinearNoiseApproximation">
      </Method>
    </Task>
    <Task key="Task_2" name="Time-Course Sensitivities" type="timeSensitivities" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="AutomaticStepSize" type="bool" value="0"/>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="0.01"/>
        <Parameter name="Duration" type="float" value="1"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
        <Parameter name="Output Event" type="bool" value="0"/>
        <Parameter name="Start in Steady State" type="bool" value="0"/>
        <Parameter name="Use Values" type="bool" value="0"/>
        <Parameter name="Values" type="string" value=""/>
        <ParameterGroup name="ListOfParameters">
        </ParameterGroup>
        <ParameterGroup name="ListOfTargets">
        </ParameterGroup>
      </Problem>
      <Method name="LSODA Sensitivities" type="Sensitivities(LSODA)">
        <Parameter name="Integrate Reduced Model" type="bool" value="0"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="9.9999999999999995e-07"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="9.9999999999999998e-13"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="10000"/>
        <Parameter name="Max Internal Step Size" type="unsignedFloat" value="0"/>
      </Method>
    </Task>
  </ListOfTasks>
  <ListOfReports>
    <Report key="Report_10" name="Steady-State" taskType="steadyState" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Steady-State]"/>
      </Footer>
    </Report>
    <Report key="Report_9" name="Time-Course" taskType="timeCourse" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Time-Course],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Time-Course],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_8" name="Elementary Flux Modes" taskType="fluxMode" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Elementary Flux Modes],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_7" name="Optimization" taskType="optimization" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Object=Description"/>
        <Object cn="String=\[Function Evaluations\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Value\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Parameters\]"/>
      </Header>
      <Body>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Function Evaluations"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Best Value"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Best Parameters"/>
      </Body>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_6" name="Parameter Estimation" taskType="parameterFitting" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Object=Description"/>
        <Object cn="String=\[Function Evaluations\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Value\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Parameters\]"/>
      </Header>
      <Body>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Function Evaluations"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Best Value"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Best Parameters"/>
      </Body>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_5" name="Metabolic Control Analysis" taskType="metabolicControlAnalysis" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Metabolic Control Analysis],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Metabolic Control Analysis],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_4" name="Lyapunov Exponents" taskType="lyapunovExponents" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Lyapunov Exponents],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Lyapunov Exponents],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_3" name="Time Scale Separation Analysis" taskType="timeScaleSeparationAnalysis" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Time Scale Separation Analysis],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Time Scale Separation Analysis],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_2" name="Sensitivities" taskType="sensitivities" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Sensitivities],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Sensitivities],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_1" name="Moieties" taskType="moieties" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Moieties],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Moieties],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_0" name="Linear Noise Approximation" taskType="linearNoiseApproximation" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Linear Noise Approximation],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Linear Noise Approximation],Object=Result"/>
      </Footer>
    </Report>
  </ListOfReports>
  <ListOfPlots>
    <PlotSpecification name="plot" type="Plot2D" active="1" taskTypes="">
      <Parameter name="log X" type="bool" value="0"/>
      <Parameter name="log Y" type="bool" value="0"/>
      <ListOfPlotItems>
        <PlotItem name="ClpP.ParticleNumber|Time" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=cell,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[ClpP],Reference=ParticleNumber"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="ClpX.ParticleNumber|Time" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=cell,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[ClpX],Reference=ParticleNumber"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="GFP.ParticleNumber|Time" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=cell,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[GFP],Reference=ParticleNumber"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="Pol_II.ParticleNumber|Time" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=cell,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=cell,Vector=Compartments[nucleus],Vector=Metabolites[Pol_II],Reference=ParticleNumber"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="TU_ClpP__pGPD.ParticleNumber|Time" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=cell,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=cell,Vector=Compartments[nucleus],Vector=Metabolites[TU_ClpP__pGPD],Reference=ParticleNumber"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="TU_ClpP__pm_ClpP.ParticleNumber|Time" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=cell,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=cell,Vector=Compartments[nucleus],Vector=Metabolites[TU_ClpP__pm_ClpP],Reference=ParticleNumber"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="TU_ClpX__pGAL1.ParticleNumber|Time" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=cell,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=cell,Vector=Compartments[nucleus],Vector=Metabolites[TU_ClpX__pGAL1],Reference=ParticleNumber"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="TU_ClpX__pm_ClpX.ParticleNumber|Time" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=cell,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=cell,Vector=Compartments[nucleus],Vector=Metabolites[TU_ClpX__pm_ClpX],Reference=ParticleNumber"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="TU_GFP__pTs8.ParticleNumber|Time" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=cell,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=cell,Vector=Compartments[nucleus],Vector=Metabolites[TU_GFP__pTs8],Reference=ParticleNumber"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="TU_GFP__pm_GFP.ParticleNumber|Time" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=cell,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=cell,Vector=Compartments[nucleus],Vector=Metabolites[TU_GFP__pm_GFP],Reference=ParticleNumber"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="mRNA_ClpP.ParticleNumber|Time" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=cell,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[mRNA_ClpP],Reference=ParticleNumber"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="mRNA_ClpX.ParticleNumber|Time" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=cell,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[mRNA_ClpX],Reference=ParticleNumber"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="mRNA_GFP.ParticleNumber|Time" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=cell,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[mRNA_GFP],Reference=ParticleNumber"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="pool_deg__ClpXP.ParticleNumber|Time" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=cell,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[pool_deg__ClpXP],Reference=ParticleNumber"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="pool_deg__ClpXP_GFP.ParticleNumber|Time" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=cell,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[pool_deg__ClpXP_GFP],Reference=ParticleNumber"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="rib.ParticleNumber|Time" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=cell,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[rib],Reference=ParticleNumber"/>
          </ListOfChannels>
        </PlotItem>
      </ListOfPlotItems>
    </PlotSpecification>
    <PlotSpecification name="plot_1" type="Plot2D" active="1" taskTypes="">
      <Parameter name="log X" type="bool" value="0"/>
      <Parameter name="log Y" type="bool" value="0"/>
      <ListOfPlotItems>
        <PlotItem name="ClpP.ParticleNumber|Time" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=cell,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[ClpP],Reference=ParticleNumber"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="ClpX.ParticleNumber|Time" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=cell,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[ClpX],Reference=ParticleNumber"/>
          </ListOfChannels>
        </PlotItem>
        <PlotItem name="GFP.ParticleNumber|Time" type="Curve2D">
          <Parameter name="Line type" type="unsignedInteger" value="0"/>
          <Parameter name="Line subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Line width" type="unsignedFloat" value="1"/>
          <Parameter name="Symbol subtype" type="unsignedInteger" value="0"/>
          <Parameter name="Color" type="string" value="auto"/>
          <Parameter name="Recording Activity" type="string" value="during"/>
          <ListOfChannels>
            <ChannelSpec cn="CN=Root,Model=cell,Reference=Time"/>
            <ChannelSpec cn="CN=Root,Model=cell,Vector=Compartments[cytoplasm],Vector=Metabolites[GFP],Reference=ParticleNumber"/>
          </ListOfChannels>
        </PlotItem>
      </ListOfPlotItems>
    </PlotSpecification>
  </ListOfPlots>
  <GUI>
  </GUI>
  <SBMLReference file="cell.xml">
    <SBMLMap SBMLid="ClpP" COPASIkey="Metabolite_12"/>
    <SBMLMap SBMLid="ClpX" COPASIkey="Metabolite_11"/>
    <SBMLMap SBMLid="GFP" COPASIkey="Metabolite_13"/>
    <SBMLMap SBMLid="Pol_II" COPASIkey="Metabolite_0"/>
    <SBMLMap SBMLid="TU_ClpP__k2" COPASIkey="ModelValue_4"/>
    <SBMLMap SBMLid="TU_ClpP__kd" COPASIkey="ModelValue_7"/>
    <SBMLMap SBMLid="TU_ClpP__km" COPASIkey="ModelValue_5"/>
    <SBMLMap SBMLid="TU_ClpP__kmt" COPASIkey="ModelValue_6"/>
    <SBMLMap SBMLid="TU_ClpP__pGPD" COPASIkey="Metabolite_4"/>
    <SBMLMap SBMLid="TU_ClpP__pm_ClpP" COPASIkey="Metabolite_5"/>
    <SBMLMap SBMLid="TU_ClpP__reaction1" COPASIkey="Reaction_3"/>
    <SBMLMap SBMLid="TU_ClpP__reaction2" COPASIkey="Reaction_4"/>
    <SBMLMap SBMLid="TU_ClpP__reaction3" COPASIkey="Reaction_5"/>
    <SBMLMap SBMLid="TU_ClpX__k2" COPASIkey="ModelValue_0"/>
    <SBMLMap SBMLid="TU_ClpX__kd" COPASIkey="ModelValue_3"/>
    <SBMLMap SBMLid="TU_ClpX__km" COPASIkey="ModelValue_1"/>
    <SBMLMap SBMLid="TU_ClpX__kmt" COPASIkey="ModelValue_2"/>
    <SBMLMap SBMLid="TU_ClpX__pGAL1" COPASIkey="Metabolite_2"/>
    <SBMLMap SBMLid="TU_ClpX__pm_ClpX" COPASIkey="Metabolite_3"/>
    <SBMLMap SBMLid="TU_ClpX__reaction1" COPASIkey="Reaction_0"/>
    <SBMLMap SBMLid="TU_ClpX__reaction2" COPASIkey="Reaction_1"/>
    <SBMLMap SBMLid="TU_ClpX__reaction3" COPASIkey="Reaction_2"/>
    <SBMLMap SBMLid="TU_GFP__k2" COPASIkey="ModelValue_8"/>
    <SBMLMap SBMLid="TU_GFP__kd" COPASIkey="ModelValue_11"/>
    <SBMLMap SBMLid="TU_GFP__km" COPASIkey="ModelValue_9"/>
    <SBMLMap SBMLid="TU_GFP__kmt" COPASIkey="ModelValue_10"/>
    <SBMLMap SBMLid="TU_GFP__pTs8" COPASIkey="Metabolite_7"/>
    <SBMLMap SBMLid="TU_GFP__pm_GFP" COPASIkey="Metabolite_8"/>
    <SBMLMap SBMLid="TU_GFP__reaction1" COPASIkey="Reaction_6"/>
    <SBMLMap SBMLid="TU_GFP__reaction2" COPASIkey="Reaction_7"/>
    <SBMLMap SBMLid="TU_GFP__reaction3" COPASIkey="Reaction_8"/>
    <SBMLMap SBMLid="cytoplasm" COPASIkey="Compartment_1"/>
    <SBMLMap SBMLid="mRNA_ClpP" COPASIkey="Metabolite_6"/>
    <SBMLMap SBMLid="mRNA_ClpX" COPASIkey="Metabolite_10"/>
    <SBMLMap SBMLid="mRNA_GFP" COPASIkey="Metabolite_9"/>
    <SBMLMap SBMLid="nucleus" COPASIkey="Compartment_0"/>
    <SBMLMap SBMLid="pool_deg__ClpXP" COPASIkey="Metabolite_14"/>
    <SBMLMap SBMLid="pool_deg__ClpXP_GFP" COPASIkey="Metabolite_15"/>
    <SBMLMap SBMLid="pool_deg__k1" COPASIkey="ModelValue_21"/>
    <SBMLMap SBMLid="pool_deg__k_1" COPASIkey="ModelValue_22"/>
    <SBMLMap SBMLid="pool_deg__kc" COPASIkey="ModelValue_27"/>
    <SBMLMap SBMLid="pool_deg__kdf" COPASIkey="ModelValue_28"/>
    <SBMLMap SBMLid="pool_deg__kdg" COPASIkey="ModelValue_26"/>
    <SBMLMap SBMLid="pool_deg__kdp" COPASIkey="ModelValue_24"/>
    <SBMLMap SBMLid="pool_deg__kdx" COPASIkey="ModelValue_23"/>
    <SBMLMap SBMLid="pool_deg__kdxp" COPASIkey="ModelValue_25"/>
    <SBMLMap SBMLid="pool_deg__reaction1" COPASIkey="Reaction_15"/>
    <SBMLMap SBMLid="pool_deg__reaction2" COPASIkey="Reaction_16"/>
    <SBMLMap SBMLid="pool_deg__reaction3" COPASIkey="Reaction_17"/>
    <SBMLMap SBMLid="pool_deg__reaction4" COPASIkey="Reaction_18"/>
    <SBMLMap SBMLid="pool_deg__reaction5" COPASIkey="Reaction_19"/>
    <SBMLMap SBMLid="pool_deg__reaction6" COPASIkey="Reaction_20"/>
    <SBMLMap SBMLid="pool_deg__reaction7" COPASIkey="Reaction_21"/>
    <SBMLMap SBMLid="pool_deg__reaction8" COPASIkey="Reaction_22"/>
    <SBMLMap SBMLid="pool_mRNA_ClpP__k2r" COPASIkey="ModelValue_15"/>
    <SBMLMap SBMLid="pool_mRNA_ClpP__kd" COPASIkey="ModelValue_17"/>
    <SBMLMap SBMLid="pool_mRNA_ClpP__kmr" COPASIkey="ModelValue_16"/>
    <SBMLMap SBMLid="pool_mRNA_ClpP__reaction1" COPASIkey="Reaction_11"/>
    <SBMLMap SBMLid="pool_mRNA_ClpP__reaction2" COPASIkey="Reaction_12"/>
    <SBMLMap SBMLid="pool_mRNA_ClpX__k2r" COPASIkey="ModelValue_12"/>
    <SBMLMap SBMLid="pool_mRNA_ClpX__kd" COPASIkey="ModelValue_14"/>
    <SBMLMap SBMLid="pool_mRNA_ClpX__kmr" COPASIkey="ModelValue_13"/>
    <SBMLMap SBMLid="pool_mRNA_ClpX__reaction1" COPASIkey="Reaction_9"/>
    <SBMLMap SBMLid="pool_mRNA_ClpX__reaction2" COPASIkey="Reaction_10"/>
    <SBMLMap SBMLid="pool_mRNA_GFP__k2r" COPASIkey="ModelValue_18"/>
    <SBMLMap SBMLid="pool_mRNA_GFP__kd" COPASIkey="ModelValue_20"/>
    <SBMLMap SBMLid="pool_mRNA_GFP__kmr" COPASIkey="ModelValue_19"/>
    <SBMLMap SBMLid="pool_mRNA_GFP__reaction1" COPASIkey="Reaction_13"/>
    <SBMLMap SBMLid="pool_mRNA_GFP__reaction2" COPASIkey="Reaction_14"/>
    <SBMLMap SBMLid="rib" COPASIkey="Metabolite_1"/>
  </SBMLReference>
  <ListOfUnitDefinitions>
    <UnitDefinition key="Unit_1" name="meter" symbol="m">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_0">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        m
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_5" name="second" symbol="s">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_4">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        s
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_13" name="Avogadro" symbol="Avogadro">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_12">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Avogadro
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_15" name="dimensionless" symbol="1">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_14">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        1
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_17" name="item" symbol="#">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_16">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        #
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_35" name="liter" symbol="l">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_34">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        0.001*m^3
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_41" name="mole" symbol="mol">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_40">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Avogadro*#
      </Expression>
    </UnitDefinition>
  </ListOfUnitDefinitions>
</COPASI>
