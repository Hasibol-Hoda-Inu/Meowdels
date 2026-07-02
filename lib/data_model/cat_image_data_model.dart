class CatImageDataModel {
  String? id;
  String? url;
  int? width;
  int? height;

  CatImageDataModel({this.id, this.url, this.width, this.height});

  CatImageDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    width = json['width'];
    height = json['height'];
  }
}
