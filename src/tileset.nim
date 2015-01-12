import tables
type
  Tileset* = object
    firstgid*: int
    image*: string
    imageHeight*: int
    imageWidth*: int
    margin*: int
    name*: string
    properties*: Table[string, string]
    spacing*: int
    tileHeight*: int
    tileWidth*: int
