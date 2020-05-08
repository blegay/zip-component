//%attributes = {"shared":true}

  //================================================================================
  //@xdoc-start : en
  //@name : ZIP_listResultParse
  //@scope : public
  //@deprecated : no
  //@description : This method will parse the list result into arrays 
  //@parameter[1-IN-listResult-TEXT] : list result
  //@parameter[2-OUT-relativePathArrayPtr-POINTER] : text array pointer for relative path (modified)
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
  //@history : CREATION : Bruno LEGAY (BLE) - 01/06/2009, 12:10:07 - v1.00.00
  //@xdoc-end
  //================================================================================

C_TEXT:C284($1;$vt_listResult)  //list result
C_POINTER:C301($2;$vp_relativeFilePathArrayPtr)  //file relative path array

If (Count parameters:C259>1)
	
	$vt_listResult:=$1
	$vp_relativeFilePathArrayPtr:=$2
	
	ZIP__initAuto 
	
	  //check the pointer type
	If (Type:C295($vp_relativeFilePathArrayPtr->)=Text array:K8:16)
		
		ARRAY TEXT:C222($tt_relativeFilePathArray;0)
		
		
		If (ENV_onWindows )
			  //replace CR+LF by LF
			$vt_listResult:=Replace string:C233($vt_listResult;"\r\n";"\n";*)
		End if 
		
		  //this is the file list delimiter
		C_TEXT:C284($vt_fileListSep)
		$vt_fileListSep:="------------------- ----- ------------ ------------  ------------------------\n"
		
		  //get the text after the first file list delimiter
		C_LONGINT:C283($vl_pos)
		$vl_pos:=Position:C15($vt_fileListSep;$vt_listResult;*)
		If ($vl_pos>0)
			  //remove the text before that delimiter (and the delimiter itself)
			$vt_listResult:=Substring:C12($vt_listResult;$vl_pos+Length:C16($vt_fileListSep))
			
			  //get the text before the second file list delimiter
			C_LONGINT:C283($vl_pos)
			$vl_pos:=Position:C15($vt_fileListSep;$vt_listResult;*)
			If ($vl_pos>0)
				  //remove the text after that delimiter (and the delimiter itself)
				$vt_listResult:=Substring:C12($vt_listResult;1;$vl_pos-1)
				
				ARRAY TEXT:C222($tt_lines;0)
				
				If (True:C214)
					C_COLLECTION:C1488($vc_lines;$vc_linesParsed)
					$vc_lines:=Split string:C1554($vt_listResult;"\n";sk ignore empty strings:K86:1+sk trim spaces:K86:2)
					$vc_linesParsed:=New collection:C1472
					
					C_TEXT:C284($vt_line)
					For each ($vt_line;$vc_lines)
						C_OBJECT:C1216($vo_line)
						$vo_line:=New object:C1471
						$vo_line.dateStr:=Substring:C12($vt_line;1;10)  //2009-04-26
						$vo_line.timeStr:=Substring:C12($vt_line;12;8)  //14:01:29
						$vo_line.attributes:=Substring:C12($vt_line;26;5)  //....A / D....
						$vo_line.size:=Substring:C12($vt_line;39;12)  //     3186312
						$vo_line.compressed:=Substring:C12($vt_line;40;12)  //     1173153
						$vo_line.path:=Substring:C12($vt_line;54)  //Resources/bin/osx/7za
						$vc_linesParsed.push($vo_line)
					End for each 
					
					COLLECTION TO ARRAY:C1562($vc_linesParsed;$tt_relativeFilePathArray;"path")
					
				Else 
					
					  //parse the lines into a array
					  //TAB_explode ($vt_listResult;"\n";->$tt_lines)
					
					  //C_LONGINT($i;$vl_nbFiles)
					  //$vl_nbFiles:=Size of array($tt_lines)
					
					  //TAB_resize (->$tt_relativeFilePathArray;$vl_nbFiles)
					
					  //C_TEXT($vt_line)
					  //C_TEXT($vt_dateTxt;$vt_timeTxt;$vt_attrTxt;$vt_sizeTxt;$vt_compressedTxt;$vt_path)
					
					  //  //loop through all the lines
					  //For ($i;1;$vl_nbFiles)
					  //$vt_line:=$tt_lines{$i}
					
					  //$vt_dateTxt:=Substring($vt_line;1;10)  //2009-04-26
					  //$vt_timeTxt:=Substring($vt_line;12;8)  //14:01:29
					  //$vt_attrTxt:=Substring($vt_line;26;5)  //....A / D....
					  //$vt_sizeTxt:=Substring($vt_line;39;12)  //     3186312
					  //$vt_compressedTxt:=Substring($vt_line;40;12)  //     1173153
					  //$vt_path:=Substring($vt_line;54)  //Resources/bin/osx/7za
					
					  //$tt_relativeFilePathArray{$i}:=$vt_path
					  //End for 
					
					  //ARRAY TEXT($tt_lines;0)
					
				End if 
				
			End if 
			
		End if 
		
		  //copy back the result into the array for which we were given a pointer
		  //%W-518.1
		COPY ARRAY:C226($tt_relativeFilePathArray;$vp_relativeFilePathArrayPtr->)
		  //%W+518.1
		
		ARRAY TEXT:C222($tt_relativeFilePathArray;0)
		
	End if 
	
