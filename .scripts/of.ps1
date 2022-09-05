$fe = [System.IO.Path]::GetExtension($args[0])
Switch ($fe) {
  ".mkv`"" {mpv $args[0]}
  default {subl $args[0]}    
}
