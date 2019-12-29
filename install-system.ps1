$apps = 
"7zip",
"draw-io",
"dropbox",
"git",
"gitkraken",
"keepass",
"teams",
"visual-studio-code",
"dotnet-core-sdk",
"node",
"powershell-core",
"skype",
"slack",
"spotify",
"visual-studio-2019-enterprise",
"vlc",
"whatsapp",
"",
"",
"",
"",
"",

"resharper"

foreach ($app in $apps) {
        appget install $app
}

# todoist (store)
# wsl, ubuntu
# windows terminal (store)
