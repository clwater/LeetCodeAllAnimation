#!/usr/bin/env bash

tag=$1
echo "auto help $tag"

if [[ $tag == '' ]]; then
     echo 'tag is empty'
     exit
fi

cd ..

folder=`find . -name $tag*`

folder=${folder/.\//}

cd $folder
gif=`find . -name $tag*_small.gif`

gif=${gif/.\//}

txt="|[$folder](/$folder/code.md)|$tag|-|![](/$folder/$gif)|&check;|"

echo $txt
# 现只支持mac的自动复制到粘贴板
echo $txt | pbcopy
