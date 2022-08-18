/// type : "Success"
/// message : "Product Fetched Successfully"
/// data : [{"productId":"1b0f2343-0270-4d3d-ba83-2a772e115dc9","name":"Glory","description":"Arizona achieved statehood","imageUrl":"/uploads/1b0f2343-0270-4d3d-ba83-2a772e115dc9.jpg","type":"PLANT","price":800,"available":true,"seed":null,"plant":{"plantId":"f985a224-ee41-411e-9327-dfb9822544ab","name":"Cherokee Rose","description":"This spring bloomer","imageUrl":"/uploads/f985a224-ee41-411e-9327-dfb9822544ab.png","waterCapacity":415,"sunLight":325,"temperature":512},"tool":null},{"productId":"42edbb62-b102-451b-aa6a-2171ffbf7c62","name":"Over the Moon","description":"This spring bloomer","imageUrl":"/uploads/42edbb62-b102-451b-aa6a-2171ffbf7c62.jpg","type":"PLANT","price":1250,"available":true,"seed":null,"plant":{"plantId":"f985a224-ee41-411e-9327-dfb9822544ab","name":"Cherokee Rose","description":"This spring bloomer","imageUrl":"/uploads/f985a224-ee41-411e-9327-dfb9822544ab.png","waterCapacity":415,"sunLight":325,"temperature":512},"tool":null},{"productId":"4889ff96-293b-41c3-bf0e-2aab734fbbbf","name":"Vegetable Garden Seeds ","description":"This spring bloomer","imageUrl":"/uploads/4889ff96-293b-41c3-bf0e-2aab734fbbbf.jpg","type":"SEED","price":700,"available":true,"seed":{"seedId":"0ba0060a-a353-43dd-87d5-15a4523dcf0c","name":"FlaxSeeds","description":"super rich in fiber","imageUrl":""},"plant":null,"tool":null},{"productId":"65b57cf3-ad30-43b1-9b08-aecc1f5dd08c","name":"axe","description":"WilFiks Chopping Axe","imageUrl":"/uploads/65b57cf3-ad30-43b1-9b08-aecc1f5dd08c.jpg","type":"TOOL","price":400,"available":true,"seed":null,"plant":null,"tool":{"toolId":"12879d6e-106a-47bb-8a91-bf4797c604dc","name":"Axe","description":"sharpaxe","imageUrl":""}},{"productId":"7fbea829-9b1b-4641-ba71-63a8cb85746e","name":"Vegetable Garden Seeds ","description":"This spring bloomer","imageUrl":"/uploads/7fbea829-9b1b-4641-ba71-63a8cb85746e.jpg","type":"SEED","price":700,"available":true,"seed":{"seedId":"0ba0060a-a353-43dd-87d5-15a4523dcf0c","name":"FlaxSeeds","description":"super rich in fiber","imageUrl":""},"plant":null,"tool":null},{"productId":"8d6725d5-b587-4772-90fa-ff3a5ece6c23","name":"Tropical Scents","description":"Arizona achieved statehood","imageUrl":"/uploads/8d6725d5-b587-4772-90fa-ff3a5ece6c23.jpg","type":"PLANT","price":925,"available":true,"seed":null,"plant":{"plantId":"09512240-30c7-422b-91a2-5110d33c0f1f","name":"American Marigold","description":"American Marigold plants","imageUrl":"","waterCapacity":2,"sunLight":7,"temperature":6},"tool":null},{"productId":"949c57d2-a540-4b27-8955-71ce92247b23","name":"Vegetable Garden Seeds ","description":"This spring bloomer","imageUrl":"/uploads/949c57d2-a540-4b27-8955-71ce92247b23.jpg","type":"SEED","price":700,"available":true,"seed":{"seedId":"0ba0060a-a353-43dd-87d5-15a4523dcf0c","name":"FlaxSeeds","description":"super rich in fiber","imageUrl":""},"plant":null,"tool":null},{"productId":"cdd64aad-6817-4d17-b6ad-271e77ec806d","name":"axe","description":"WilFiks Chopping Axe","imageUrl":"/uploads/cdd64aad-6817-4d17-b6ad-271e77ec806d.jpg","type":"TOOL","price":400,"available":true,"seed":null,"plant":null,"tool":{"toolId":"12879d6e-106a-47bb-8a91-bf4797c604dc","name":"Axe","description":"sharpaxe","imageUrl":""}},{"productId":"cf306aa6-a266-4e68-9b54-58656aeb964a","name":"Vegetable Garden Seeds ","description":"This spring bloomer","imageUrl":"/uploads/cf306aa6-a266-4e68-9b54-58656aeb964a.jpg","type":"SEED","price":700,"available":true,"seed":{"seedId":"0ba0060a-a353-43dd-87d5-15a4523dcf0c","name":"FlaxSeeds","description":"super rich in fiber","imageUrl":""},"plant":null,"tool":null},{"productId":"f148e494-54f2-4a8d-868f-8f0f4ed81916","name":"Over the Moon","description":"This spring bloomer","imageUrl":"/uploads/f148e494-54f2-4a8d-868f-8f0f4ed81916.jpg","type":"PLANT","price":1250,"available":true,"seed":null,"plant":{"plantId":"f985a224-ee41-411e-9327-dfb9822544ab","name":"Cherokee Rose","description":"This spring bloomer","imageUrl":"/uploads/f985a224-ee41-411e-9327-dfb9822544ab.png","waterCapacity":415,"sunLight":325,"temperature":512},"tool":null}]

