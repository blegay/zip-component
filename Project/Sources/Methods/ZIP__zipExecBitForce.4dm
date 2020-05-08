//%attributes = {"invisible":true}
C_TEXT:C284($0;$vt_cmdPath)

If (Count parameters:C259>0)
	$vt_cmdPath:=$1
	
	If (Not:C34(<>vb_ZIP_execBitForced))
		<>vb_ZIP_execBitForced:=True:C214
		
		If (ENV_onWindows )  // windows
			
		Else   // os x
			
			C_BOOLEAN:C305($vb_ok)
			C_TEXT:C284($vt_cmd;$vt_in;$vt_out;$vt_err)
			
			$vt_cmd:="/bin/ls -l "+$vt_cmdPath
			$vt_in:=""
			$vt_out:=""
			$vt_err:=""
			
			LAUNCH EXTERNAL PROCESS:C811($vt_cmd;$vt_in;$vt_out;$vt_err)
			$vb_ok:=(ok=1)
			
			$vt_out:=LPE__removeLastLF ($vt_out)
			$vt_err:=LPE__removeLastLF ($vt_err)
			
			ZIP__moduleDebugDateTimeLine (4;Current method name:C684;"command : \""+$vt_cmd+"\", in : \""+$vt_in+"\", out : \""+$vt_out+"\", err : \""+$vt_err+"\". "+Choose:C955($vb_ok;"[OK]";"[KO]"))
			
			  //<Modif> Bruno LEGAY (BLE) (18/07/2016)
			If (Substring:C12($vt_out;1;10)#"-rwxr-xr-x")
				  //<Modif>
				
				  //$vt_cmd:="/bin/chmod ugo+rx,go-w "+$vt_cmdPath
				$vt_cmd:="/bin/chmod 755 "+$vt_cmdPath
				$vt_in:=""
				$vt_out:=""
				$vt_err:=""
				
				LAUNCH EXTERNAL PROCESS:C811($vt_cmd;$vt_in;$vt_out;$vt_err)
				$vb_ok:=(ok=1)
				
				$vt_out:=LPE__removeLastLF ($vt_out)
				$vt_err:=LPE__removeLastLF ($vt_err)
				
				ZIP__moduleDebugDateTimeLine (4;Current method name:C684;"command : \""+$vt_cmd+"\", in : \""+$vt_in+"\", out : \""+$vt_out+"\", err : \""+$vt_err+"\". "+Choose:C955($vb_ok;"[OK]";"[KO]"))
			End if 
		End if 
		
	End if 
	
End if 
