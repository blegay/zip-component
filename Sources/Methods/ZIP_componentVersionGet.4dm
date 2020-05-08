//%attributes = {"shared":true}

  //================================================================================
  //@xdoc-start : en
  //@name : ZIP_componentVersionGet
  //@scope : public
  //@deprecated : no
  //@description : This function returns the component version
  //@parameter[0-OUT-componentVersion-TEXT] : component version (e.g. "3.00.00")
  //@notes :
  //@example : ZIP_componentVersionGet 
  //@see : 
  //@version : 3.00.00
  //@author : Bruno LEGAY (BLE) - Copyrights A&C Consulting - 2008-2020
  //@history :
  //  MODIFICATION : Bruno LEGAY (BLE) - 08/05/2020, 09:24:28 - v3.00.00
  //    - 4D v18 : refactoring
  //  MODIFICATION : Bruno LEGAY (BLE) - 08/05/2020, 09:52:17 - v2.00.03
  //    - fix ZIP_successString for 7z v16.02
  //  MODIFICATION : Bruno LEGAY (BLE) - 07/05/2020, 15:28:51 - v2.00.02
  //    - updated 7z binary from v4.65 2009-02-03 to 16.02 2016-05-21 mac / 16.04 2016-10-04 windows 
  //  MODIFICATION : Bruno LEGAY (BLE) - 17/12/2019, 17:53:26 - v2.00.01
  //    - FS_posix_macPathToUnixPath : using 4D native posix command
  //  MODIFICATION : Bruno LEGAY (BLE) - 20/07/2018, 13:18:12 - v2.00.00
  //    - v15    
  //  MODIFICATION : Bruno LEGAY (BLE) - 29/01/2016, 09:51:15 - v1.00.04
  //    - added ZIP_7zaVersGet, ZIP_execPathSet
  //    - renamed ZIP_execPath => ZIP_execPathGet
  //  MODIFICATION : Bruno LEGAY (BLE) - 20/11/2015, 09:57:56 - v1.00.03
  //    - added ZIP_componentVersionGet (replacing ZIP_versionGet)
  //  MODIFICATION : Bruno LEGAY (BLE) - 28/04/2015, 12:38:41 - v1.00.02
  //    - forced exec bit of 7za on os x 
  //  MODIFICATION : Bruno LEGAY (BLE) - 31/01/2015, 12:19:44 - v1.00.01
  //    - fixed comments in ZIP_addOne
  //  CREATION : Bruno LEGAY (BLE) - 04/12/2009, 23:39:22 - v1.00.00
  //@xdoc-end
  //================================================================================

C_TEXT:C284($0;$vt_componentVersion)

  //<Modif> Bruno LEGAY (BLE) (08/05/2020)
  //  - 4D v18 : refactoring
$vt_componentVersion:="3.00.00"
  //<Modif>

If (False:C215)
	
	  //<Modif> Bruno LEGAY (BLE) (08/05/2020)
	  //   - fix ZIP_successString for 7z v16.02
	  // $vt_componentVersion:="2.00.03"
	  //<Modif>
	
	  //<Modif> Bruno LEGAY (BLE) (07/05/2020)
	  //  - updated 7z binary from v4.65 2009-02-03 to 16.02 2016-05-21 mac / 16.04 2016-10-04 windows 
	  // $vt_componentVersion:="2.00.02"
	  //<Modif>
	
	  //<Modif> Bruno LEGAY (BLE) (17/12/2019)
	  // - FS_posix_macPathToUnixPath : using 4D native posix command
	  // $vt_componentVersion:="2.00.01"
	  //<Modif>
	
	  //<Modif> Bruno LEGAY (BLE) (20/07/2018)
	  // - v15
	  // $vt_componentVersion:="2.00.00"
	  //<Modif>
	
	  //<Modif> Bruno LEGAY (BLE) (29/01/2016)
	  //  - added ZIP_7zaVersGet, ZIP_execPathSet
	  //  - renamed ZIP_execPath => ZIP_execPathGet
	  // $vt_componentVersion:="1.00.04"
	  //<Modif>
	
	  //<Modif> Bruno LEGAY (BLE) (18/11/2015)
	  //  - added ZIP_componentVersionGet (replacing ZIP_versionGet)
	  // $vt_componentVersion:="1.00.03"
	  //<Modif>
	
	  //<Modif> Bruno LEGAY (BLE) (28/04/2015)
	  //   - forced exec bit of 7za on os x 
	  // $vt_componentVersion:="1.0.2"
	  //<Modif>
	
	  //<Modif> Bruno LEGAY (BLE) (31/01/2015)
	  // fixed comments in ZIP_addOne
	  // $vt_componentVersion:="1.0.1"
	  //<Modif>
	
	  //$vt_componentVersion:="1.0"
End if 

$0:=$vt_componentVersion