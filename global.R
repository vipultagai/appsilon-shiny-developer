#Libraries

#loading libraries

library(shiny)
library(shiny.semantic)
library(dplyr)
library(leaflet)
library(geosphere)
library(data.table)

#Load Data File.
ships <- fread("src/ships.csv")

#Load dependencies
source('src/utility.R')
source('src/distance_module_ui.R')
source('src/distance_module_server.R')





