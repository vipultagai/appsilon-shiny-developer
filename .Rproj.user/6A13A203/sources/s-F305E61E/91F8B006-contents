#utility functions for calculations, etc.

get_ship_type <- function() {
  return(as.list(distinct(ships, ship_type))$ship_type)
}

#getting ship names based on ship type.

get_ship_names <- function(type) {
  subset(ships, ship_type == type, select = 'SHIPNAME') %>%
    as.data.frame() %>%
    distinct(SHIPNAME) %>%
    as.list() %>%
    return()
}

#distance calculation from coordinates on spherical objects.
#Radius of earth in meters (assumed/ google) = 6357000

get_distance <- function(lt1, lt2, ln1, ln2) {
  dist <- list()
  for (i in 1:length(lt1)) {
    dist[i] <-
      distHaversine(c(ln1[i], lt1[i]), c(ln2[i], lt2[i]), r = 6357000)
  }
  return(unlist(dist))
}

filter_data <- function(ship_name) {
  return(filter(ships, SHIPNAME == ship_name) %>% arrange(DATETIME))
}

# find observations from ship name and return either total distance
# or observations with maximum time b/w two consecutive observations.

find_observations <- function(obs, type = "max") {
  obs$LAT2 = lead(obs$LAT)
  obs$LON2 = lead(obs$LON)
  obs$dist = get_distance(obs$LAT, obs$LAT2, obs$LON, obs$LON2)
  
  if (type == 'max') {
    mx <- max(obs$dist, na.rm = TRUE)
    result <- obs[which(obs$dist == mx), ]
    if (length(result$LAT) > 1) {
      return(result[which(result$DATETIME == min(result$DATETIME))])
    }
    else{
      return(obs[which(obs$dist == mx), ])
    }
  }
  
  if (type == 'total') {
    return(round(sum(obs$dist, na.rm = TRUE)))
  }
}

#Logic for finding observation with maximum distance between two consecutive observations.

make_map <- function(result, obs) {
  leaflet(options = leafletOptions(minZoom = 0, maxZoom = 10)) %>%
    addTiles() %>%
    addMarkers(lng = result$LON,
               lat = result$LAT,
               popup = "Observation 1") %>%
    addMarkers(lng = result$LON2,
               lat = result$LAT2,
               popup = "Observation 2") %>%
    addPolylines(
      lng = obs$LON,
      lat = obs$LAT,
      popup = paste0(result$SHIPNAME, "Ship Route")
    ) %>%
    addPolylines(
      lng = c(result$LON, result$LON2),
      lat = c(result$LAT, result$LAT2),
      popup = paste0("Observation with maximum distance.Distance = ", result$dist),
      color = "orange"
    ) %>%
    return()
}

#generate descriptions

make_description <- function(result, obs) {
  txt <- paste0('The vessel ', result$SHIPNAME) %>%
    paste0(' covered approximately ', find_observations(obs, 'total')) %>%
    paste0(' metres of distance from ') %>%
    paste0(min(obs$DATETIME, na.rm = TRUE), ' to ') %>%
    paste0(max(obs$DATETIME, na.rm = TRUE), ' .') %>%
    paste0("The observation when it sailed the longest distance between ") %>%
    paste0("two consecutive observations is marked on the map above. The longest ") %>%
    paste0("distance between the consecutive observations is ") %>%
    paste0(round(find_observations(obs, 'max')$dist, 0), ' metres. ') %>%
    paste0("The coordinates of these observations are ", result$LON) %>%
    paste0(' N ', result$LAT, ' E & ', result$LON2, ' N ', result$LAT2, ' E .') %>%
    return(txt)
}

