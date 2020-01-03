test_that("test columns to vector", {
  
writeClipboard(readLines(system.file("testdata", package="og")))
column_to_vec()
expect_equal(readClipboard(), 'c(\"A\", \"B\", \"C\")')

})
