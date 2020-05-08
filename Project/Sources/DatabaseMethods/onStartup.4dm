
ZIP__xdocInit 


ARRAY TEXT:C222($tt_components;0)
COMPONENT LIST:C1001($tt_components)

If ((Find in array:C230($tt_components;"log4D_component")>0) | (Find in array:C230($tt_components;"DBG_component")>0))
	
	  //DBG_init
	EXECUTE METHOD:C1007("DBG_init")
	
End if 

ARRAY TEXT:C222($tt_components;0)
