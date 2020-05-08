//%attributes = {"shared":true}

  //================================================================================
  //@xdoc-start : en
  //@name : ZIP_filePathNormalize
  //@scope : public
  //@deprecated : no
  //@description : This function returns a normalized file path (adds quotes on Windows, HFS -> Posix + escape spaces on Mac) 
  //@parameter[0-OUT-normalizedFilePath-TEXT] : normalizedFilePath (DOS / posix)
  //@parameter[1-IN-filePath-TEXT] : file path (DOS / HFS)
  //@notes :
  //@example : ZIP_filePathNormalize 
  //@see : 
  //@version : 1.00.00
  //@author : Bruno LEGAY (BLE) - Copyrights A&C Consulting - 2020
  //@history : CREATION : Bruno LEGAY (BLE) - 01/06/2009, 10:27:03 - v1.00.00
  //@xdoc-end
  //================================================================================

C_TEXT:C284($0;$vt_normalizedFilePath)
C_TEXT:C284($1;$vt_filePath)

$vt_normalizedFilePath:=""

If (Count parameters:C259>0)
	$vt_filePath:=$1
	
	ZIP__initAuto 
	
	If (ENV_onWindows )
		  //add quotes aroud the path to support spaces in the path
		$vt_normalizedFilePath:="\""+$vt_filePath+"\""
	Else 
		  //convert the HFS path into a posix path (escape the spaces)
		$vt_normalizedFilePath:=FS_posix_macPathToUnixPath ($vt_filePath)
	End if 
	
	ZIP__moduleDebugDateTimeLine (4;Current method name:C684;"path in : \""+$vt_filePath+"\""+\
		", path out :\""+$vt_normalizedFilePath+"\"")
	
End if 

$0:=$vt_normalizedFilePath

