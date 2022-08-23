
class BlogsModel {
  BlogsModel({
      String? type, 
      String? message, 
      Data? data,}){
    _type = type;
    _message = message;
    _data = data;
}

  BlogsModel.fromJson(dynamic json) {
    _type = json['type'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _type;
  String? _message;
  Data? _data;
BlogsModel copyWith({  String? type,
  String? message,
  Data? data,
}) => BlogsModel(  type: type ?? _type,
  message: message ?? _message,
  data: data ?? _data,
);
  String? get type => _type;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}


class Data {
  Data({
      List<Plants>? plants, 
      List<Seeds>? seeds, 
      List<Tools>? tools,}){
    _plants = plants;
    _seeds = seeds;
    _tools = tools;
}

  Data.fromJson(dynamic json) {
    if (json['plants'] != null) {
      _plants = [];
      json['plants'].forEach((v) {
        _plants?.add(Plants.fromJson(v));
      });
    }
    if (json['seeds'] != null) {
      _seeds = [];
      json['seeds'].forEach((v) {
        _seeds?.add(Seeds.fromJson(v));
      });
    }
    if (json['tools'] != null) {
      _tools = [];
      json['tools'].forEach((v) {
        _tools?.add(Tools.fromJson(v));
      });
    }
  }
  List<Plants>? _plants;
  List<Seeds>? _seeds;
  List<Tools>? _tools;
Data copyWith({  List<Plants>? plants,
  List<Seeds>? seeds,
  List<Tools>? tools,
}) => Data(  plants: plants ?? _plants,
  seeds: seeds ?? _seeds,
  tools: tools ?? _tools,
);
  List<Plants>? get plants => _plants;
  List<Seeds>? get seeds => _seeds;
  List<Tools>? get tools => _tools;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_plants != null) {
      map['plants'] = _plants?.map((v) => v.toJson()).toList();
    }
    if (_seeds != null) {
      map['seeds'] = _seeds?.map((v) => v.toJson()).toList();
    }
    if (_tools != null) {
      map['tools'] = _tools?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}


class Tools {
  Tools({
      String? toolId, 
      String? name, 
      String? description, 
      String? imageUrl,}){
    _toolId = toolId;
    _name = name;
    _description = description;
    _imageUrl = imageUrl;
}

  Tools.fromJson(dynamic json) {
    _toolId = json['toolId'];
    _name = json['name'];
    _description = json['description'];
    _imageUrl = json['imageUrl'];
  }
  String? _toolId;
  String? _name;
  String? _description;
  String? _imageUrl;
Tools copyWith({  String? toolId,
  String? name,
  String? description,
  String? imageUrl,
}) => Tools(  toolId: toolId ?? _toolId,
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


class Seeds {
  Seeds({
      String? seedId, 
      String? name, 
      String? description, 
      String? imageUrl,}){
    _seedId = seedId;
    _name = name;
    _description = description;
    _imageUrl = imageUrl;
}

  Seeds.fromJson(dynamic json) {
    _seedId = json['seedId'];
    _name = json['name'];
    _description = json['description'];
    _imageUrl = json['imageUrl'];
  }
  String? _seedId;
  String? _name;
  String? _description;
  String? _imageUrl;
Seeds copyWith({  String? seedId,
  String? name,
  String? description,
  String? imageUrl,
}) => Seeds(  seedId: seedId ?? _seedId,
  name: name ?? _name,
  description: description ?? _description,
  imageUrl: imageUrl ?? _imageUrl,
);
  String? get seedId => _seedId;
  String? get name => _name;
  String? get description => _description;
  String? get imageUrl => _imageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['seedId'] = _seedId;
    map['name'] = _name;
    map['description'] = _description;
    map['imageUrl'] = _imageUrl;
    return map;
  }

}


class Plants {
  Plants({
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

  Plants.fromJson(dynamic json) {
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
Plants copyWith({  String? plantId,
  String? name,
  String? description,
  String? imageUrl,
  num? waterCapacity,
  num? sunLight,
  num? temperature,
}) => Plants(  plantId: plantId ?? _plantId,
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