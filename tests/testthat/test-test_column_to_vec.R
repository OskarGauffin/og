test_that("test column_to_vec", {
  
writeClipboard(readLines(system.file("testdata", package="og")))
column_to_vec()
skip_on_travis("column_to_vec only works on windows")
expect_equal(readClipboard(), 'c(\"A\", \"B\", \"C\")')

})
