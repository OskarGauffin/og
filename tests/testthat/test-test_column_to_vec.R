test_that("test column_to_vec", {
  
  test <- function(){
    writeClipboard(readLines(system.file("testdata", package="og")))
    column_to_vec()
    readClipboard()
  }
  skip_on_travis(message='column_to_vec only works on windows')
  expect_equal(test(), 'c(\"A\", \"B\", \"C\")')
  
})
