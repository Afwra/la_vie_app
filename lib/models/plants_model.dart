/// type : "Success"
/// message : "Plant Fetched Successfully"
/// data : [{"plantId":"09512240-30c7-422b-91a2-5110d33c0f1f","name":"American Marigold","description":"American Marigold plants","imageUrl":"","waterCapacity":2,"sunLight":7,"temperature":6},{"plantId":"09be504b-99e3-481d-9653-9b6c791741dc","name":"Orange Blossom","description":"Legendarily fragrant","imageUrl":"/uploads/09be504b-99e3-481d-9653-9b6c791741dc.png","waterCapacity":2122,"sunLight":535824,"temperature":167},{"plantId":"20f7c434-15ac-44b5-8eea-ee9d11bb7fb0","name":"Hawaiin Flowers","description":"White Flower","imageUrl":"","waterCapacity":574256,"sunLight":456,"temperature":456},{"plantId":"2231b82c-a5eb-40a5-8255-45dafbac3bd7","name":"Forget Me Not","description":"Native to Asia","imageUrl":"/uploads/2231b82c-a5eb-40a5-8255-45dafbac3bd7.png","waterCapacity":525456,"sunLight":35834,"temperature":150},{"plantId":"235dde6d-bc80-492f-a9a0-b959ae922ecf","name":"Mountain Laurel","description":"This fragrant","imageUrl":"/uploads/235dde6d-bc80-492f-a9a0-b959ae922ecf.png","waterCapacity":523,"sunLight":345436,"temperature":25323},{"plantId":"4b9766af-1eb1-43ab-973c-7da2a209c94f","name":"Common Violet","description":"The native wildflower","imageUrl":"/uploads/4b9766af-1eb1-43ab-973c-7da2a209c94f.png","waterCapacity":265,"sunLight":84578,"temperature":346},{"plantId":"51416d55-189c-46bc-9e34-296195d18a94","name":"California Poppy","description":"land of fire","imageUrl":"/uploads/51416d55-189c-46bc-9e34-296195d18a94.png","waterCapacity":14,"sunLight":132,"temperature":3245},{"plantId":"550a2a7b-fe30-498b-985b-3806f42f2c90","name":"Camellia","description":"Alabama flower","imageUrl":"/uploads/550a2a7b-fe30-498b-985b-3806f42f2c90.png","waterCapacity":25456,"sunLight":124134,"temperature":100},{"plantId":"59352a62-7f6a-41a2-99ff-54819bb77cda","name":"Yellow Hibiscus","description":"Sun loving","imageUrl":"/uploads/59352a62-7f6a-41a2-99ff-54819bb77cda.png","waterCapacity":53734,"sunLight":2152,"temperature":2412},{"plantId":"5ca1c184-b473-49d1-afca-7607ace40a77","name":"Ageratum","description":"Ageratum plants","imageUrl":"/uploads/5ca1c184-b473-49d1-afca-7607ace40a77.png","waterCapacity":5,"sunLight":9,"temperature":8},{"plantId":"61de3902-5d86-4aaa-8698-b4b0351e5cbd","name":"Peach Blossom","description":"The Peach State","imageUrl":"/uploads/61de3902-5d86-4aaa-8698-b4b0351e5cbd.png","waterCapacity":46764,"sunLight":5665,"temperature":767},{"plantId":"695181bb-eb09-4034-abc7-b6fa1a4ba66e","name":"Lewis Mock Orange","description":"Collected by Meriwether Lewis","imageUrl":"/uploads/695181bb-eb09-4034-abc7-b6fa1a4ba66e.png","waterCapacity":246,"sunLight":1123,"temperature":5642},{"plantId":"76cf5190-3183-44bc-8d52-093f1de5eb87","name":"Saguaro Cactus Blossom","description":"Arizona achieved statehood","imageUrl":"/uploads/76cf5190-3183-44bc-8d52-093f1de5eb87.png","waterCapacity":2134,"sunLight":121,"temperature":150},{"plantId":"8dc53317-2dc1-45a4-bddd-fef93907cae4","name":"Rocky Mountain Columbine","description":"Blue stands for sky","imageUrl":"/uploads/8dc53317-2dc1-45a4-bddd-fef93907cae4.png","waterCapacity":12431,"sunLight":215,"temperature":12355},{"plantId":"c5f83dba-a01f-4a09-ae9d-be60a5547d93","name":"American Marigold","description":"American Marigold plants","imageUrl":"","waterCapacity":2,"sunLight":7,"temperature":6},{"plantId":"c69abff3-785f-47b5-b3ec-e56b8592b9c9","name":"American Marigold","description":"American Marigold plants","imageUrl":"","waterCapacity":2,"sunLight":7,"temperature":6},{"plantId":"e2b63c14-9042-4a53-87f1-819057727f3b","name":"Peony","description":"Was designated the Hoosier State","imageUrl":"/uploads/e2b63c14-9042-4a53-87f1-819057727f3b.png","waterCapacity":524,"sunLight":64,"temperature":32},{"plantId":"e65bcd57-b7a2-4d2f-9634-73a4b0a46c4f","name":"Hawaiin Flowers","description":"White Flower","imageUrl":"/uploads/e65bcd57-b7a2-4d2f-9634-73a4b0a46c4f.png","waterCapacity":574256,"sunLight":456,"temperature":456},{"plantId":"f2a31e31-1161-410c-a683-8da3f957eae9","name":"Apple Blossom","description":"American crabapple tree","imageUrl":"/uploads/f2a31e31-1161-410c-a683-8da3f957eae9.png","waterCapacity":634,"sunLight":11321,"temperature":1234},{"plantId":"f985a224-ee41-411e-9327-dfb9822544ab","name":"Cherokee Rose","description":"This spring bloomer","imageUrl":"/uploads/f985a224-ee41-411e-9327-dfb9822544ab.png","waterCapacity":415,"sunLight":325,"temperature":512}]

class PlantsModel {
  PlantsModel({
      String? type, 
      String? message, 
      List<Data>? data,}){
    _type = type;
    _message = message;
    _data = data;
}

  PlantsModel.fromJson(dynamic json) {
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
PlantsModel copyWith({  String? type,
  String? message,
  List<Data>? data,
}) => PlantsModel(  type: type ?? _type,
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

/// plantId : "09512240-30c7-422b-91a2-5110d33c0f1f"
/// name : "American Marigold"
/// description : "American Marigold plants"
/// imageUrl : ""
/// waterCapacity : 2
/// sunLight : 7
/// temperature : 6

class Data {
  Data({
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

  Data.fromJson(dynamic json) {
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
Data copyWith({  String? plantId,
  String? name,
  String? description,
  String? imageUrl,
  num? waterCapacity,
  num? sunLight,
  num? temperature,
}) => Data(  plantId: plantId ?? _plantId,
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