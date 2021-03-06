#' Get location data
#'
#' Returns data for the specified location(s).
#'
#' @param ef An \code{epiflows} object
#' @param codes A character vector of location codes.
#'
#' @return A dataframe structured identically to the input location data,
#' but limited to the specified locations.
#'
#' @examples
#' flows <- do.call(make_epiflows, Mex_travel_2009)
#' get_location_data(flows, "MEX")
#'
#' @author Pawel Piatkowski
#'
#' @export
get_location_data <- function(ef, codes) {
  if (!is.vector(codes)) {
    stop("`codes` must be a vector")
  }
  matching_codes <- codes %in% get_codes(ef)
  if (!all(matching_codes)) {
    stop("Code not found: ", codes[!matching_codes])
  }
  ef$locationsdata[match(codes, ef$locationsdata$code), ]
}
