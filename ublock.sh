#!/bin/bash 
wget https://addons.mozilla.org/firefox/downloads/file/685614/type:attachment/ublock_origin-1.13.8-an+fx+sm+tb.xpi
firefox -install-global-extension *.xpi
remove *.xpi
