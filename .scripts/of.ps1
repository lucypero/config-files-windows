$fe = [System.IO.Path]::GetExtension($args[0])
Switch ($fe) {
  ".mkv`"" {mpv $args[0]}
  default {hx $args[0]}    
}
