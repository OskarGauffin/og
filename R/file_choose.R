file.choose <- function(){
  path <- gsub("\\", "/", base::file.choose(), fixed=T)
  clipboard_path <- paste0('"', path,'"')
  writeClipboard(clipboard_path)
  cat("The following path has been saved to clipboard:", path)
}


