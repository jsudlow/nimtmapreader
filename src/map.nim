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
    layers*: seq[Layer]
    
proc newMap*(height,width :int, orientation :string, tileHeight :int = 32, tileWidth :int = 32, version :int = 0 ): ref Map =
  result = new Map
  result.height = height
  result.width = width
  result.orientation = orientation
  result.properties = initTable[string,string]()
  result.tileHeight = tileHeight
  result.tileWidth = tileWidth
  result.version = version
  
proc mapFromJSON*(jobj): ref Map =
  var height = parseInt($jobj["height"])
  var width = parseInt($jobj["width"])
  var orientation = $jobj["orientation"]
  var tileHeight = parseInt($jobj["tileheight"])
  var tileWidth = parseInt($jobj["tilewidth"])
  var version = parseInt($jobj["version"])
  
  result = newMap(height,width,orientation,tileHeight,tileWidth,version)
  