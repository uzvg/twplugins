#!/usr/bin/zsh
#

# 更新当前仓库中的所有 submodule
git submodule update --remote --rebase --recursive -j 2

