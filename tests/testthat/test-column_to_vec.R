test_that("test column_to_vec", {
  
  test <- function(){
    writeClipboard(readLines(system.file("testdata", package="og")))
    column_to_vec()
    readClipboard()
  }
  skip_on_travis()
  expect_equal(test(), 'c(\"A\", \"B\", \"C\")')
  
})

test_that("copying from column to R vector works", {
  
  test_vector <- c('  1', '  2', '  3')
  writeClipboard(test_vector)
  test_vector <- eval(dput(stringr::str_trim(readClipboard())))
  
  expect_equal(test_vector, c("1","2","3"))
})
