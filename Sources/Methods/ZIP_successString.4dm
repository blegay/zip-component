//%attributes = {"shared":true}

  //================================================================================
  //@xdoc-start : en
  //@name : ZIP_successString
  //@scope : public
  //@deprecated : no
  //@description : This function returns the standard 7za success string
  //@parameter[0-OUT-successString-TEXT] : success string
  //@notes : => "Everything is Ok" with appropriate CR/LF according to the plateform
  //@example : ZIP_successString 
  //@see : 
  //@version : 1.00.00
  //@author : Bruno LEGAY (BLE) - Copyrights A&C Consulting - 2020
  //@history : CREATION : Bruno LEGAY (BLE) - 17/06/2010, 20:48:29 - v1.00.00
  //@xdoc-end
  //================================================================================

C_TEXT:C284($1;$vt_successString)

If (ENV_onWindows )
	  //Si tout va bien, sur Windows, on devrait trouver ça dans $vt_out
	$vt_successString:="\r\nEverything is Ok\r\n"
	
Else 
	  //Si tout va bien, sur Mac OS, on devrait trouver ça dans $vt_out
	
	  //<Modif> Bruno LEGAY (BLE) (08/05/2020) - v2.00.03
	$vt_successString:="\nEverything is Ok\n"
	  //$vt_successString:="\n\nEverything is Ok\n"
	  //<Modif>
	
	If (False:C215)  // 7-Zip (A) 4.65
		  //   7-Zip (A) 4.65  Copyright (c) 1999-2009 Igor Pavlov  2009-02-03
		  //   p7zip Version 4.65 (locale=utf8,Utf16=on,HugeFiles=on,8 CPUs)
		  //   Scanning
		  //   
		  //   Creating archive /Users/ble/Library/Application Support/4D/testold.7z
		  //   
		  //   Compressing  test/7zip/test.txt      
		  //   Compressing  test/zip/test.txt      
		  //   
		  //   Everything is Ok
	End if 
	
	If (False:C215)  // 7-Zip (a) [64] 16.02
		  //   7-Zip (a) [64] 16.02 : Copyright (c) 1999-2016 Igor Pavlov : 2016-05-21
		  //   p7zip Version 16.02 (locale=utf8,Utf16=on,HugeFiles=on,64 bits,8 CPUs x64)
		  //   
		  //   Scanning the drive:
		  //   3 folders, 2 files, 92 bytes (1 KiB)
		  //   
		  //   Creating archive: /Users/ble/Library/Application Support/4D/test.7z
		  //   
		  //   Items to compress: 5
		  //   
		  //   
		  //   Files read from disk: 2
		  //   Archive size: 249 bytes (1 KiB)
		  //   Everything is Ok
	End if 
	
End if 

$0:=$vt_successString
