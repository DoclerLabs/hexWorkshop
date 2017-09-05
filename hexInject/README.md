# hexInject - Injector workshop

## Dependencies
### Haxe
Before all of you have to install Haxe on your computer : [haxe.org](http://haxe.org/download/)

## Install  
Install haxe libraries needed locally, in `.haxelib` folder
### Windows shortcut
run `install_dependencies.bat` in Console
### Unix shortcut
run `make` in Terminal
### Haxe
run `haxelib newrepo && haxelib install all --always`

## Run tests
### Unix
run `make run` in Terminal
### FlashDevelop
Project is ready to be use with FlashDevelop/HaxeDevelop IDE.
### VS Code + haxe plugin
With latest version of [vshaxe plugin](https://github.com/vshaxe/vshaxe/wiki/Installation) you have just to select `build.hxml` file to compile `F1 < Tasks:Run Build Task`.
### Haxe
run `haxe build.hxml`