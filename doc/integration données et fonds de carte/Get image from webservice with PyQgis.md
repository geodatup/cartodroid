# Get image from webservice with PyQgis

Create a layer with feature on interest area

add the Webservice

select the feature layer (change the style or uncheck the layer, but still select!)

Run the script

change this var to your needs :

* workdir
* scale 
* fileName 

> change your screen view to full screen to get better result

~~~
import processing
from PyQt4.QtCore import QTimer

# set workdir export files
workdir = '/Users/R/Desktop/Rouyre/GIS_DATA/Raster/IGN/imagerie/'
#define the scale of screenshoot
scale = 640

count = 0
fileName = "aerial"
feat = []
#timer in millisecond
sleepTime=500

# Select the layer witch is used for the mapCanvas extent (do it by hand)
layer = iface.activeLayer()


#def refresh_layers(self):
#    for layer in qgis.utils.iface.mapCanvas().layers():
#        layer.triggerRepaint()


def prepareMap(): # Arrange layers
  
  layer.select(count) 
  #set trigger to zoom automaticaly on select's layers
  iface.actionZoomToSelected().trigger()
  qgis.utils.iface.mapCanvas().zoomScale(scale)
  layer.deselect(count)
  QTimer.singleShot(sleepTime, exportMap) # Wait 1/10 second and export the map



def exportMap():
  global count # We need this because we'll modify its value
  #refresh_layers(layer)
  iface.mapCanvas().saveAsImage(workdir + fileName + "_" + str(count) + ".png")
  print "Map with layer",count,"exported!"
  if count < len(feat)-1:
    QTimer.singleShot(sleepTime, prepareMap) # Wait 1/10 second and prepare next map
    count += 1


features = processing.features(layer)

for feature in features:
  feat.append(feature.id)

layer.select(count) 
#set trigger to zoom automaticaly on select's layers
iface.actionZoomToSelected().trigger()
qgis.utils.iface.mapCanvas().zoomScale(scale)
layer.deselect(count)
QTimer.singleShot(sleepTime, prepareMap)


~~~


# Merging files with Gdal

run `gdalinfo` to check your install.

The documentation for use gdal on mac : [ici](https://sandbox.idre.ucla.edu/sandbox/general/how-to-install-and-run-gdal)


## make a virtual file

~~~
gdalbuildvrt /Users/R/Desktop/Rouyre/GIS_DATA/Raster/IGN/imagerie/ign_imagerie_rouyre.vrt /Users/R/Desktop/Rouyre/GIS_DATA/Raster/IGN/imagerie/*.png
~~~


gdal_translate -of Gtiff -co "COMPRESS=LZW" -co "TFW=YES" -co "BIGTIFF=YES" "/Users/R/Desktop/Rouyre/GIS_DATA/Raster/IGN/imagerie/ign_imagerie_rouyre.vrt" "/Users/R/Desktop/Rouyre/GIS_DATA/Raster/IGN/imagerie/ign_imagerie_rouyre.tiff"


### Sample - DOS cmd

####Imagery IGN 2015

~~~
dir /b C:\Users\Yogis\Dropbox\developpement\lizmap\data\imagery\rouyre-2015\*.jpg > rouyre_2015.txt
set DATA_DIR=C:\Users\Yogis\Dropbox\developpement\lizmap\data\imagery\rouyre-2015\
for /f %a IN (rouyre_2015.txt) do c:/OSGeo4W64\bin\gdalwarp -of GTiff -co tiled=yes -co "TFW=YES" -dstnodata 0 "%DATA_DIR%\%a" "C:\Users\Yogis\Dropbox\developpement\lizmap\data\imagery\rouyre-2015\warp\%a"
~~~

~~~
c:/OSGeo4W64/bin/gdalbuildvrt C:\Users\Yogis\Dropbox\developpement\lizmap\data\imagery\rouyre-2015\rouyre_jpg.vrt C:\Users\Yogis\Dropbox\developpement\lizmap\data\imagery\rouyre-2015\warp\*.jpg
~~~

~~~
c:/OSGeo4W64\bin\gdal_translate -of Gtiff -co "COMPRESS=LZW" -co "TFW=YES" -co "BIGTIFF=YES" "C:\Users\Yogis\Dropbox\developpement\lizmap\data\imagery\rouyre-2015\rouyre_jpg.vrt" "C:\Users\Yogis\Dropbox\developpement\lizmap\data\imagery\rouyre-2015\rouyre_2015.tiff"
~~~

####Cadastre 2015
~~~
dir /b C:\Users\Yogis\Documents\GIS_DataBase\cadastre\gouv\Rouyre\*.jpg > rouyre_cadastre.txt
set DATA_DIR=C:\Users\Yogis\Documents\GIS_DataBase\cadastre\gouv\Rouyre\
for /f %a IN (rouyre_cadastre.txt) do c:/OSGeo4W64\bin\gdalwarp -of GTiff -co tiled=yes -co "TFW=YES" -dstnodata 255 "%DATA_DIR%\%a" "C:\Users\Yogis\Documents\GIS_DataBase\cadastre\gouv\Rouyre\warp\%a"
~~~
~~~
c:/OSGeo4W64/bin/gdalbuildvrt C:\Users\Yogis\Documents\GIS_DataBase\cadastre\gouv\Rouyre\rouyre_jpg.vrt C:\Users\Yogis\Documents\GIS_DataBase\cadastre\gouv\Rouyre\warp\*.jpg
~~~

~~~
 c:/OSGeo4W64\bin\gdal_translate -of Gtiff -co "COMPRESS=LZW" -co "TFW=YES" -co "BIGTIFF=YES" "C:\Users\Yogis\Documents\GIS_DataBase\cadastre\gouv\Rouyre\rouyre_jpg.vrt" "C:\Users\Yogis\Documents\GIS_DataBase\cadastre\gouv\Rouyre\rouyre_cadastre.tiff"
~~~







