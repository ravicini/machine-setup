# Machine Setup scripts

## To set up the basics
Run `init.ps1` in an admin powershell module

## To isntall applications

Run `install.ps1 <env>` to install applications
env can be: dev or game

## To update system config files

Run `update-dotfiles.ps1`

## Missing

- todoist (store)
- wsl, ubuntu
- windows terminal (store)

## Manual install

### Through Jet-Brains toolbox
- Rider
- ReSharper
- Android Studio

### npm global

- @angular/cli
- @ionic/cli
- azure-functions-core-tools
- cordova
- native-run
- parcel-bundler
- yarn

## Environment Variables

### User variables
- _JAVA_OPTS = -Xmx2g
- ANDROID_SDK_ROOT = C:\Users\marcoravicini\AppData\Local\Android\Sdk
- Path 
  - C:\Users\marcoravicini\.dotnet\tools
  - C:\Program Files\nodejs
  - %ANDROID_SDK_ROOT%\tools\bin
  - %ANDROID_SDK_ROOT%\platform-tools
  - %ANDROID_SDK_ROOT%\emulator
  - C:\ProgramData\AppGet\bin
  - C:\Users\marcoravicini\AppData\Local\Programs\Microsoft VS Code\

### System variables
- GRADLE_HOME = C:\ProgramData\chocolatey\lib\gradle\tools\gradle-6.0.1
- JAVA_HOME = C:\Program Files\Java\jdk1.8.0_231
- CLASSPATH = .;
- Path
  - C:\opt\starship