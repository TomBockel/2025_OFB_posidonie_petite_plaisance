
# ce script compte le nombre d'obs medobs par zone detude petite plaisance

library(sf)
library(dplyr)

rm(list=ls())

# parametres
annee_debut = 2023
annee_fin = 2024


# Import donnees et fonctions
# -------------------------- 

# import mouillages_pol
# medobs_2012=st_read("\\\\192.168.1.250/Andromede/CartoNAS/ETUDES/MEDTRIX/PLATEFORME MEDTRIX/MEDTRIX_FTP/rep07/data/mouillage_2012.shp")
# medobs_2012 = st_transform(medobs_2012,2154)
# medobs_2012$Annee=2012
# medobs_2012$boats=as.numeric(medobs_2012$Nb_Bateaux)
# medobs_2012$sailing=as.numeric(medobs_2012$Pc_voile)
# medobs_2012$motor=1-as.numeric(medobs_2012$Pc_voile)
# medobs_2012$small=as.numeric(medobs_2012$Pc_petits)
# medobs_2012$medium=as.numeric(medobs_2012$Pc_moyens)
# medobs_2012$large=as.numeric(medobs_2012$Pc_grands)
# medobs_2012$date=NA
# medobs_2012$area=as.numeric(st_area(medobs_2012))
# medobs_2012=medobs_2012[,c("Annee" , "boats", "sailing", "motor" ,  "small" , "medium"  ,  "large" , "date","area" ,"geometry" )]
# 
# medobs_2013=st_read("\\\\192.168.1.250/Andromede/CartoNAS/ETUDES/MEDTRIX/PLATEFORME MEDTRIX/MEDTRIX_FTP/rep07/data/mouillage_2013.shp")
# medobs_2013 = st_transform(medobs_2013,2154)
# medobs_2013$Annee=2013
# medobs_2013$boats=as.numeric(medobs_2013$Nb_Bateaux)
# medobs_2013$sailing=as.numeric(medobs_2013$Pc_voile)
# medobs_2013$motor=1-as.numeric(medobs_2013$Pc_voile)
# medobs_2013$small=as.numeric(medobs_2013$Pc_petits)
# medobs_2013$medium=as.numeric(medobs_2013$Pc_moyens)
# medobs_2013$large=as.numeric(medobs_2013$Pc_grands)
# medobs_2013$date=NA
# medobs_2013$area=as.numeric(st_area(medobs_2013))
# medobs_2013=medobs_2013[,c("Annee" , "boats", "sailing", "motor" ,  "small" , "medium"  ,  "large" , "date","area" ,"geometry" )]
# 
# medobs_2014=st_read("\\\\192.168.1.250/Andromede/CartoNAS/ETUDES/MEDTRIX/PLATEFORME MEDTRIX/MEDTRIX_FTP/rep07/data/mouillage_2014.shp")
# medobs_2014 = st_transform(medobs_2014,2154)
# medobs_2014$Annee=2014
# medobs_2014$boats=as.numeric(medobs_2014$Nb_Bateaux)
# medobs_2014$sailing=as.numeric(medobs_2014$Pc_voile)
# medobs_2014$motor=1-as.numeric(medobs_2014$Pc_voile)
# medobs_2014$small=as.numeric(medobs_2014$Pc_petits)
# medobs_2014$medium=as.numeric(medobs_2014$Pc_moyens)
# medobs_2014$large=as.numeric(medobs_2014$Pc_grands)
# medobs_2014$date=NA
# medobs_2014$area=as.numeric(st_area(medobs_2014))
# medobs_2014=medobs_2014[,c("Annee" , "boats", "sailing", "motor" ,  "small" , "medium"  ,  "large" , "date","area" ,"geometry" )]
# 
# medobs_2015=st_read("\\\\192.168.1.250/Andromede/CartoNAS/ETUDES/MEDTRIX/PLATEFORME MEDTRIX/MEDTRIX_FTP/rep07/data/mouillage_2015.shp")
# medobs_2015 = st_transform(medobs_2015,2154)
# medobs_2015$Annee=2015
# medobs_2015$boats=as.numeric(medobs_2015$Nb_Bateaux)
# medobs_2015$sailing=as.numeric(medobs_2015$Pc_voile)
# medobs_2015$motor=1-as.numeric(medobs_2015$Pc_voile)
# medobs_2015$small=as.numeric(medobs_2015$Pc_petits)
# medobs_2015$medium=as.numeric(medobs_2015$Pc_moyens)
# medobs_2015$large=as.numeric(medobs_2015$Pc_grands)
# medobs_2015$date=NA
# medobs_2015$area=as.numeric(st_area(medobs_2015))
# medobs_2015=medobs_2015[,c("Annee" , "boats", "sailing", "motor" ,  "small" , "medium"  ,  "large" , "date","area" ,"geometry" )]
# 
# medobs_2016=st_read("\\\\192.168.1.250/Andromede/CartoNAS/ETUDES/MEDTRIX/PLATEFORME MEDTRIX/MEDTRIX_FTP/rep07/data/mouillage_2016.shp")
# medobs_2016 = st_transform(medobs_2016,2154)
# medobs_2016$Annee=2016
# medobs_2016$boats=as.numeric(medobs_2016$Nb_Bateaux)
# medobs_2016$sailing=as.numeric(medobs_2016$Pc_voile)
# medobs_2016$motor=1-as.numeric(medobs_2016$Pc_voile)
# medobs_2016$small=as.numeric(medobs_2016$Pc_petits)
# medobs_2016$medium=as.numeric(medobs_2016$Pc_moyens)
# medobs_2016$large=as.numeric(medobs_2016$Pc_grands)
# medobs_2016$date=NA
# medobs_2016$area=as.numeric(st_area(medobs_2016))
# medobs_2016=medobs_2016[,c("Annee" , "boats", "sailing", "motor" ,  "small" , "medium"  ,  "large" , "date","area" ,"geometry" )]
# 
# medobs_2018=st_read("\\\\192.168.1.250/Andromede/CartoNAS/ETUDES/MEDTRIX/PLATEFORME MEDTRIX/MEDTRIX_FTP/rep07/data/mouillage_2018.shp")
# medobs_2018 = st_transform(medobs_2018,2154)
# medobs_2018$area=as.numeric(st_area(medobs_2018))
# medobs_2018=medobs_2018[,c("Annee" , "boats", "sailing", "motor" ,  "small" , "medium"  ,  "large" , "date","area" ,"geometry" )]
# 
# medobs_2019 = st_read("\\\\192.168.1.250/Andromede/CartoNAS/ETUDES/MEDTRIX/PLATEFORME MEDTRIX/MEDTRIX_FTP/rep07/data/mouillage_2019.shp")
# medobs_2019 = st_transform(medobs_2019,2154)
# medobs_2019$area=as.numeric(st_area(medobs_2019))
# medobs_2019=medobs_2019[,c("Annee" , "boats", "sailing", "motor" ,  "small" , "medium"  ,  "large" , "date","area" ,"geometry" )]
# 
# medobs_2020 = st_read("\\\\192.168.1.250/Andromede/CartoNAS/ETUDES/MEDTRIX/PLATEFORME MEDTRIX/MEDTRIX_FTP/rep07/data/mouillage_2020.shp")
# medobs_2020 = st_transform(medobs_2020,2154)
# medobs_2020$area=as.numeric(st_area(medobs_2020))
# medobs_2020=medobs_2020[,c("Annee" , "boats", "sailing", "motor" ,  "small" , "medium"  ,  "large" , "date","area" ,"geometry" )]
# 
# medobs_2021 = st_read("\\\\192.168.1.250/Andromede/CartoNAS/ETUDES/MEDTRIX/PLATEFORME MEDTRIX/MEDTRIX_projets/MEDOBS/data/Données brutes/2021/ZONE MOUILLAGE MEDOBS 2021.shp")
# medobs_2021 = st_transform(medobs_2021,2154)
# medobs_2021$Annee=2021
# medobs_2021$boats=as.numeric(medobs_2021$NBRES_BATE)
# medobs_2021$sailing=as.numeric(medobs_2021$X_VOILIER)
# medobs_2021$motor=as.numeric(medobs_2021$X_MOTEUR)
# medobs_2021$small=as.numeric(medobs_2021$X_PETIT)
# medobs_2021$medium=as.numeric(medobs_2021$X_MOYEN)
# medobs_2021$large=as.numeric(medobs_2021$X_GRAND)
# medobs_2021$date=as_date(medobs_2021$TIMESTAMP)
# medobs_2021$area=as.numeric(st_area(medobs_2021))
# medobs_2021=medobs_2021[,c("Annee" , "boats", "sailing", "motor" ,  "small" , "medium"  ,  "large" , "date","area" ,"geometry" )]


