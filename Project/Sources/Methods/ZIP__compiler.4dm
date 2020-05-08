//%attributes = {"invisible":true}

  //declare the interprocess variable which will indicate if the module had been inited once (interprocess)
  //initialized, used in ZIP_init
C_BOOLEAN:C305(<>vb_ZIP_init)

  //declare the interprocess variable which will contain the name of the debug method
  //initialized in ZIP__initSub
  //used in ZIP__moduleDebugDateTimeLine
C_TEXT:C284(<>vt_ZIP_dbgMethodName)


C_TEXT:C284(<>vt_ZIP_execPath)
C_BOOLEAN:C305(<>vb_ZIP_execBitForced)