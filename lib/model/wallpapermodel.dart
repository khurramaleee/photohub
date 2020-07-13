class wallpapermodel{
  String photographer;
  String photographer_url;
  int photographer_id;
  srcmodel src;
  wallpapermodel({this.src,this.photographer,this.photographer_id,this.photographer_url});
factory wallpapermodel.fromMap(Map<String,dynamic> jsondata){
return wallpapermodel(
  src: srcmodel.fromMap(jsondata["src"]),
      photographer_url: jsondata["photographer_url"],
      photographer: jsondata["photographer"],
  photographer_id: jsondata["photographer_id"]


);
}
}
class srcmodel{
  String origional;
  String small;
  String protrait;
  srcmodel({
    this.origional,
    this.protrait,
    this.small
});
  factory srcmodel.fromMap(Map<String,dynamic> jsondata){
    return srcmodel(
      protrait: jsondata["portrait"],
      origional: jsondata["original"],
      small: jsondata["small"]

    );
  }
}