# medobs 2023
files <- list.files(path = "\\\\192.168.1.250/Andromede/CartoNAS/ETUDES/MEDTRIX/PLATEFORME MEDTRIX/MEDTRIX_projets/MEDOBS/data/Données brutes/2023",
                                pattern = ".geojson",
                                recursive = T,
                                full.names = T)
# 2. Read only the geometry column from each file
geometries <- lapply(files, function(f) {
  g <- st_read(f, quiet = TRUE)
  st_geometry(g)  # extract only geometry column
})

# 3. Concatenate geometries into a single sfc (simple feature geometry list column)
geom_combined <- do.call(c, geometries)

# 4. (Optional) Wrap into an sf object
sf_combined <- st_sf(geometry = geom_combined)
medobs_2023 <- sf_combined
medobs_2023$Annee <- 2023

medobs_2023 <- st_transform(medobs_2023, 2154)

# medobs 2024
medobs_2024 = st_read("\\\\192.168.1.250/Andromede/CartoNAS/ETUDES/MEDTRIX/PLATEFORME MEDTRIX/MEDTRIX_FTP/rep07/data/medobs/2024/zone_mouillage/mouillage_2024.shp")
medobs_2024 = st_transform(medobs_2024,2154)
medobs_2024$area=as.numeric(st_area(medobs_2024))
medobs_2024=medobs_2024[,c("geometry" )]
medobs_2024$Annee <- 2024


