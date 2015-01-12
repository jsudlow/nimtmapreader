import src/map, src/layer, src/tileset, src/image, src/tile, streams,hashes,strutils,lexbase,unicode,json

var rawjson = newFilestream("map_files/nimrodhunter", fmRead)
var jobj = parseJson(rawjson,"error.json")
assert (jobj.kind == JObject)
echo "Attempting to print the selected JSON"

echo($jobj["layers"])
