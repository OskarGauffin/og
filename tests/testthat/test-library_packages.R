test_that("library_packages", {

  out <- FALSE
  og::library_packages()
  out <- require("plyr")
  
  expect_equal(out, TRUE)
})
