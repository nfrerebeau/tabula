# SHOW METHODS
#' @include AllClasses.R
NULL

# DateEvent ====================================================================
setMethod(
  f = "show",
  signature = "DateEvent",
  definition = function(object) {
    fit <- object@model
    if (class(fit) == "S4") {
      cat("<DateEvent>")
    } else {
      sum_up <- stats::summary.lm(fit)
      cat(
        "<DateEvent>",
        "Modelled event date:",
        sprintf("- Residual standard error: %f", round(sum_up$sigma, 2)),
        sprintf("- Multiple R-squared: %f", round(sum_up$r.squared, 5)),
        sprintf("- Adjusted R-squared: %f", round(sum_up$adj.r.squared, 5)),
        sep = "\n"
      )
    }
  }
)

# DateMCD ======================================================================
setMethod(
  f = "show",
  signature = "DateMCD",
  definition = function(object) {
    cat("<DateMCD>\n")
    print(as.data.frame(object))
  }
)

# DiversityIndex ===============================================================
setMethod(
  f = "show",
  signature = "DiversityIndex",
  definition = function(object) {
    cat(sprintf("<%s: %s>\n", class(object), object[["method"]]))
    print(as.data.frame(object))
  }
)

# IncrementTest ===============================================================
setMethod(
  f = "show",
  signature = "IncrementTest",
  definition = function(object) {
    cat("<IncrementTest>\n")
    print(as.data.frame(object))
  }
)

# PermutationOrder =============================================================
setMethod(
  f = "show",
  signature = "PermutationOrder",
  definition = function(object) {
    k <- 50
    rows <- strtrim(paste0(object[["rows"]], collapse = " "), k)
    columns <- strtrim(paste0(object[["columns"]], collapse = " "), k)
    cat(
      sprintf("<%s: %s>", class(object), object[["method"]]),
      "Permutation order for matrix seriation:",
      sprintf("- Row order: %s", paste0(rows, "...")),
      sprintf("- Column order: %s", paste0(columns, "...")),
      sep = "\n"
    )
  }
)

# RefineCA =====================================================================
setMethod(
  f = "show",
  signature = "RefineCA",
  definition = function(object) {
    cut <- paste("(rows)", "(columns)",
                 round(object@cutoff, digits = 2),
                 collapse = " - ", sep = " ")
    row_keep <- length(object@row_keep)
    row_total <- length(object@row_length)
    row_pc <- round(row_keep * 100 / row_total)
    col_keep <- length(object@column_keep)
    col_total <- length(object@column_length)
    col_pc <- round(col_keep * 100 / col_total)
    cat(
      "<RefineCA>",
      "Partial bootstrap CA seriation refinement:",
      sprintf("- Cutoff values: %s", cut),
      sprintf("- Rows to keep: %d of %d (%g%%)", row_keep, row_total, row_pc),
      sprintf("- Columns to keep: %d of %d (%g%%)", col_keep, col_total, col_pc),
      sep = "\n")
  }
)
