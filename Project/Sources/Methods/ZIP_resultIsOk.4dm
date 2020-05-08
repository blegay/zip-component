//%attributes = {"shared":true}

  //================================================================================
  //@xdoc-start : en
  //@name : ZIP_resultIsOk
  //@scope : public
  //@deprecated : no
  //@description : This function parse the 7z executable result and return True if the operation was sucessful 
  //@parameter[0-OUT-ok-BOOLEAN] : true if succesful, false otherwise
  //@parameter[1-IN-result-TEXT] : execution result
  //@notes :
  //@example : 
  //
  //  C_TEXT($vt_result)
  //  $vt_result:=ZIP_addOne ($vt_archivePath;$vt_dirPath)
  //  If (ZIP_resultIsOk ($vt_result))
  //    ...
  //  Else
  //    ...
  //  End if
  //
  //@see : 
  //@version : 1.00.00
  //@author : Bruno LEGAY (BLE) - Copyrights A&C Consulting - 2020
  //@history : CREATION : Bruno LEGAY (BLE) - 17/06/2010, 20:44:19 - v1.00.00
  //@xdoc-end
  //================================================================================

C_BOOLEAN:C305($0;$vb_ok)
C_TEXT:C284($1;$vt_result)

$vb_ok:=False:C215
If (Count parameters:C259>0)
	$vt_result:=$1
	
	ZIP__initAuto 
	
	$vb_ok:=(Position:C15(ZIP_successString ;$vt_result)>0)
	
End if 
$0:=$vb_ok