class ProductsModel {
  ProductsModel({
      String? type, 
      String? message, 
      List<Data>? data,}){
    _type = type;
    _message = message;
    _data = data;
}

  ProductsModel.fromJson(dynamic json) {
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
ProductsModel copyWith({  String? type,
  String? message,
  List<Data>? data,
}) => ProductsModel(  type: type ?? _type,
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

/// productId : "1b0f2343-0270-4d3d-ba83-2a772e115dc9"
/// name : "Glory"
/// description : "Arizona achieved statehood"
/// imageUrl : "/uploads/1b0f2343-0270-4d3d-ba83-2a772e115dc9.jpg"
/// type : "PLANT"
/// price : 800
/// available : true
/// seed : null
/// plant : {"plantId":"f985a224-ee41-411e-9327-dfb9822544ab","name":"Cherokee Rose","description":"This spring bloomer","imageUrl":"/uploads/f985a224-ee41-411e-9327-dfb9822544ab.png","waterCapacity":415,"sunLight":325,"temperature":512}
/// tool : null

class Data {
  Data({
      String? productId, 
      String? name, 
      String? description, 
      String? imageUrl, 
      String? type, 
      num? price, 
      bool? available, 
      dynamic seed, 
      Plant? plant, 
      dynamic tool,}){
    _productId = productId;
    _name = name;
    _description = description;
    _imageUrl = imageUrl;
    _type = type;
    _price = price;
    _available = available;
    _seed = seed;
    _plant = plant;
    _tool = tool;
}

  Data.fromJson(dynamic json) {
    _productId = json['productId'];
    _name = json['name'];
    _description = json['description'];
    _imageUrl = json['imageUrl'];
    _type = json['type'];
    _price = json['price'];
    _available = json['available'];
    _seed = json['seed'];
    _plant = json['plant'] != null ? Plant.fromJson(json['plant']) : null;
    _tool = json['tool'];
  }
  String? _productId;
  String? _name;
  String? _description;
  String? _imageUrl;
  String? _type;
  num? _price;
  bool? _available;
  dynamic _seed;
  Plant? _plant;
  dynamic _tool;
Data copyWith({  String? productId,
  String? name,
  String? description,
  String? imageUrl,
  String? type,
  num? price,
  bool? available,
  dynamic seed,
  Plant? plant,
  dynamic tool,
}) => Data(  productId: productId ?? _productId,
  name: name ?? _name,
  description: description ?? _description,
  imageUrl: imageUrl ?? _imageUrl,
  type: type ?? _type,
  price: price ?? _price,
  available: available ?? _available,
  seed: seed ?? _seed,
  plant: plant ?? _plant,
  tool: tool ?? _tool,
);
  String? get productId => _productId;
  String? get name => _name;
  String? get description => _description;
  String? get imageUrl => _imageUrl;
  String? get type => _type;
  num? get price => _price;
  bool? get available => _available;
  dynamic get seed => _seed;
  Plant? get plant => _plant;
  dynamic get tool => _tool;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productId'] = _productId;
    map['name'] = _name;
    map['description'] = _description;
    map['imageUrl'] = _imageUrl;
    map['type'] = _type;
    map['price'] = _price;
    map['available'] = _available;
    map['seed'] = _seed;
    if (_plant != null) {
      map['plant'] = _plant?.toJson();
    }
    map['tool'] = _tool;
    return map;
  }

}

/// plantId : "f985a224-ee41-411e-9327-dfb9822544ab"
/// name : "Cherokee Rose"
/// description : "This spring bloomer"
/// imageUrl : "/uploads/f985a224-ee41-411e-9327-dfb9822544ab.png"
/// waterCapacity : 415
/// sunLight : 325
/// temperature : 512

class Plant {
  Plant({
      String? plantId, 
      String? name, 
      String? description, 
      String? imageUrl, 
      num? waterCapacity, 
      num? sunLight, 
      num? temperature,}){
    _plantId = plantId;
    _name = name;
    _description = description;
    _imageUrl = imageUrl;
    _waterCapacity = waterCapacity;
    _sunLight = sunLight;
    _temperature = temperature;
}

  Plant.fromJson(dynamic json) {
    _plantId = json['plantId'];
    _name = json['name'];
    _description = json['description'];
    _imageUrl = json['imageUrl'];
    _waterCapacity = json['waterCapacity'];
    _sunLight = json['sunLight'];
    _temperature = json['temperature'];
  }
  String? _plantId;
  String? _name;
  String? _description;
  String? _imageUrl;
  num? _waterCapacity;
  num? _sunLight;
  num? _temperature;
Plant copyWith({  String? plantId,
  String? name,
  String? description,
  String? imageUrl,
  num? waterCapacity,
  num? sunLight,
  num? temperature,
}) => Plant(  plantId: plantId ?? _plantId,
  name: name ?? _name,
  description: description ?? _description,
  imageUrl: imageUrl ?? _imageUrl,
  waterCapacity: waterCapacity ?? _waterCapacity,
  sunLight: sunLight ?? _sunLight,
  temperature: temperature ?? _temperature,
);
  String? get plantId => _plantId;
  String? get name => _name;
  String? get description => _description;
  String? get imageUrl => _imageUrl;
  num? get waterCapacity => _waterCapacity;
  num? get sunLight => _sunLight;
  num? get temperature => _temperature;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['plantId'] = _plantId;
    map['name'] = _name;
    map['description'] = _description;
    map['imageUrl'] = _imageUrl;
    map['waterCapacity'] = _waterCapacity;
    map['sunLight'] = _sunLight;
    map['temperature'] = _temperature;
    return map;
  }

}