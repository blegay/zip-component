//%attributes = {"shared":true}

  //================================================================================
  //@xdoc-start : en
  //@name : ZIP_exec
  //@scope : public
  //@deprecated : no
  //@description : This function runs the 7z executable
  //@parameter[0-OUT-commandResult-TEXT] : command result
  //@parameter[1-IN-command-TEXT] : command
  //@parameter[2-IN-switches-TEXT] : switches/options (optional, default "")
  //@parameter[3-IN-archiveName-TEXT] : archive file path (dos/posix with space escaped) (optional, default "")
  //@parameter[3-IN-listOfFiles-TEXT] : list of file path (dos/posix with space escaped) (optional, default "")
  //@parameter[3-IN-fileList-TEXT] : path to a file containing file path (dos/posix with space escaped) (optional, default "")
  //@notes :
  //@example : 
  //
  //  C_TEXT($vt_command)  `command
  //  $vt_command:="a"
  //  
  //  $vt_switches:=$vt_switches+ZIP_autoTypeSwitch ($vt_archivePath)
  //  
  //  $vt_archivePath:=ZIP_filePathNormalize ($vt_archivePath)
  //  $vt_filePath:=ZIP_filePathNormalize ($vt_filePath)
  //  
  //  $vt_result:=ZIP_exec ($vt_command;$vt_switches;$vt_archivePath;$vt_filePath)
  //  
  //   7-Zip (a) [64] 16.02 : Copyright (c) 1999-2016 Igor Pavlov : 2016-05-21
  //   p7zip Version 16.02 (locale=utf8,Utf16=on,HugeFiles=on,64 bits,8 CPUs x64)
  //   
  //   Usage: 7za <command> [<switches>...] <archive_name> [<file_names>...]
  //          [<@listfiles...>]
  //   
  //   <Commands>
  //     a : Add files to archive
  //     b : Benchmark
  //     d : Delete files from archive
  //     e : Extract files from archive (without using directory names)
  //     h : Calculate hash values for files
  //     i : Show information about supported formats
  //     l : List contents of archive
  //     rn : Rename files in archive
  //     t : Test integrity of archive
  //     u : Update files to archive
  //     x : eXtract files with full paths
  //   
  //   <Switches>
  //     -- : Stop switches parsing
  //     -ai[r[-|0]]{@listfile|!wildcard} : Include archives
  //     -ax[r[-|0]]{@listfile|!wildcard} : eXclude archives
  //     -ao{a|s|t|u} : set Overwrite mode
  //     -an : disable archive_name field
  //     -bb[0-3] : set output log level
  //     -bd : disable progress indicator
  //     -bs{o|e|p}{0|1|2} : set output stream for output/error/progress line
  //     -bt : show execution time statistics
  //     -i[r[-|0]]{@listfile|!wildcard} : Include filenames
  //     -m{Parameters} : set compression Method
  //       -mmt[N] : set number of CPU threads
  //     -o{Directory} : set Output directory
  //     -p{Password} : set Password
  //     -r[-|0] : Recurse subdirectories
  //     -sa{a|e|s} : set Archive name mode
  //     -scc{UTF-8|WIN|DOS} : set charset for for console input/output
  //     -scs{UTF-8|UTF-16LE|UTF-16BE|WIN|DOS|{id}} : set charset for list files
  //     -scrc[CRC32|CRC64|SHA1|SHA256|*] : set hash function for x, e, h commands
  //     -sdel : delete files after compression
  //     -seml[.] : send archive by email
  //     -sfx[{name}] : Create SFX archive
  //     -si[{name}] : read data from stdin
  //     -slp : set Large Pages mode
  //     -slt : show technical information for l (List) command
  //     -snh : store hard links as links
  //     -snl : store symbolic links as links
  //     -sni : store NT security information
  //     -sns[-] : store NTFS alternate streams
  //     -so : write data to stdout
  //     -spd : disable wildcard matching for file names
  //     -spe : eliminate duplication of root folder for extract command
  //     -spf : use fully qualified file paths
  //     -ssc[-] : set sensitive case mode
  //     -ssw : compress shared files
  //     -stl : set archive timestamp from the most recently modified file
  //     -stm{HexMask} : set CPU thread affinity mask (hexadecimal number)
  //     -stx{Type} : exclude archive type
  //     -t{Type} : Set type of archive
  //     -u[-][p#][q#][r#][x#][y#][z#][!newArchiveName] : Update options
  //     -v{Size}[b|k|m|g] : Create volumes
  //     -w[{path}] : assign Work directory. Empty path means a temporary directory
  //     -x[r[-|0]]{@listfile|!wildcard} : eXclude filenames
  //     -y : assume Yes on all queries
  //
  //@see : 
  //@version : 1.00.00
  //@author : Bruno LEGAY (BLE) - Copyrights A&C Consulting - 2020
  //@history : CREATION : Bruno LEGAY (BLE) - 01/06/2009, 10:18:52 - v1.00.00
  //@xdoc-end
  //================================================================================

