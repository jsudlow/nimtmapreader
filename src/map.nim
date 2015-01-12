import tables

type
  Map* = object
    height*: int
    width*: int
    orientation*: string
    properties*: Table[string, string]
    tileHeight*: int
    tileWidth*: int
    version*: int