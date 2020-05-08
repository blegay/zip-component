//%attributes = {"invisible":true}

  //================================================================================
  //@xdoc-start : en
  //@name : ZIP_testSub
  //@scope : public
  //@deprecated : no
  //@description : This method will test the component and compress the component "Resources" directory/folder 
  //@parameter[1-IN-archiveFileName-TEXT] : archive file name (allows to specify various compression types via the specified extension)
  //@notes :
  //@example : ZIP_testSub 
  // ZIP_testSub ("test.7z")
  // ZIP_testSub ("test.zip")
  //@see : 
  //@version : 1.00.00
  //@author : Bruno LEGAY (BLE) - Copyrights A&C Consulting - 2020
  //@history : CREATION : Bruno LEGAY (BLE) - 01/06/2009, 12:38:09 - v1.00.00
  //@xdoc-end
  //================================================================================

C_BOOLEAN:C305($0;$vb_ok)
C_TEXT:C284($1;$vt_archiveFileName)  //archive file name

$vb_ok:=False:C215
If (Count parameters:C259>0)
	$vt_archiveFileName:=$1
	
	C_TEXT:C284($vt_dirPath)  //directory to compress
	$vt_dirPath:=Get 4D folder:C485(Current resources folder:K5:16)+"test"
	
	
	C_TEXT:C284($vt_archivePath)  //archive name
	$vt_archivePath:=Get 4D folder:C485+$vt_archiveFileName
	
	  //clean before (remove the test archive)
	If (Test path name:C476($vt_archivePath)=Is a document:K24:1)
		DELETE DOCUMENT:C159($vt_archivePath)
	End if 
	
	  //Add the component "Resources" directory/folder to the archive (and create the archive)
	C_TEXT:C284($vt_result)
	$vt_result:=ZIP_addOne ($vt_archivePath;$vt_dirPath)
	If (ZIP_resultIsOk ($vt_result))
		
		ARRAY TEXT:C222($tt_files;0)
		
		  //list the files in the archive
		C_TEXT:C284($vt_listResult)
		$vt_listResult:=ZIP_listResult ($vt_archivePath)
		ZIP_listResultParse ($vt_listResult;->$tt_files)
		
		If (Size of array:C274($tt_files)=0)
			ALERT:C41(Current method name:C684+" : ZIP_listResultParse failed")
		End if 
		
		  //try to extract the files from the archive
		C_TEXT:C284($vt_outpuDirTest)
		$vt_outpuDirTest:=Get 4D folder:C485+"testZipextract"+Folder separator:K24:12  //FS_pathSeparator 
		If (Test path name:C476($vt_outpuDirTest)#Is a folder:K24:2)
			CREATE FOLDER:C475($vt_outpuDirTest)
		End if 
		
		$vt_result:=ZIP_extract ($vt_archivePath;$vt_outpuDirTest)
		If (ZIP_resultIsOk ($vt_result))
			$vb_ok:=True:C214
		Else 
			ALERT:C41(Current method name:C684+" : ZIP_extract failed\r"+$vt_result)
		End if 
		
		  //clean afterwards  (remove the test archive)
		  //FS_dirDelete ($vt_outpuDirTest)
		DELETE FOLDER:C693($vt_outpuDirTest;Delete with contents:K24:24)
		
		ARRAY TEXT:C222($tt_files;0)
		
	Else 
		ALERT:C41(Current method name:C684+" : ZIP_addOne failed\r"+$vt_result)
	End if 
	
	  //clean afterwards  (remove the test archive)
	If (Test path name:C476($vt_archivePath)=Is a document:K24:1)
		DELETE DOCUMENT:C159($vt_archivePath)
	End if 
	
End if 
$0:=$vb_ok
