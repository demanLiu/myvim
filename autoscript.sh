#!/bin/bash
read -p "Please input your vim installtion path(eg. /usr/share/vim/vim74/):" vim_path
while [ -z $is_ctags ]
do
    read -p "Do you want to install ctags?y/n:" is_ctags
done;
read -p "Please make sure that you have installed gcc"
base_dir=$(pwd)
plugin_dir=$base_dir/vim
if [ $is_ctags = "y"  ];
then
    cd $plugin_dir/ctags-5.8
    ./configure 
    make && make install
fi
#添加颜色
cp $plugin_dir/molokai.vim  $vim_path/colors
#添加插件
cp $plugin_dir/tabbar.vim  $vim_path/plugin/
cp $plugin_dir/phpVim/syntax/php.vim  $vim_path/syntax/
cp $plugin_dir/nerdtree/plugin/NERD_tree.vim $vim_path/plugin/
cp $plugin_dir/nerdtree/nerdtree_plugin/* $vim_path/plugin/
cp -r $plugin_dir/winmanager/plugin/* $vim_path/plugin/
cp -r $plugin_dir/neocomplcache-8.0/autoload/*  $vim_path/autoload/
cp -r $plugin_dir/neocomplcache-8.0/plugin/*  $vim_path/plugin/
cp -r $plugin_dir/neocomplcache-8.0/vest/*   $vim_path/vest/
cp $plugin_dir/taglist/plugin/taglist.vim  $vim_path/plugin/
#配置文件
cp $base_dir/vimrc   /etc/
