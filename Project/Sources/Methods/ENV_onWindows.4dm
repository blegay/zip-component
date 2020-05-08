//%attributes = {"invisible":true}
  //ENV_onWindows

C_BOOLEAN:C305($0;$vb_windows)

$vb_windows:=Is Windows:C1573

  //Get the current plateform
  //C_LONGINT($vl_plateform)
  //PLATFORM PROPERTIES($vl_plateform)
  //$vb_windows:=($vl_plateform=Windows)

$0:=$vb_windows