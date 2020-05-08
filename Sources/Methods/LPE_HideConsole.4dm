//%attributes = {"invisible":true}
  // LPE_HideConsole

C_BOOLEAN:C305($1;$vb_hideConsole)

If (Count parameters:C259=0)
	$vb_hideConsole:=True:C214
Else 
	$vb_hideConsole:=$1
End if 

C_TEXT:C284($vt_hideConsoleBooleanTxt)
If ($vb_hideConsole)
	$vt_hideConsoleBooleanTxt:="true"
Else 
	$vt_hideConsoleBooleanTxt:="false"
End if 

SET ENVIRONMENT VARIABLE:C812("_4D_OPTION_HIDE_CONSOLE";$vt_hideConsoleBooleanTxt)