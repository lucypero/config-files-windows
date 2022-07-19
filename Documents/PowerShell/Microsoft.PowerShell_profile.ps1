Set-PSReadlineOption -EditMode vi

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

function EditHelixConfig {hx $env:appdata\helix\config.toml}
function EditBookmarks {hx ~\docs\bookmarks}
function EditPowershellProfile {hx $profile}
function GoToBookmark {
    $dir = Get-Content ~\docs\bookmarks | fzf
    Set-Location $dir
}
function AddToBookmarks {
    $dir = Get-Location
    Add-Content ~\docs\bookmarks $dir
}
function LaunchGodotEditor {
    Start-Process  C:\Users\Lucy\dev\lone_wolf_tech\godots\godot-3.4\bin\godot.windows.opt.tools.64.exe
}
function LaunchFavoriteProgram {
    $program = Get-Content ~\docs\fav-programs | fzf
    Start-Process $program
}
function CallExplorer {
    explorer .
}
function OpenHelixSession {
    Set-Location ~\docs\sessions
    $the_session = cat (Get-ChildItem ~\docs\sessions | Select -Exp Name | fzf)
    $cwd = echo $the_session | Select-Object -First 1
    Set-Location $cwd
    $hx_args = (($the_session -split '\r?\n').Trim() | Select-Object -Skip 2) -Join ' '
    Start-Process -FilePath hx -ArgumentList "$hx_args" -NoNewWindow -Wait
}
function OpenNotesSession {
    Set-Location ~\docs\sessions
    $the_session = cat ~\docs\sessions\notes
    $hx_args = (($the_session -split '\r?\n').Trim() | Select-Object -Skip 2) -Join ' '
    Start-Process -FilePath hx -ArgumentList "$hx_args" -NoNewWindow -Wait
}
function ConfigGit {
    git --git-dir=$HOME/.cfg/ --work-tree=$HOME $args
}
function LazyGitConfig {
    Set-Location
    lazygit --git-dir=$HOME/.cfg/ --work-tree=$HOME
}

Set-Alias ech EditHelixConfig
Set-Alias ecp EditPowershellProfile
Set-Alias f GoToBookmark
Set-Alias e hx
Set-Alias ba AddToBookmarks
Set-Alias eb EditBookmarks
Set-Alias ge LaunchGodotEditor
Set-Alias lp LaunchFavoriteProgram
Set-Alias ex CallExplorer
Set-Alias es OpenHelixSession
Set-Alias en OpenNotesSession
Set-Alias config ConfigGit
Set-Alias lg lazygit
Set-Alias clg LazyGitConfig

Set-PSReadLineKeyHandler -Chord Ctrl+o -ScriptBlock {
    lfcd
    [Microsoft.PowerShell.PSConsoleReadLine]::InvokePrompt()
}