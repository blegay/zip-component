//%attributes = {"invisible":true}
  //================================================================================
  //@xdoc-start : en
  //@name : ENV_isWindows64bitsNew
  //@scope : public
  //@deprecated : no
  //@description : This function returns TRUE if Windows is 64 bits, FALSE otherwise
  //@parameter[0-OUT-paramName-TEXT] : TRUE if Windows is 64 bits, FALSE otherwise
  //@notes : 
  //@example : ENV_windows64Bits
  //@see : 
  //@version : 1.00.00
  //@author : Bruno LEGAY (BLE) - Copyrights A&C Consulting 2020
  //@history : 
  //  CREATION : Bruno LEGAY (BLE) - 07/05/2020, 14:50:46 - 2.00.01
  //@xdoc-end
  //================================================================================

C_BOOLEAN:C305($0;$vb_windows64Bits)
$vb_windows64Bits:=False:C215

ASSERT:C1129(ENV_onWindows ;"this method should only be called on Windows")

If (Version type:C495 ?? 1)
	$vb_windows64Bits:=True:C214  // 4D is 64bits, so the OS must be 64 bits
Else 
	
	C_TEXT:C284($vt_cmd;$vt_in;$vt_out;$vt_err)
	$vt_cmd:="wmic.exe os get osarchitecture"
	$vt_in:=""
	$vt_out:=""
	$vt_err:=""
	SET ENVIRONMENT VARIABLE:C812("_4D_OPTION_HIDE_CONSOLE";"true")
	LAUNCH EXTERNAL PROCESS:C811($vt_cmd;$vt_in;$vt_out;$vt_err)
	
	If (ok=1)
		  // "OSArchitecture  \r\r\n64 bits         \r\r\n\r\r\n"
		  // $vt_out:="OSArchitecture  \r\r\n64 bits         \r\r\n\r\r\n"
		
		If (Length:C16($vt_out)>0)
			ARRAY LONGINT:C221($tl_pos;0)
			ARRAY LONGINT:C221($tl_length;0)
			C_LONGINT:C283($vl_start)
			C_TEXT:C284($vt_outClean;$vt_regex)
			$vt_outClean:=$vt_out
			
			  // remove a consecutive white spaces and replace with a space
			$vt_regex:="(?m)(\\s+)"
			$vl_start:=1
			While (Match regex:C1019($vt_regex;$vt_outClean;$vl_start;$tl_pos;$tl_length))
				If ($tl_length{1}>1)
					$vt_outClean:=Delete string:C232($vt_outClean;$tl_pos{1}+1;$tl_length{1}-1)
				End if 
				$vt_outClean[[$tl_pos{1}]]:=" "
				$vl_start:=$tl_pos{1}+1
			End while 
			
			  // remove a leading white space (if any)
			$vt_regex:="^(\\s+)"
			$vl_start:=1
			If (Match regex:C1019($vt_regex;$vt_outClean;$vl_start;$tl_pos;$tl_length))
				$vt_outClean:=Delete string:C232($vt_outClean;$tl_pos{1};$tl_length{1})
			End if 
			
			  // remove a trailing white space (if any)
			$vt_regex:="(\\s+)$"
			$vl_start:=1
			If (Match regex:C1019($vt_regex;$vt_outClean;$vl_start;$tl_pos;$tl_length))
				$vt_outClean:=Delete string:C232($vt_outClean;$tl_pos{1};$tl_length{1})
			End if 
			
			ARRAY LONGINT:C221($tl_pos;0)
			ARRAY LONGINT:C221($tl_length;0)
		End if 
		
		C_TEXT:C284($vt_outEscaped)
		$vt_outEscaped:=Replace string:C233(Replace string:C233(Replace string:C233($vt_out;"\t";"\\t";*);"\n";"\\n";*);"\r";"\\r";*)
		ZIP__moduleDebugDateTimeLine (4;Current method name:C684;"LAUNCH EXTERNAL PROCESS \""+$vt_cmd+"\" => out : \""+$vt_outClean+"\" ("+$vt_outEscaped+")")
		
		  // $vt_outClean:="OSArchitecture 64 bits"
		$vb_windows64Bits:=($vt_outClean="OSArchitecture 64 bits")
	Else 
		ZIP__moduleDebugDateTimeLine (2;Current method name:C684;"LAUNCH EXTERNAL PROCESS failed \""+$vt_cmd+"\", out : \""+$vt_out+"\", error : \""+$vt_err+"\"")
	End if 
	
End if 

$0:=$vb_windows64Bits