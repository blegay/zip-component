//%attributes = {"invisible":true}

  //================================================================================
  //@xdoc-start : en
  //@name : FS_posix_macPathToUnixPath
  //@scope : public
  //@deprecated : no
  //@description : This function converts a mac path to a posix/unix path 
  //@parameter[0-OUT-posicPath-TEXT] : posix path
  //@parameter[1-IN-macPath-TEXT] : mac path
  //@parameter[2-IN-escapeSpace-BOOLEAN] : escape " " (space and only spaces) by a "\ " (optional, default : True)
  //@notes :
  //@example :  
  //  ALERT(FS_posix_macPathToUnixPath ("Leopard:Users:ble:Documents:Projects:fs component.zip"))
  //  ALERT(FS_posix_macPathToUnixPath ("Chaton:Users:ble:Documents:Projetcs:fs component.zip"))

  //  C_TEXTE($vt_path;$vt_posix;$vt_mac)
  //
  //  $vt_path:="Leopard:Users:ble:Documents:Projets:BaseRef v11:uuid_plugin.zip"
  //  $vt_posix:=FS_posix_macPathToUnixPath ($vt_path)
  //  $vt_mac:=FS_posix_unixPathToMacPath ($vt_posix)
  //
  //  $vt_path:="Chaton test:Users:ble:Documents:Projets:BaseRef v11:uuid_plugin.zip"
  //  $vt_posix:=FS_posix_macPathToUnixPath ($vt_path)
  //  $vt_mac:=FS_posix_unixPathToMacPath ($vt_posix)
  //@see : 
  //@version : 1.00.00
  //@author : Bruno LEGAY (BLE) - Copyrights A&C Consulting - 2020
  //@history : CREATION : Bruno LEGAY (BLE) - 14/11/2008, 15:37:00 - v1.00.00
  //@xdoc-end
  //================================================================================

C_TEXT:C284($0;$vt_unixPath)  //unix path
C_TEXT:C284($1;$vt_macPath)  //mac path
C_BOOLEAN:C305($2;$vb_escapeSpace)  //escape space

$vt_unixPath:=""

C_LONGINT:C283($vl_nbParam)
$vl_nbParam:=Count parameters:C259
If ($vl_nbParam>0)
	$vt_macPath:=$1
	
	Case of 
		: ($vl_nbParam=1)
			$vb_escapeSpace:=True:C214
			
		Else 
			  //: ($vl_nbParam=2)
			$vb_escapeSpace:=$2
	End case 
	
	If (Length:C16($vt_macPath)>0)
		
		If (Position:C15(":";$vt_macPath;*)#0)  //($vt_macPath≤1≥=":")
			
			$vt_unixPath:=Convert path system to POSIX:C1106($vt_macPath)
			
			If ($vb_escapeSpace)
				  //Replacing " " by "\ "
				$vt_unixPath:=Replace string:C233($vt_unixPath;" ";"\\ ";*)
				  // ce code n'a pas été testé (je pense notament au chemin de fichiers de backup "...data[0007].7z"
				  // qui marchent bien avec le code existant 
				  //$vt_unixPath:=FS__posix_escapeChar ($vt_unixPath)
				
			End if 
			
			ZIP__moduleDebugDateTimeLine (4;Current method name:C684;"path in : \""+$vt_macPath+"\""+\
				", path out :\""+$vt_unixPath+"\""+Choose:C955($vb_escapeSpace;" (space escaped)";""))
			
		Else 
			$vt_unixPath:=$vt_macPath
		End if 
		
	End if 
	
Else 
	ALERT:C41(Current method name:C684+" : not enough parameters.")
End if 
$0:=$vt_unixPath