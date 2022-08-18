/// type : "Success"
/// message : "Filters Fetched Successfully"
/// data : {"plants":[{"name":"American Marigold"},{"name":"Orange Blossom"},{"name":"Hawaiin Flowers"},{"name":"Forget Me Not"},{"name":"Mountain Laurel"},{"name":"Common Violet"},{"name":"California Poppy"},{"name":"Camellia"},{"name":"Yellow Hibiscus"},{"name":"Ageratum"},{"name":"Peach Blossom"},{"name":"Lewis Mock Orange"},{"name":"Saguaro Cactus Blossom"},{"name":"Rocky Mountain Columbine"},{"name":"American Marigold"},{"name":"American Marigold"},{"name":"Peony"},{"name":"Hawaiin Flowers"},{"name":"Apple Blossom"},{"name":"Cherokee Rose"}],"seeds":[{"name":"FlaxSeeds"},{"name":"FlaxSeeds"},{"name":"test"},{"name":"test"},{"name":"test"},{"name":"FlaxSeeds"},{"name":"FlaxSeeds"},{"name":"FlaxSeeds"},{"name":"FlaxSeeds"},{"name":"Jasmine Seeds"},{"name":"FlaxSeeds"},{"name":"FlaxSeeds"},{"name":"test"},{"name":"FlaxSeeds"},{"name":"in veniam enim ex"},{"name":"test"},{"name":"FlaxSeeds"},{"name":"test"},{"name":"test"},{"name":"test"},{"name":"FlaxSeeds"},{"name":"FlaxSeeds"},{"name":"FlaxSeeds"},{"name":"FlaxSeeds"},{"name":"test"},{"name":"test"}],"tools":[{"name":"Axe"},{"name":"Axe"},{"name":"Ageratum"},{"name":"test"},{"name":"Ageratum"},{"name":"Gardener"},{"name":"Hedge shears"},{"name":"Axe"},{"name":"Ageratum"},{"name":"Gardening gloves"},{"name":"Rake"},{"name":"Axe"},{"name":"Ageratum"},{"name":"Ageratum"},{"name":"Axe"},{"name":"Axe"},{"name":"Gardening fork"},{"name":"test"}]}

class FilterModel {
  FilterModel({
      String? type, 
      String? message, 
      Data? data,}){
    _type = type;
    _message = message;
    _data = data;
}

  FilterModel.fromJson(dynamic json) {
    _type = json['type'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _type;
  String? _message;
  Data? _data;
FilterModel copyWith({  String? type,
  String? message,
  Data? data,
}) => FilterModel(  type: type ?? _type,
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

/// plants : [{"name":"American Marigold"},{"name":"Orange Blossom"},{"name":"Hawaiin Flowers"},{"name":"Forget Me Not"},{"name":"Mountain Laurel"},{"name":"Common Violet"},{"name":"California Poppy"},{"name":"Camellia"},{"name":"Yellow Hibiscus"},{"name":"Ageratum"},{"name":"Peach Blossom"},{"name":"Lewis Mock Orange"},{"name":"Saguaro Cactus Blossom"},{"name":"Rocky Mountain Columbine"},{"name":"American Marigold"},{"name":"American Marigold"},{"name":"Peony"},{"name":"Hawaiin Flowers"},{"name":"Apple Blossom"},{"name":"Cherokee Rose"}]
/// seeds : [{"name":"FlaxSeeds"},{"name":"FlaxSeeds"},{"name":"test"},{"name":"test"},{"name":"test"},{"name":"FlaxSeeds"},{"name":"FlaxSeeds"},{"name":"FlaxSeeds"},{"name":"FlaxSeeds"},{"name":"Jasmine Seeds"},{"name":"FlaxSeeds"},{"name":"FlaxSeeds"},{"name":"test"},{"name":"FlaxSeeds"},{"name":"in veniam enim ex"},{"name":"test"},{"name":"FlaxSeeds"},{"name":"test"},{"name":"test"},{"name":"test"},{"name":"FlaxSeeds"},{"name":"FlaxSeeds"},{"name":"FlaxSeeds"},{"name":"FlaxSeeds"},{"name":"test"},{"name":"test"}]
/// tools : [{"name":"Axe"},{"name":"Axe"},{"name":"Ageratum"},{"name":"test"},{"name":"Ageratum"},{"name":"Gardener"},{"name":"Hedge shears"},{"name":"Axe"},{"name":"Ageratum"},{"name":"Gardening gloves"},{"name":"Rake"},{"name":"Axe"},{"name":"Ageratum"},{"name":"Ageratum"},{"name":"Axe"},{"name":"Axe"},{"name":"Gardening fork"},{"name":"test"}]

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

/// name : "Axe"

class Tools {
  Tools({
      String? name,}){
    _name = name;
}

  Tools.fromJson(dynamic json) {
    _name = json['name'];
  }
  String? _name;
Tools copyWith({  String? name,
}) => Tools(  name: name ?? _name,
);
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    return map;
  }

}

/// name : "FlaxSeeds"

class Seeds {
  Seeds({
      String? name,}){
    _name = name;
}

  Seeds.fromJson(dynamic json) {
    _name = json['name'];
  }
  String? _name;
Seeds copyWith({  String? name,
}) => Seeds(  name: name ?? _name,
);
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    return map;
  }

}

/// name : "American Marigold"

class Plants {
  Plants({
      String? name,}){
    _name = name;
}

  Plants.fromJson(dynamic json) {
    _name = json['name'];
  }
  String? _name;
Plants copyWith({  String? name,
}) => Plants(  name: name ?? _name,
);
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    return map;
  }

}