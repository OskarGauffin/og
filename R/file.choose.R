#' @title file.choose
#' Inserts the selected string into the clipboard
#'
#' @description
#' This function copies the selected string into the clipboard, to avoid using the mouse.
#'
#' @return
#' Prints the selected string
#' 
#' file.choose()
#'
#' @export
file.choose <- function(){
  path <- gsub("\\", "/", base::file.choose(), fixed=T)
  clipboard_path <- paste0('"', path,'"')
  writeClipboard(clipboard_path)
  cat("The following path has been saved to clipboard:", path)
}