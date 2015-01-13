import strutils


type
  Layer* = object
    data*: seq[int]
    height*: int
    name*: string
    opacity*: float
    layerType*: string
    visible*: bool
    width*: int
    x*:int
    y*:int

proc newLayer*(name: string, x, y, width, height: int,
               opacity = 1.0, visible = true, layerType = "tilelayer"): ref Layer =
  result = new Layer
  result.name = name
  result.x = x
  result.y = y
  result.width = width
  result.height = height
  result.opacity = opacity
  result.visible = visible
  result.layerType = layerType
  result.data = newSeq[int]()


proc newLayerFromJSON*(layer): ref Layer =
  #init an empty sequence of inits
  result = newLayer(
    layer["name"].str,
    layer["x"].num.int,
    layer["y"].num.int,
    layer["width"].num.int,
    layer["height"].num.int,
    layer["opacity"].num.float,
    layer["visible"].bval,
    layer["type"].str)

  for id in layer["data"]:
    result.data.add(id.num.int)
