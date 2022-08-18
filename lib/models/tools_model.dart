/// type : "Success"
/// message : "Tools Fetched Successfully"
/// data : [{"toolId":"12879d6e-106a-47bb-8a91-bf4797c604dc","name":"Axe","description":"sharpaxe","imageUrl":""},{"toolId":"2494c98c-1642-41e8-aba5-6270b9b3d80a","name":"Axe","description":"sharpaxe","imageUrl":""},{"toolId":"2b1861ce-46a8-408b-814b-c7f64f2c1f0d","name":"Ageratum","description":"itsflower","imageUrl":""},{"toolId":"2d4b1c3d-3eb1-4d8c-9433-dfab86668db4","name":"test","description":"test description","imageUrl":"/uploads/2d4b1c3d-3eb1-4d8c-9433-dfab86668db4.jpg"},{"toolId":"2ee6fc1e-3c1a-4a2b-87a3-52ac4b700dcb","name":"Ageratum","description":"its flower","imageUrl":""},{"toolId":"4a52bc1d-faa7-47e8-a7ab-ece0b5422f43","name":"Gardener","description":"to heap up the fallen leaves","imageUrl":"/uploads/4a52bc1d-faa7-47e8-a7ab-ece0b5422f43.jpg"},{"toolId":"530875d0-06d7-40ea-83f4-f9f62916fb0c","name":"Hedge shears","description":"decorated the tree","imageUrl":"/uploads/530875d0-06d7-40ea-83f4-f9f62916fb0c.jpg"},{"toolId":"60da9dc5-2974-45a2-bd24-7f38038d7999","name":"Axe","description":"sharpaxe","imageUrl":"/uploads/60da9dc5-2974-45a2-bd24-7f38038d7999.jpg"},{"toolId":"62915812-9a07-45d6-bc23-e1a2525b05a6","name":"Ageratum","description":"its flower","imageUrl":""},{"toolId":"6a50e69d-bf71-4815-b120-d5fd17d02be6","name":"Gardening gloves","description":"I put on my gardening gloves ","imageUrl":"/uploads/6a50e69d-bf71-4815-b120-d5fd17d02be6.jpg"},{"toolId":"71009e87-80a0-43f8-925c-2a6d54e531a0","name":"Rake","description":"to make a good seed bed","imageUrl":"/uploads/71009e87-80a0-43f8-925c-2a6d54e531a0.jpg"},{"toolId":"7bd1b825-adb6-455f-82d3-24e51664889f","name":"Axe","description":"sharpaxe","imageUrl":""},{"toolId":"92a4a03a-eed1-4b16-9a44-be852cc5c25f","name":"Ageratum","description":"itsblueflower","imageUrl":""},{"toolId":"a2e8a855-f6bb-4943-8b60-de21d15a3d41","name":"Ageratum","description":"itsblueflower","imageUrl":""},{"toolId":"a8559c37-5df4-45f2-ac85-afc8983cde0a","name":"Axe","description":"sharpaxe","imageUrl":""},{"toolId":"ce89189b-a5e4-43ab-83c6-15086abd1dc2","name":"Axe","description":"sharpaxe","imageUrl":""},{"toolId":"d8d6a270-1260-45dd-b6aa-9cf7555977cc","name":"Gardening fork","description":"is used for loosening","imageUrl":"/uploads/d8d6a270-1260-45dd-b6aa-9cf7555977cc.jpg"},{"toolId":"f105c125-f940-4b17-b8b2-dac59ccb4165","name":"test","description":"test description","imageUrl":"/uploads/f105c125-f940-4b17-b8b2-dac59ccb4165.jpg"}]

class ToolsModel {
  ToolsModel({
      String? type, 
      String? message, 
      List<Data>? data,}){
    _type = type;
    _message = message;
    _data = data;
}

  ToolsModel.fromJson(dynamic json) {
    _type = json['type'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  String? _type;
  String? _message;
  List<Data>? _data;
ToolsModel copyWith({  String? type,
  String? message,
  List<Data>? data,
}) => ToolsModel(  type: type ?? _type,
  message: message ?? _message,
  data: data ?? _data,
);
  String? get type => _type;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// toolId : "12879d6e-106a-47bb-8a91-bf4797c604dc"
/// name : "Axe"
/// description : "sharpaxe"
/// imageUrl : ""

class Data {
  Data({
      String? toolId, 
      String? name, 
      String? description, 
      String? imageUrl,}){
    _toolId = toolId;
    _name = name;
    _description = description;
    _imageUrl = imageUrl;
}

  Data.fromJson(dynamic json) {
    _toolId = json['toolId'];
    _name = json['name'];
    _description = json['description'];
    _imageUrl = json['imageUrl'];
  }
  String? _toolId;
  String? _name;
  String? _description;
  String? _imageUrl;
Data copyWith({  String? toolId,
  String? name,
  String? description,
  String? imageUrl,
}) => Data(  toolId: toolId ?? _toolId,
  name: name ?? _name,
  description: description ?? _description,
  imageUrl: imageUrl ?? _imageUrl,
);
  String? get toolId => _toolId;
  String? get name => _name;
  String? get description => _description;
  String? get imageUrl => _imageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['toolId'] = _toolId;
    map['name'] = _name;
    map['description'] = _description;
    map['imageUrl'] = _imageUrl;
    return map;
  }

}