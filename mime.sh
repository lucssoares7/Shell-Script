#!/bin/bash
sed -e "s;<mime-type type=\"application/vnd.adobe.flash.movie\">;<mime-type type=\"application/x-shockwave-flash\">;g" /usr/share/mime/packages/freedesktop.org.xml > ar&&mv ar /usr/share/mime/packages/freedesktop.org.xml

update-mime-database /usr/share/mime

