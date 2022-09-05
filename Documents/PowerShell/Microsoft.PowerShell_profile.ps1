Set-PSReadlineOption -EditMode vi

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

$EDITOR = "subl"

### Aliases

Set-Alias ech EditHelixConfig
function EditHelixConfig {& $EDITOR $env:appdata\helix\config.toml}

Set-Alias ecp EditPowershellProfile
function EditPowershellProfile {& $EDITOR $profile}

Set-Alias f GoToBookmark
function GoToBookmark {
    # TODO: the output of `()` is wrong if there is a tilde. no idea how to fix it.
    Set-Location (Get-Content ~\docs\bookmarks | fzf)
}

Set-Alias e "$EDITOR"

Set-Alias ba AddToBookmarks
function AddToBookmarks {
    $dir = Get-Location
    Add-Content ~\docs\bookmarks $dir
}

Set-Alias eb EditBookmarks
function EditBookmarks {& $EDITOR ~\docs\bookmarks}

# launch godot editor (project picker)
Set-Alias ge LaunchGodotEditor
function LaunchGodotEditor {
    Start-Process  C:\Users\Lucy\dev\lone_wolf_tech\godots\godot-3.4\bin\godot.windows.opt.tools.64.exe -ArgumentList "-p"
}

# launch godot game on cwd
Set-Alias geh LaunchGodotGame
function LaunchGodotGame {
    Start-Process  C:\Users\Lucy\dev\lone_wolf_tech\godots\godot-3.4\bin\godot.windows.opt.tools.64.exe
}

Set-Alias lp LaunchFavoriteProgram
function LaunchFavoriteProgram {
    $program = Get-Content ~\docs\fav-programs | fzf
    Start-Process $program
}

Set-Alias ex CallExplorer
function CallExplorer {
    explorer .
}

Set-Alias es OpenHelixSession
function OpenHelixSession {
    Set-Location ~\docs\sessions
    $the_session = cat (Get-ChildItem ~\docs\sessions | Select -Exp Name | fzf)
    $cwd = echo $the_session | Select-Object -First 1
    Set-Location $cwd
    $helix_args = (($the_session -split '\r?\n').Trim() | Select-Object -Skip 2) -Join ' '
    Start-Process -FilePath hx -ArgumentList "$helix_args" -NoNewWindow -Wait
}

Set-Alias en OpenNotesSession
function OpenNotesSession {
    Set-Location ~\docs\sessions
    $the_session = cat ~\docs\sessions\notes
    $helix_args = (($the_session -split '\r?\n').Trim() | Select-Object -Skip 2) -Join ' '
    Start-Process -FilePath hx -ArgumentList "$helix_args" -NoNewWindow -Wait
}

Set-Alias config ConfigGit
function ConfigGit {
    git --git-dir=$HOME/.cfg/ --work-tree=$HOME $args
}

Set-Alias lg lazygit

Set-Alias clg LazyGitConfig
function LazyGitConfig {
    Set-Location
    lazygit --git-dir=$HOME/.cfg/ --work-tree=$HOME
}

$PRINT_LOG_SCRIPT = "$env:PREX_PATH\dev_scripts\print_logs.py"

Set-Alias logsp PrintLogs
function PrintLogs {
    & python $PRINT_LOG_SCRIPT $args
}

Set-Alias logspe PrintLogsErrors
function PrintLogsErrors {
    & python $PRINT_LOG_SCRIPT $args | rg -i error
}

### Keybinds

# C-O: calls lfcd
Set-PSReadLineKeyHandler -Chord Ctrl+o -ScriptBlock {
    lfcd
    [Microsoft.PowerShell.PSConsoleReadLine]::InvokePrompt()
}

### Fzf colors

$env:FZF_DEFAULT_OPTS = '--color=hl:#ffb8f6,fg+:-1,hl+:#ffb8f6,info:#ffb8f6,prompt:#ffb8f6,pointer:#ff91f0,marker:-1,spinner:#ffb8f6,header:#ffb8f6,bg:-1,bg+:-1'
