//%attributes = {"invisible":true}

  //================================================================================
  //@xdoc-start : en
  //@name : FS_pathToExtension
  //@scope : public
  //@deprecated : no
  //@description : This function returns the extension (text following the last ".") for a given path or file name 
  //@parameter[0-OUT-extension-TEXT] : file extension
  //@parameter[1-IN-filePath-TEXT] : filePath or file name
  //@notes : the function can be used with a path of a file which does not exist (this is pure string analysis function)
  //@example : FS_pathToExtension 
  //@see : 
  //@version : 1.00.00
  //@author : Bruno LEGAY (BLE) - Copyrights A$vt_sepC Consulting - 2008
  //@history : CREATION : Bruno LEGAY (BLE) - 14/11/2008, 15:10:27 - v1.00.00
  //@xdoc-end
  //================================================================================

C_TEXT:C284($0;$vt_extension)  //file extension
C_TEXT:C284($1;$vt_filePath)  //file path or file name

$vt_extension:=""

C_LONGINT:C283($vl_nbParam)
$vl_nbParam:=Count parameters:C259
If ($vl_nbParam>0)
	$vt_filePath:=$1
	
	C_TEXT:C284($vt_sep)
	$vt_sep:=Folder separator:K24:12  //FS_pathSeparator 
	  // C_ALPHA(1;$va_sep)
	
	C_LONGINT:C283($vl_length;$i)
	$vl_length:=Length:C16($vt_filePath)
	If ($vl_length>0)
		
		For ($i;$vl_length;1;-1)
			
			C_TEXT:C284($vt_char)
			$vt_char:=$vt_filePath[[$i]]
			  // C_ALPHA(1;$va_char)
			Case of 
				: ($vt_char=".")
					  //we have found the extension :-)
					$vt_extension:=Substring:C12($vt_filePath;$i+1)
					$i:=0  //exit the loop
					
				: ($vt_char=$vt_sep)
					$i:=0  //exit the loop
			End case 
			
		End for 
		
	End if 
	
Else 
	ALERT:C41(Current method name:C684+" : Nombre de parametres insuffisants.")
End if 

$0:=$vt_extension


