//%attributes = {"invisible":true}
C_LONGINT:C283($1;$vl_level)
C_TEXT:C284($2;$vt_methodName)
C_TEXT:C284($3;$vt_debugMessage)

If (Count parameters:C259>2)
	$vl_level:=$1
	$vt_methodName:=$2
	$vt_debugMessage:=$3
	
	If (Length:C16(<>vt_ZIP_dbgMethodName)>0)
		
		C_TEXT:C284($vt_moduleCode)
		$vt_moduleCode:="zip"
		
		EXECUTE METHOD:C1007(<>vt_ZIP_dbgMethodName;*;$vt_moduleCode;$vl_level;$vt_methodName;$vt_debugMessage)
		
		  //ENREGISTRER EVENEMENT(Vers message débogage;$vt_message;Message d’information)
	End if 
	
End if 
