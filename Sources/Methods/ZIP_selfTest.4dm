//%attributes = {"shared":true}

  //================================================================================
  //@xdoc-start : en
  //@name : ZIP_selfTest
  //@scope : public
  //@deprecated : no
  //@description : This function will return true if the component is working, false otherwise 
  //@parameter[0-OUT-ok-BOOLEAN] : true if the component is working, false otherwise
  //@notes : the test is running a "zip" and "7z" compress/decompress test 
  //@example : ZIP_selfTest 
  //@see : 
  //@version : 1.00.00
  //@author : Bruno LEGAY (BLE) - Copyrights A&C Consulting - 2020
  //@history : CREATION : Bruno LEGAY (BLE) - 17/06/2010, 20:46:51 - v1.00.00
  //@xdoc-end
  //================================================================================

C_BOOLEAN:C305($0;$vb_ok)

Case of 
	: (Not:C34(ZIP__testSub ("test.7z")))
		$vb_ok:=False:C215
		
	: (Not:C34(ZIP__testSub ("test.zip")))
		$vb_ok:=False:C215
		
	Else 
		$vb_ok:=True:C214
End case 

$0:=$vb_ok