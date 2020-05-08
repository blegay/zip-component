//%attributes = {"invisible":true}
C_TEXT:C284($0;$1;$vt_text)

$vt_text:=""
If (Count parameters:C259>0)
	$vt_text:=$1
	
	C_LONGINT:C283($vl_length)
	$vl_length:=Length:C16($vt_text)
	If ($vl_length>0)
		
		If (Substring:C12($vt_text;$vl_length;1)="\n")
			$vt_text:=Substring:C12($vt_text;1;$vl_length-1)
		End if 
		
	End if 
	
End if 
$0:=$vt_text