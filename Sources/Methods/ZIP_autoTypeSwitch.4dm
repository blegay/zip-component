//%attributes = {"shared":true}

  //================================================================================
  //@xdoc-start : en
  //@name : ZIP_autoTypeSwitch
  //@scope : public
  //@deprecated : no
  //@description : This function looks at the archive extension to deduct the archive type ("*7.z" => 7zip, "*.zip" => zip, etc...) 
  //@parameter[0-OUT-archiveTypeSwitch-TEXT] : archive type switch
  //@parameter[1-IN-archivePath-TEXT] : archive path
  //@notes :
  //  *.7z => 7z
  //  *.gzip => gzip
  //  *.gz => gzip
  //  *.zip => zip
  //  *.bzip2 => bzip2
  //  *.tar => tar
  //  *.iso => iso
  //  *.udf => udf
  //@example : ZIP_autoTypeSwitch ("...toto.gz") => " -tgzip "
  //
  //  C_TEXT($vt_command)  `command
  //  $vt_command:="a"
  //  
  //  $vt_switches:=$vt_switches+ZIP_autoTypeSwitch ($vt_archivePath)
  //  
  //  $vt_archivePath:=ZIP_filePathNormalize ($vt_archivePath)
  //  $vt_filePath:=ZIP_filePathNormalize ($vt_filePath)
  //  
  //  $vt_result:=ZIP_exec ($vt_command;$vt_switches;$vt_archivePath;$vt_filePath)
  //
  //@see : 
  //@version : 1.00.00
  //@author : Bruno LEGAY (BLE) - Copyrights A&C Consulting - 2020
  //@history : CREATION : Bruno LEGAY (BLE) - 01/06/2009, 11:23:13 - v1.00.00
  //@xdoc-end
  //================================================================================

C_TEXT:C284($0;$vt_archiveTypeSwitch)  //archive type switch
C_TEXT:C284($1;$vt_archivePath)  //archive path

$vt_archiveTypeSwitch:=""
If (Count parameters:C259>0)
	
	$vt_archivePath:=$1
	
	  //get the file extension
	C_TEXT:C284($vt_extension)
	$vt_extension:=FS_pathToExtension ($vt_archivePath)
	
	ZIP__moduleDebugDateTimeLine (4;Current method name:C684;"file path : \""+$vt_archivePath+"\" => extension : \""+$vt_extension+"\"")
	
	Case of 
		: ($vt_extension="7z")
			$vt_archiveTypeSwitch:="7z"
			
		: ($vt_extension="gzip")
			$vt_archiveTypeSwitch:="gzip"
			
		: ($vt_extension="gz")
			$vt_archiveTypeSwitch:="gzip"
			
		: ($vt_extension="zip")
			$vt_archiveTypeSwitch:="zip"
			
		: ($vt_extension="bzip2")
			$vt_archiveTypeSwitch:="bzip2"
			
		: ($vt_extension="tar")
			$vt_archiveTypeSwitch:="tar"
			
		: ($vt_extension="iso")
			$vt_archiveTypeSwitch:="iso"
			
		: ($vt_extension="udf")
			$vt_archiveTypeSwitch:="udf"
			
		Else 
			$vt_archiveTypeSwitch:=""
	End case 
	
	If (Length:C16($vt_archiveTypeSwitch)>0)
		$vt_archiveTypeSwitch:=" -t"+$vt_archiveTypeSwitch+" "
	End if 
	
	ZIP__moduleDebugDateTimeLine (4;Current method name:C684;"archive type switch : \""+$vt_archiveTypeSwitch+"\"")
	
End if 
$0:=$vt_archiveTypeSwitch