//%attributes = {"shared":true}

  //================================================================================
  //@xdoc-start : en
  //@name : ZIP_7zaVersGet
  //@scope : public
  //@deprecated : no
  //@description : This function returns 7za version
  //@parameter[0-OUT-version-TEXT] : 7za executable version (e.g. "4.65")
  //@notes :
  //@example : ZIP_7zaVersGet 
  //@see : 
  //@version : 1.00.00
  //@author : Bruno LEGAY (BLE) - Copyrights A&C Consulting - 2016
  //@history : CREATION : Bruno LEGAY (BLE) - 29/01/2016, 09:31:59 - v1.00.00
  //@xdoc-end
  //================================================================================

C_TEXT:C284($0;$vt_version)

C_TEXT:C284($vt_7zaOut)
$vt_7zaOut:=ZIP_exec ("")
  //ALERTE($vt_7zaOut)

If (False:C215)
	  //   7za 
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
End if 

If (False:C215)  // sample output v9.20
	  //  7-Zip (A) [64] 9.20  Copyright (c) 1999-2010 Igor Pavlov  2010-11-18
	  //  p7zip Version 9.20 (locale=utf8,Utf16=on,HugeFiles=on,8 CPUs)
	  //  
	  //  Usage: 7za <command> [<switches>...] <archive_name> [<file_names>...]
	  //         [<@listfiles...>]
	  //  
	  //  <Commands>
	  //    a: Add files to archive
	  //    b: Benchmark
	  //    d: Delete files from archive
	  //    e: Extract files from archive (without using directory names)
	  //    l: List contents of archive
	  //    t: Test integrity of archive
	  //    u: Update files to archive
	  //    x: eXtract files with full paths
	  //  <Switches>
	  //    -ai[r[-|0]]{@listfile|!wildcard}: Include archives
	  //    -ax[r[-|0]]{@listfile|!wildcard}: eXclude archives
	  //    -bd: Disable percentage indicator
	  //    -i[r[-|0]]{@listfile|!wildcard}: Include filenames
	  //    -m{Parameters}: set compression Method
	  //    -o{Directory}: set Output directory
	  //    -p{Password}: set Password
	  //    -r[-|0]: Recurse subdirectories
	  //    -scs{UTF-8 | WIN | DOS}: set charset for list files
	  //    -sfx[{name}]: Create SFX archive
	  //    -si[{name}]: read data from stdin
	  //    -slt: show technical information for l (List) command
	  //    -so: write data to stdout
	  //    -ssc[-]: set sensitive case mode
	  //    -t{Type}: Set type of archive
	  //    -u[-][p#][q#][r#][x#][y#][z#][!newArchiveName]: Update options
	  //    -v{Size}[b|k|m|g]: Create volumes
	  //    -w[{path}]: assign Work directory. Empty path means a temporary directory
	  //    -x[r[-|0]]]{@listfile|!wildcard}: eXclude filenames
	  //    -y: assume Yes on all queries
End if 

If (False:C215)  // sample output v4.65
	  //  7-Zip (A) 4.65  Copyright (c) 1999-2009 Igor Pavlov  2009-02-03
	  //  p7zip Version 4.65 (locale=utf8,Utf16=on,HugeFiles=on,8 CPUs)
	  //  
	  //  Usage: 7za <command> [<switches>...] <archive_name> [<file_names>...]
	  //         [<@listfiles...>]
	  //  
	  //  <Commands>
	  //    a: Add files to archive
	  //    b: Benchmark
	  //    d: Delete files from archive
	  //    e: Extract files from archive (without using directory names)
	  //    l: List contents of archive
	  //    t: Test integrity of archive
	  //    u: Update files to archive
	  //    x: eXtract files with full paths
	  //  <Switches>
	  //    -ai[r[-|0]]{@listfile|!wildcard}: Include archives
	  //    -ax[r[-|0]]{@listfile|!wildcard}: eXclude archives
	  //    -bd: Disable percentage indicator
	  //    -i[r[-|0]]{@listfile|!wildcard}: Include filenames
	  //    -m{Parameters}: set compression Method (see the manual)
	  //    -l: don't store symlinks; store the files/directories they point to
	  //    CAUTION : the scanning stage can never end because of symlinks like '..'
	  //              (ex:  ln -s .. ldir)
	  //    -o{Directory}: set Output directory
	  //    -p{Password}: set Password
	  //    -r[-|0]: Recurse subdirectories
	  //    (CAUTION: this flag does not do what you think, avoid using it)
	  //    -sfx[{name}]: Create SFX archive
	  //    -si[{name}]: read data from stdin
	  //    -slt: show technical information for l (List) command
	  //    -so: write data to stdout (eg: 7z a dummy -tgzip -so Doc.txt > archive.gz)
	  //    -ssc[-]: set sensitive case mode
	  //    -t{Type}: Set type of archive
	  //    -v{Size}[b|k|m|g]: Create volumes
	  //    -u[-][p#][q#][r#][x#][y#][z#][!newArchiveName]: Update options
	  //    -w[path]: assign Work directory. Empty path means a temporary directory
	  //    -x[r[-|0]]]{@listfile|!wildcard}: eXclude filenames
	  //    -y: assume Yes on all queries
End if 

  // regex mod multi line, case insensitive
  // search for a line starting with "p7zip Version "
  // and get the following string between two spaces
C_TEXT:C284($vt_regex)
$vt_regex:="(?mi)^p7zip Version (.+?) "

C_LONGINT:C283($vl_start)
$vl_start:=1

ARRAY LONGINT:C221($tl_pos;0)
ARRAY LONGINT:C221($tl_len;0)
If (Match regex:C1019($vt_regex;$vt_7zaOut;$vl_start;$tl_pos;$tl_len))
	$vt_version:=Substring:C12($vt_7zaOut;$tl_pos{1};$tl_len{1})
End if 
ARRAY LONGINT:C221($tl_pos;0)
ARRAY LONGINT:C221($tl_len;0)

$0:=$vt_version
