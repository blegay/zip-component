//%attributes = {"shared":true}

  //================================================================================
  //@xdoc-start : en
  //@name : ZIP_passwordSwitch
  //@scope : public
  //@deprecated : no
  //@description : This function returns the password switch for a given password
  //@parameter[0-OUT-passwordSwitch-TEXT] : passwordSwitch
  //@parameter[1-IN-password-TEXT] : password
  //@notes :
  //@example : ZIP_passwordSwitch ("sEcReT") => " -psEcReT "
  //@see : 
  //@version : 1.00.00
  //@author : Bruno LEGAY (BLE) - Copyrights A&C Consulting - 2020
  //@history : CREATION : Bruno LEGAY (BLE) - 01/06/2009, 11:31:54 - v1.00.00
  //@xdoc-end
  //================================================================================

C_TEXT:C284($0;$vt_passwordSwitch)  //password switch
C_TEXT:C284($1;$vt_password)  //password

$vt_passwordSwitch:=""
If (Count parameters:C259>0)
	
	$vt_password:=$1
	
	ZIP__initAuto 
	
	If (Length:C16($vt_password)>0)
		$vt_passwordSwitch:=" -p"+$vt_password+" "
	End if 
	
End if 
$0:=$vt_passwordSwitch