# concatenation
# medobs=rbind(medobs_2012,medobs_2013,medobs_2014,medobs_2015,medobs_2016,medobs_2018,medobs_2019,medobs_2020,medobs_2021)

medobs <- rbind(medobs_2023, medobs_2024)
sum(!st_is_valid(medobs))
medobs=st_make_valid(medobs)
sum(!st_is_valid(medobs))


# filtre par années
medobs <- medobs[medobs$Annee>=annee_debut & medobs$Annee<=annee_fin,]
unique(medobs$Annee)


# # On recalcule les densites de mouillages par classe de taille et par hectare
# medobs$small_dens=(medobs$boats*(medobs$small/100))/(medobs$area/10000)
# medobs$medium_dens=(medobs$boats*(medobs$medium/100))/(medobs$area/10000)
# medobs$large_dens=(medobs$boats*(medobs$large/100))/(medobs$area/10000)
# 
# summary(medobs)
# hist(medobs$boats) # check outliers


# import des sites
sites <- st_read("analyses/1_confirmation_des_sites/sites_etudes_petite_plaisance.gpkg", layer="sonar")
sites$id <- 1:dim(sites)[1]

sites_buf <- st_buffer(sites, 10000)


# comptage obs medobs sur chaque site
join <- st_join(sites, medobs)

join_buf <- st_join(sites_buf, medobs)

sites_medobs <- join %>%
  group_by(id, cctp, interrogation, geometry) %>%
  summarise(count = length(Annee[!is.na(Annee)])) %>%
  arrange(count)

sites_medobs_buf <- st_drop_geometry(join_buf) %>%
  group_by(id) %>%
  summarise(count_buf = length(Annee[!is.na(Annee)])) %>%
  arrange(count_buf)

sites_medobs_all <- left_join(sites_medobs, sites_medobs_buf)

st_write(sites_medobs_all,
         "analyses/1_confirmation_des_sites/sites_etudes_petite_plaisance.gpkg",
         layer="medobs",
         append=FALSE)


