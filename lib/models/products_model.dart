
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
  int count = 1;
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