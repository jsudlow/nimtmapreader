type
  Image* = object
    format*: string
    source*: string
    trans*: string
    width*: int
    height*: int

proc newImage*(format:string, source:string,trans:string,width:int,height:int ): ref Image =
  result = new Image
  result.format = format
  result.source = source
  result.trans = trans
  result.width = width
  result.height = height

  