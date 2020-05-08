//%attributes = {"shared":true}

  //================================================================================
  //@xdoc-start : en
  //@name : ZIP_listResult
  //@scope : public
  //@deprecated : no
  //@description : This function list the files contained in the archive ("l" switch) 
  //@parameter[0-OUT-result-TEXT] : result
  //@parameter[1-IN-archivePath-TEXT] : archive path
  //@parameter[2-IN-switches-TEXT] : optional switches
  //@notes :
  //@example : 
  //
  //    TEXT ARRAY($tt_files;0)
  //
  //    `list the files in the archive
  //    C_TEXT($vt_listResult)
  //    $vt_listResult:=ZIP_listResult ($vt_archivePath)
  //    ZIP_listResultParse ($vt_listResult;->$tt_files)
  //
  //@see : 
  //@version : 1.00.00
  //@author : Bruno LEGAY (BLE) - Copyrights A&C Consulting - 2020
  //@history : CREATION : Bruno LEGAY (BLE) - 17/06/2010, 20:50:21 - v1.00.00
  //@xdoc-end
  //================================================================================

C_TEXT:C284($0;$vt_result)  //result
C_TEXT:C284($1;$vt_archivePath)  //archive path
C_TEXT:C284($2;$vt_switches)  //switches

$vt_result:=""

C_LONGINT:C283($vl_nbParam)
$vl_nbParam:=Count parameters:C259
If ($vl_nbParam>0)
	
	$vt_archivePath:=$1
	
	Case of 
		: ($vl_nbParam=1)
			$vt_switches:=""
		Else 
			  //:($vl_nbParam=2)
			$vt_switches:=$2
	End case 
	
	ZIP__initAuto 
	
	C_TEXT:C284($vt_command)  //command
	$vt_command:="l"
	
	$vt_archivePath:=ZIP_filePathNormalize ($vt_archivePath)
	
	$vt_result:=ZIP_exec ($vt_command;$vt_switches;$vt_archivePath)
	
End if 
$0:=$vt_result

