//%attributes = {"shared":true}

  //================================================================================
  //@xdoc-start : en
  //@name : ZIP_execPathGet
  //@scope : public
  //@deprecated : no
  //@description : This function returns the path of the 7za executable 
  //@parameter[0-OUT-zipExePath-TEXT] : 7za exe path (dos on windows, HFS on Mac)
  //@notes :
  //@example : ZIP_execPathGet 
  //@see : 
  //@version : 1.00.00
  //@author : Bruno LEGAY (BLE) - Copyrights A&C Consulting - 2020
  //@history : CREATION : Bruno LEGAY (BLE) - 01/06/2009, 09:50:34 - v1.00.00
  //@xdoc-end
  //================================================================================

C_TEXT:C284($0;$vt_zipExePath)

$vt_zipExePath:=""

ZIP__initAuto 

If (Length:C16(<>vt_ZIP_execPath)=0)
	
	  //the binary executables files atre in the resource file of the component
	C_TEXT:C284($vt_resourceDirPath)
	$vt_resourceDirPath:=Get 4D folder:C485(Current resources folder:K5:16)
	
	  //get the parts which change according to the plateform...
	C_TEXT:C284($vt_plateformDirName;$vt_execName)
	If (ENV_onWindows )
		$vt_plateformDirName:="win"+Folder separator:K24:12+Choose:C955(ENV_isWindows64bits ;"64bits";"32bits")
		$vt_execName:="7za.exe"
	Else 
		$vt_plateformDirName:="osx"
		$vt_execName:="7za"
	End if 
	
	$vt_zipExePath:=$vt_resourceDirPath+\
		"bin"+Folder separator:K24:12+\
		$vt_plateformDirName+Folder separator:K24:12+\
		$vt_execName
	
	If (Test path name:C476($vt_zipExePath)=Is a document:K24:1)
		<>vt_ZIP_execPath:=$vt_zipExePath
		
		ZIP__moduleDebugDateTimeLine (4;Current method name:C684;"7za path \""+$vt_zipExePath+"\". [OK]")
	Else 
		ZIP__moduleDebugDateTimeLine (2;Current method name:C684;"7za path \""+$vt_zipExePath+"\" not found. [KO]")
		$vt_zipExePath:=""
	End if 
	
Else 
	$vt_zipExePath:=<>vt_ZIP_execPath
End if 

$0:=$vt_zipExePath


