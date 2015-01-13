import strutils
type
  Layer* = object
    data*: seq[int]
    height*: int
    name*: string
    opacity*: int
    layerType*: string
    visible*: bool
    width*: int
    x*:int
    y*:int

proc newLayer*(data :seq[int], height :int, name :string, opacity :int, layerType :string, visible :bool, width :int, x,y :int): ref Layer =
  result = new Layer
  result.data = data
  result.height = height
  result.name = name
  result.opacity = opacity
  result.layerType = layerType
  result.visible = visible
  result.width = width
  result.x = x
  result.y = y
proc layersFromJSON*(jobj) =
  #find how many layers we are working with
  var number_of_layers = len(jobj["layers"])
  var IntSeq = @[1,2,3,4]
  #for however many layers there are iniate the loop
  for i in countup(0,(number_of_layers -1)):
    #echo ($jobj["layers"][i])
    var data = $jobj["layers"][i]["data"]
    var tokens = @["h"]
    tokens = split(data,",")
    echo tokens
    #for token in tokens:
     # if(token != ""):
      #  echo "Parsing Token"
       # echo token
        #IntSeq.add(parseInt(token))
    var height = $jobj["layers"][i]["height"]
    var name = $jobj["layers"][i]["name"]
    var opacity = $jobj["layers"][i]["opacity"]
    var layerType = $jobj["layers"][i]["type"] 
    var visible = $jobj["layers"][i]["visible"]
    var width = $jobj["layers"][i]["width"]
    var x = $jobj["layers"][i]["x"]  
    var y = $jobj["layers"][i]["y"]

    #var Layer = newLayer(data,height,name,opacity,layerType,visible,width,x,y)