C_TEXT:C284($0;$vt_result)  //result
C_TEXT:C284($1;$vt_command)  //command
C_TEXT:C284($2;$vt_switches)  //switches
C_TEXT:C284($3;$vt_archiveName)  //archive name
C_TEXT:C284($4;$vt_fileNames)  //file name(s)
C_TEXT:C284($5;$vt_listFiles)  //listFiles

$vt_result:=""

C_LONGINT:C283($vl_nbParams)
$vl_nbParams:=Count parameters:C259
If ($vl_nbParams>0)
	
	Case of 
		: ($vl_nbParams=1)
			$vt_command:=$1
			$vt_switches:=""
			$vt_archiveName:=""
			$vt_fileNames:=""
			$vt_listFiles:=""
			
		: ($vl_nbParams=2)
			$vt_command:=$1
			$vt_switches:=$2
			$vt_archiveName:=""
			$vt_fileNames:=""
			$vt_listFiles:=""
			
		: ($vl_nbParams=3)
			$vt_command:=$1
			$vt_switches:=$2
			$vt_archiveName:=$3
			$vt_fileNames:=""
			$vt_listFiles:=""
			
		: ($vl_nbParams=4)
			$vt_command:=$1
			$vt_switches:=$2
			$vt_archiveName:=$3
			$vt_fileNames:=$4
			$vt_listFiles:=""
			
		Else 
			  //: ($vl_nbParams=5)
			$vt_command:=$1
			$vt_switches:=$2
			$vt_archiveName:=$3
			$vt_fileNames:=$4
			$vt_listFiles:=$5
	End case 
	
	ZIP__initAuto 
	
	C_TEXT:C284($vt_cmdPath)
	$vt_cmdPath:=ZIP_execPathGet 
	If (Length:C16($vt_cmdPath)>0)
		
		C_TEXT:C284($vt_cmd)
		If (ENV_onWindows )
			  //add quotes around the path to support spaces in the path
			$vt_cmd:="\""+$vt_cmdPath+"\""
			
			LPE_HideConsole 
		Else 
			  //convert the HFS path into a posix path (escape the spaces)
			$vt_cmd:=FS_posix_macPathToUnixPath ($vt_cmdPath)
			
			  //<Modif> Bruno LEGAY (BLE) (28/04/2015)
			ZIP__zipExecBitForce ($vt_cmd)
			  //<Modif>
			
		End if 
		
		  //add the command
		$vt_cmd:=$vt_cmd+" "+$vt_command+" "
		
		  //add the switches
		If (Length:C16($vt_switches)>0)
			$vt_cmd:=$vt_cmd+$vt_switches+" "
		End if 
		
		  //add the archive name
		If (Length:C16($vt_archiveName)>0)
			$vt_cmd:=$vt_cmd+$vt_archiveName+" "
		End if 
		
		  //add the file name(s)
		If (Length:C16($vt_fileNames)>0)
			$vt_cmd:=$vt_cmd+$vt_fileNames+" "
		End if 
		
		  //add the listFiles
		If (Length:C16($vt_listFiles)>0)
			$vt_cmd:=$vt_cmd+"@"+$vt_listFiles
		End if 
		
		  //Si (Faux)
		  //FIXER TEXTE DANS CONTENEUR($vt_cmd)
		  //Fin de si 
		
		C_TEXT:C284($vt_in;$vt_out;$vt_err)
		LAUNCH EXTERNAL PROCESS:C811($vt_cmd;$vt_in;$vt_out;$vt_err)
		C_BOOLEAN:C305($vb_ok)
		$vb_ok:=(ok=1)
		$vt_result:=$vt_out
		
		ZIP__moduleDebugDateTimeLine (Choose:C955($vb_ok;4;2);Current method name:C684;"command : \""+$vt_cmd+"\", out : \""+$vt_out+"\", err : \""+$vt_err+"\". "+Choose:C955($vb_ok;"[OK]";"[KO]"))
		
	End if 
	
End if 

$0:=$vt_result