End if 


  //7-Zip (a) [64] 16.02 : Copyright (c) 1999-2016 Igor Pavlov : 2016-05-21
  //p7zip Version 16.02 (locale=utf8,Utf16=on,HugeFiles=on,64 bits,8 CPUs x64)
  //
  //Scanning the drive for archives:
  //1 file, 4653417570 bytes (4438 MiB)                       
  //
  //Listing archive: /Users/ble/Documents/test.7z
  //
  //--
  //Path = /Users/ble/Documents/test.7z
  //Type = 7z
  //Physical Size = 4653417570
  //Headers Size = 178
  //Method = LZMA2:26 7zAES
  //Solid = -
  //Blocks = 1
  //   
  //   Date      Time    Attr         Size   Compressed  Name
  //------------------- ----- ------------ ------------  ------------------------
  //2020-05-08 01:23:17 ....A  28975561288   4653417392  data[0001].4BK
  //------------------- ----- ------------ ------------  ------------------------
  //2020-05-08 01:23:17        28975561288   4653417392  1 files


  //7-Zip (A) 4.65  Copyright (c) 1999-2009 Igor Pavlov  2009-02-03
  //p7zip Version 4.65 (locale=utf8,Utf16=on,HugeFiles=on,2 CPUs)
  //
  //Listing archive: /Users/ble/Library/Preferences/4D/test.zip
  //
  //
  //   Date      Time    Attr         Size   Compressed  Name
  //------------------- ----- ------------ ------------  ------------------------
  //2009-06-01 11:35:28 D....            0            0  Resources
  //2009-06-01 11:37:26 D....            0            0  Resources/bin
  //2009-06-01 11:42:00 .....          242          166  Resources/bin/infos.txt
  //2009-06-01 11:35:54 D....            0            0  Resources/bin/osx
  //2009-04-26 16:01:28 .....      3186312      1102013  Resources/bin/osx/7za
  //2008-12-14 22:54:02 .....         1877          879  Resources/bin/osx/License
  //2009-06-01 11:40:10 D....            0            0  Resources/bin/win
  //2009-02-03 14:22:54 .....        88124        81185  Resources/bin/win/7-zip.chm
  //2009-02-03 14:21:10 .....       536064       270768  Resources/bin/win/7za.exe
  //2001-08-30 03:19:26 .....        26948         9193  Resources/bin/win/copying.txt
  //2009-02-03 14:36:10 .....         1288          609  Resources/bin/win/license.txt
  //2009-02-03 14:36:36 .....         1274          651  Resources/bin/win/readme.txt
  //------------------- ----- ------------ ------------  ------------------------
  //                               3842129      1465464  8 files, 4 folders
  //
  //
  //
  //
  //
  //7-Zip (A) 4.65  Copyright (c) 1999-2009 Igor Pavlov  2009-02-03
  //p7zip Version 4.65 (locale=utf8,Utf16=on,HugeFiles=on,2 CPUs)
  //
  //Listing archive: /Users/ble/Library/Preferences/4D/test.7z
  //
  //Method = LZMA
  //Solid = +
  //Blocks = 1
  //Physical Size = 1173550
  //Headers Size = 397
  //
  //   Date      Time    Attr         Size   Compressed  Name
  //------------------- ----- ------------ ------------  ------------------------
  //2009-04-26 14:01:29 ....A      3186312      1173153  Resources/bin/osx/7za
  //2008-12-14 19:54:02 ....A         1877               Resources/bin/osx/License
  //2009-02-03 11:22:54 ....A        88124               Resources/bin/win/7-zip.chm
  //2001-08-30 01:19:26 ....A        26948               Resources/bin/win/copying.txt
  //2009-06-01 09:42:01 ....A          242               Resources/bin/infos.txt
  //2009-02-03 11:36:10 ....A         1288               Resources/bin/win/license.txt
  //2009-02-03 11:36:36 ....A         1274               Resources/bin/win/readme.txt
  //2009-02-03 11:21:10 ....A       536064               Resources/bin/win/7za.exe
  //2009-06-01 09:40:10 D....            0            0  Resources/bin/win
  //2009-06-01 09:35:55 D....            0            0  Resources/bin/osx
  //2009-06-01 09:37:27 D....            0            0  Resources/bin
  //2009-06-01 09:35:29 D....            0            0  Resources
  //------------------- ----- ------------ ------------  ------------------------
  //                               3842129      1173153  8 files, 4 folders

