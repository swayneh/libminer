#' R Library Summary
#' Provides a brief summary of the package libraries
#' on your machine
#'
#' @param sizes a logical indicating whether or not to calculate sizes
#'
#' @return A data.frame containing the count of packages in each of your libraries.
#' @export
#'
#' @examples
#' lib_summary()
lib_summary <- function(sizes = FALSE) {
  pkgs <- utils::installed.packages()
  pkg_tbl <- table(pkgs[, "LibPath"])
  pkg_df <- as.data.frame(pkg_tbl, stringsAsFactors = FALSE)
  names(pkg_df) <- c("library", "n-packages")

  if (sizes) {
    pkg_df$lib_size <- map_dbl(
      pkg_df$library,
       ~ sum(fs::file_size(fs::dir_ls(.x, recurse = TRUE)))
    )
      }
      FUN.VALUE = double(1)

  pkg_df
}
