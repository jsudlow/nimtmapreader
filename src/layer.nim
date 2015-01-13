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
proc newLayerFromJSON*(layer): ref Layer =
  #init an empty sequence of inits
  var s = newSeq[int]();
  for i in layer["data"]:
    s.add(parseInt($(i)))
  var height = parseInt($(layer["height"]))
  var name = $(layer["name"])
  var opacity = parseInt($(layer["opacity"]))
  var layerType = $(layer["type"]) 
  var visible = parseBool($(layer["visible"]))
  var width = parseInt($(layer["width"]))
  var x = parseInt($(layer["x"]))  
  var y = parseInt($(layer["y"]))

  result = newLayer(s,height,name,opacity,layerType,visible,width,x,y)

  
