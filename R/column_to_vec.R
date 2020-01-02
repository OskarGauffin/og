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
# rows_to_vec()
# 
# # Press CTRL + V:
# c("A", "B", "C")
#'
#' @export
column_to_vec <- function(){
  names <- capture.output(dput(readClipboard()))
  writeClipboard(names)
}


