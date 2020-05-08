//%attributes = {"shared":true}

  //================================================================================
  //@xdoc-start : en
  //@name : ZIP_addOne
  //@scope : public
  //@deprecated : no
  //@description : This method will compress a file or directory 
  //@parameter[0-OUT-result-TEXT] : 7z output
  //@parameter[1-IN-archivePath-TEXT] : archive path
  //@parameter[2-IN-fileOrDirPath-TEXT] : file (or dir) path to add to the archive
  //@parameter[3-IN-switches-TEXT] : switches (optional, default value : "")
  //@notes : the archive type (7z, zip, gzip) is automatically deducted from the archive extension
  //@example : 
  //
  //  C_TEXT($vt_result)
  //  $vt_result:=ZIP_addOne ($vt_archivePath;$vt_dirPath)
  //  If (ZIP_resultIsOk ($vt_result))
  //
  //    TEXT ARRAY($tt_files;0)
  //
  //    `list the files in the archive
  //    C_TEXT($vt_listResult)
  //    $vt_listResult:=ZIP_listResult ($vt_archivePath)
  //    ZIP_listResultParse ($vt_listResult;->$tt_files)
  //
  //    $vt_result:=ZIP_extract ($vt_archivePath;$vt_outpuDirTest)
  //    If (ZIP_resultIsOk ($vt_result))
  //      $vb_ok:=Vrai
  //    Else 
  //      ALERTE(Nom methode courante+" : ZIP_extract failed\r"+$vt_result)
  //    End If 
  //
  //    TEXT ARRAY($tt_files;0)
  //
  //  Else 
  //   ALERTE(Nom methode courante+" : ZIP_addOne failed\r"+$vt_result)
  //  End If 

  //@see : 
  //@version : 1.00.00
  //@author : Bruno LEGAY (BLE) - Copyrights A&C Consulting - 2020
  //@history : CREATION : Bruno LEGAY (BLE) - 01/06/2009, 11:38:53 - v1.00.00
  //@xdoc-end
  //================================================================================

C_TEXT:C284($0;$vt_result)  //result
C_TEXT:C284($1;$vt_archivePath)  //archive path
C_TEXT:C284($2;$vt_filePath)  //file path
C_TEXT:C284($3;$vt_switches)  //switches

$vt_result:=""

C_LONGINT:C283($vl_nbParam)
$vl_nbParam:=Count parameters:C259
If ($vl_nbParam>1)
	
	$vt_archivePath:=$1
	$vt_filePath:=$2
	
	Case of 
		: ($vl_nbParam=2)
			$vt_switches:=""
		Else 
			  //:($vl_nbParam=3)
			$vt_switches:=$3
	End case 
	
	ZIP__initAuto 
	
	C_TEXT:C284($vt_command)  //command
	$vt_command:="a"
	
	If (Length:C16($vt_switches)=0)
		$vt_switches:=ZIP_autoTypeSwitch ($vt_archivePath)
	Else 
		$vt_switches:=ZIP_autoTypeSwitch ($vt_archivePath)+" "+$vt_switches
	End if 
	
	$vt_archivePath:=ZIP_filePathNormalize ($vt_archivePath)
	$vt_filePath:=ZIP_filePathNormalize ($vt_filePath)
	
	$vt_result:=ZIP_exec ($vt_command;$vt_switches;$vt_archivePath;$vt_filePath)
	
End if 
$0:=$vt_result

