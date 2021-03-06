#' Title
#'
#' @param path
#' @param ch_number
#' @param interactive
#' @param interactive_path
#' @param name
#'
#' @return
#' @export
#'
#' @examples
create_phase_metadata <- function(path = getwd(), ch_number = "ch1",
                           interactive = TRUE, interactive_path = "~/metadata", name = "pc",
                           bucket_mode = TRUE){
  file <- extract_filelist(path)

  #filtering the channel of interest
  file_f <- file %>%
    dplyr::filter(channel == ch_number)

  #I reformat the table
  file_ff <- file_f %>% reformat_filelist()

  write_metadata(file_ff, path = path, interactive = interactive, bucket_mode = bucket_mode)
}
