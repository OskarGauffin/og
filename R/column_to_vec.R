<<<<<<< HEAD
=======
# @column_to_vec.R
#
# @author Oskar Gauffin
#' ICTemporalPatternDiscovery
#'
#' @docType package
#' @name og
NULL

>>>>>>> 02d8533eefbc3ec30191f9b40dd3b092d5a88541
#' @title Column to vector
#' Takes a column of strings and puts them into an R-vector.
#'
#' @description
#' This function is used to convert a column of strings into an R-vector without inserting commas manually.
#'
#' @return
#' The vector.
<<<<<<< HEAD
#' # Example: Mark A, B, C  and press CTRL + C:
#' # A
#' # B
#' # C
=======
#'
#' @template Example
#' # # Example: Mark A, B, C  and press CTRL + C:
# A
# B
# C
>>>>>>> 02d8533eefbc3ec30191f9b40dd3b092d5a88541
# 
# # Run:
# rows_to_vec()
# 
# # Press CTRL + V:
# c("A", "B", "C")
#'
#' @export
<<<<<<< HEAD
column_to_vec <- function(){
  names <- capture.output(dput(readClipboard()))
  writeClipboard(names)
}
=======
#' column_to_vec <- function(){
#' names <- capture.output(dput(readClipboard()))
#' writeClipboard(names)
#' }
>>>>>>> 02d8533eefbc3ec30191f9b40dd3b092d5a88541
