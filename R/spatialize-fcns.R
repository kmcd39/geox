
#' attach.geos
#'
#' @param x df with at least 1 column containing state+county geoid hierarchy (so
#'   that first 5 characters are state and county fips codes)
#' @param geoid.col column representing geoids
#' @param query_fcn function to query geos from census api. Defau9lt gets tracts
#' @param ... passed onto `query_fcn`
#'
#' @return `x`, as `sf` object with geometries attached
#'
#' @export attach.geos
attach.geos <- function(x, geoid.col = 'geoid'
                        ,query_fcn = tigris::tracts
                        ,crs = 4326
                        ,...) {

  require(sf)
  options(tigris_use_cache = TRUE)

  if("geometry" %in% colnames(x)) {
    sfx <- st_sf(x) %>% st_transform(crs)
    return(sfx)
  }

  # get county fps corresponding with tract/block group IDs
  .countyfps <-
    unique(
      substr(with(x,
                  get(geoid.col)),
             1,5))

  params <- list(...)
  ctsf <- map_dfr(.countyfps,
                  ~do.call(query_fcn,
                           c(list(substr(.x, 1,2),
                                  substr(.x, 3,5)),
                             params)))  # (do.call to pass on ... params)
  ctsf <- ctsf %>% select(geoid = GEOID, geometry)

  x <- x %>%
    left_join(ctsf
              ,by = setNames(geoid.col, "geoid") # hackey way to left_join variable colname
    )

  sfx <- x %>% st_sf() %>% st_transform(crs)

  return(sfx)
}


#' build.CZs
#'
#' CZs are groups of continguous counties. This function builds them from counties
#' downloaded from tigris
#'
#' @param .czs If not null, which CZs to build (5-char identifiers). Otherwise builds
#'   all of them.
#' @param year passed onto `tigris::counties`
#'
build.CZs <- function(.czs = NULL, crs = 4326) {

  counties <- tigris::counties(year = 2019)
  requireNamespace('xwalks')

  co2czs <- xwalks::co2cz
  if(!is.null(.czs))
    co2czs <-  co2czs %>%
    filter(cz %in% .czs)

  counties <- counties %>%
    left_join(.czs,
              by = c("GEOID" = "countyfp",
                     "STATEFP" = "statefp"))

  czs <- counties %>%
    st_transform(crs) %>%
    group_by(cz, cz_name) %>%
    summarise(., do_union = T)

  czs <- czs %>% filter(!is.na(cz))

  return(czs)
}