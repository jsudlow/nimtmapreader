import src/map, src/layer, src/tileset, src/image, src/tile, streams,hashes,strutils,lexbase,unicode,json

#Get the json saved on our disk
var jsonStreamFromFile = newFilestream("map_files/nimrodhunter.json", fmRead)

#Parse the json
var jobj = parseJson(jsonStreamFromFile,"error.json")

#Test to make sure we actually loaded a json object
assert (jobj.kind == JObject)

#Print out a few check values to make sure we got the right stuff
echo "Attempting to construct map from JSON"

var Map = newMapFromJSON(jobj)
echo Map.tileHeight
