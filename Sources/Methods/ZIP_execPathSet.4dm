//%attributes = {"shared":true}

  //================================================================================
  //@xdoc-start : en
  //@name : ZIP_execPathSet
  //@scope : public
  //@deprecated : no
  //@description : This method allows to set 7za executable path (to use another version of the emebdded 7za)
  //@parameter[1-IN-paramName-POINTER] : 7za exe path (dos on windows, HFS on Mac)
  //@notes : the function will check that the path is valid (the file exists)
  // The value is set for all processes for the duration of the "session"
  //@example : ZIP_execPathSet 
  //@see : 
  //@version : 1.00.00
  //@author : Bruno LEGAY (BLE) - Copyrights A&C Consulting - 2020
  //@history : CREATION : Bruno LEGAY (BLE) - 29/01/2016, 10:01:34 - v1.00.00
  //@xdoc-end
  //================================================================================

C_TEXT:C284($1;$vt_zipExePath)

If (Count parameters:C259>0)
	$vt_zipExePath:=$1
	
	If (Length:C16($vt_zipExePath)>0)
		
		If (Test path name:C476($vt_zipExePath)=Is a document:K24:1)
			<>vt_ZIP_execPath:=$vt_zipExePath
			
			ZIP__moduleDebugDateTimeLine (4;Current method name:C684;"7za path \""+$vt_zipExePath+"\"")
		End if 
		
	End if 
	
End if 
