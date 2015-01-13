import tables, strutils,layer


type
  Orientation* = enum
    orthogonal,isometric,staggered

  Map* = object
    height*: int
    width*: int
    orientation*: string
    properties*: Table[string, string]
    tileHeight*: int
    tileWidth*: int
    version*: int
    layers*: seq[ref Layer]

proc newMap*(width, height: int, tWidth = 32, tHeight = 32, orientation = "orthogonal", version = 0): ref Map =
  result = new Map
  result.height = height
  result.width = width
  result.orientation = orientation
  result.properties = initTable[string,string]()
  result.tileHeight = tWidth
  result.tileWidth = tHeight
  result.version = version
  result.layers = newSeq[ref Layer]()

proc newMapFromJSON*(jobj): ref Map =
  result = newMap(
    jobj["height"].num.int,
    jobj["width"].num.int,
    jobj["tileheight"].num.int,
    jobj["tilewidth"].num.int,
    jobj["orientation"].str,
    jobj["version"].num.int)

  for layer in jobj["layers"]:
    result.layers.add(newLayerFromJSON(layer))
