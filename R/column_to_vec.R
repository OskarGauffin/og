#' @title Column to vector
#' Takes a column of strings and puts them into an R-vector.
#'
#' @description
#' This function is used to convert a column of strings into an R-vector without inserting commas manually.
#'
#' @return
#' The vector.
#' # Example: Mark A, B, C  and press CTRL + C:
#' # A
#' # B
#' # C
# 
# # Run:
# og::column_to_vec()
# 
# # Press CTRL + V and you should have:
# c("A", "B", "C")
#'
#' @export
column_to_vec <- function(){
  names <- capture.output(dput(readClipboard()))
  names <- trimws(names)
  writeClipboard(names)
}
