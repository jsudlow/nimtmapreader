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

proc newTileset*(firstgid: int, image :string, imageHeight :int, imageWidth :int, margin :int, name :string, spacing :int, tileHeight :int, tileWidth :int): ref Tileset =
  result = new Tileset
  result.firstgid = firstgid
  result.image = image
  result.imageHeight = imageHeight
  result.imageWidth = imageWidth
  result.margin = margin
  result.name = name
  result.spacing = spacing
  result.tileHeight = tileHeight
  result.tileWidth = tileWidth
  result.properties = initTable[string,string]()

proc newTilesetFromJSON*(tileset): ref Tileset =
  result = newTileset(
    tileset["firstgid"].num.int,
    tileset["image"].str,
    tileset["imageheight"].num.int,
    tileset["imagewidth"].num.int,
    tileset["margin"].num.int,
    tileset["name"].str,
    tileset["spacing"].num.int,
    tileset["tileheight"].num.int,
    tileset["tilewidth"].num.int
    )
  #need to set properties
  for key, value in tileset["properties"]:
    result.properties.add(key, $value)