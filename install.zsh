#!/usr/bin/zsh
#
#=====================================
# 用于更新所有第三方tiddlywiki plugins
#=====================================

# 所有的插件对应的目录，都将被软链接到thirdparty文件夹中
typeset -r TIDDLYWIKI_PLUGINS_DIR="$XDG_DATA_HOME/tiddlywiki/plugins/thirdparty"

if [[ ! -d $TIDDLYWIKI_PLUGINS_DIR ]]; then
  print "目标目录$TIDDLYWIKI_PLUGINS_DIR 不存在，开始创建..."
  mkdir -p $TIDDLYWIKI_PLUGINS_DIR
  print "创建完成✅"
fi

# install tw5-relink

#  使用 Zsh glob 修饰符安全遍历:
#  (/) 仅匹配目录
#  (N) 空匹配时不报错、不展开字面量 "*"
for dir in ./tw5-relink/plugins/*(/N); do
  ln -s $(realpath $dir) -t $TIDDLYWIKI_PLUGINS_DIR/
done

# install TiddlyRemember

ln -s $(realpath "./TiddlyRemember/tw-plugin") $TIDDLYWIKI_PLUGINS_DIR/TiddlyRemember
