//%attributes = {"invisible":true}
  //================================================================================
  //@xdoc-start : en
  //@name : ZIP__xdocInit
  //@scope : public
  //@deprecated : no
  //@description : This method itializes the xdoc component 
  //@notes : 
  //@example : ZIP__xdocInit
  //@see : 
  //@version : 1.00.00
  //@author : 
  //@history : 
  //  CREATION :  - 20/07/2018, 13:16:28 - 1.00.00
  //@xdoc-end
  //================================================================================

If (Not:C34(Is compiled mode:C492))
	
	ARRAY TEXT:C222($tt_components;0)
	COMPONENT LIST:C1001($tt_components)
	
	If (Find in array:C230($tt_components;"XDOC_component")>0)
		
		  //XDOC_componentPrefixSet ("S3")
		EXECUTE METHOD:C1007("XDOC_componentPrefixSet";*;"zip")
		
		  //XDOC_authorSet (1;"Bruno LEGAY (BLE)")
		EXECUTE METHOD:C1007("XDOC_authorSet";*;1;"Bruno LEGAY (BLE)")
		
		  //XDOC_authorSet (2;"Bruno LEGAY (BLE) - Copyrights A&C Consulting "+Chaine(Annee de(Date du jour)))
		EXECUTE METHOD:C1007("XDOC_authorSet";*;2;"Bruno LEGAY (BLE) - Copyrights A&C Consulting "+String:C10(Year of:C25(Current date:C33)))
		
		  //XDOC_versionTagSet (AWS_componentVersionGet )
		EXECUTE METHOD:C1007("XDOC_versionTagSet";*;ZIP_componentVersionGet )
		
	End if 
	
	ARRAY TEXT:C222($tt_components;0)
	
End if 