class WeclomeImagesModel {
  String? id;
  Urls? url;

  WeclomeImagesModel({
    this.id,
    this.url,
  });

  factory WeclomeImagesModel.fromJson(Map<String, dynamic> json) {
    return WeclomeImagesModel(
        id: json["id"] ?? "N/A",
        url: json.containsKey("urls") && json["urls"] != null
            ? Urls.fromJson(json["urls"])
            : Urls.fromJson({}));
  }
}

class Urls {
  String? regular;

  Urls({this.regular});

  factory Urls.fromJson(Map<String, dynamic> json) {
    return Urls(
        regular: json["regular"] ??
            "https://images.unsplash.com/photo-1648737155328-0c0012cf2f20?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMTYzOTF8MXwxfGFsbHwxfHx8fHx8Mnx8MTY1NDI1NDU5MA&ixlib=rb-1.2.1&q=80&w=1080");
  }
}
