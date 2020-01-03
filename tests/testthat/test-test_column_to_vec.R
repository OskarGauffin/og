test_that("test column_to_vec", {
  
  test <- function(){
    writeClipboard(readLines(system.file("testdata", package="og")))
    column_to_vec()
    readClipboard()
  }
  skip_on_travis()
  expect_equal(test(), 'c(\"A\", \"B\", \"C\")')
  
})
