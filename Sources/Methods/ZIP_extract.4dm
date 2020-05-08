//%attributes = {"shared":true}

  //================================================================================
  //@xdoc-start : en
  //@name : ZIP_extract
  //@scope : public
  //@deprecated : no
  //@description : This method extract files from a zip archive
  //@parameter[0-OUT-result-TEXT] : ParamDescription
  //@parameter[1-IN-archivePath-TEXT] : path to the archive file (dos / HFS)
  //@parameter[2-IN-destinationPath-TEXT] : destination path (dos / HFS)
  //@parameter[3-IN-switches-TEXT] : optional switches (default "-y" assume Yes on all queries)
  //@notes :
  //@example : ZIP_extract 
  //@see : 
  //@version : 1.00.00
  //@author : Bruno LEGAY (BLE) - Copyrights A&C Consulting - 2020
  //@history : CREATION : Bruno LEGAY (BLE) - 01/06/2009, 10:55:23 - v1.00.00
  //@xdoc-end
  //================================================================================

C_TEXT:C284($0;$vt_result)  //result
C_TEXT:C284($1;$vt_archiveName)  //archive name
C_TEXT:C284($2;$vt_destinationDir)  //destination directory
C_TEXT:C284($3;$vt_switches)  //switches

C_LONGINT:C283($vl_nbParam)
$vl_nbParam:=Count parameters:C259
If ($vl_nbParam>1)
	
	$vt_archiveName:=$1
	$vt_destinationDir:=$2
	
	Case of 
		: ($vl_nbParam=2)
			$vt_switches:=" -y"  //-y: assume Yes on all queries
		Else 
			  //:($vl_nbParam=3)
			$vt_switches:=$3
	End case 
	
	ZIP__initAuto 
	
	C_TEXT:C284($vt_command)  //command
	$vt_command:="x"
	
	  //normalize the archive file path
	$vt_archiveName:=ZIP_filePathNormalize ($vt_archiveName)
	
	  //normalize the destination directory path
	$vt_destinationDir:=ZIP_filePathNormalize ($vt_destinationDir)
	$vt_switches:=$vt_switches+" -o"+$vt_destinationDir  //-o{Directory}: set Output directory
	
	$vt_result:=ZIP_exec ($vt_command;$vt_switches;$vt_archiveName)
End if 

$0:=$vt_result