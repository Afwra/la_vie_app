/// type : "Success"
/// message : "Seed Fetched Successfully"
/// data : [{"seedId":"0ba0060a-a353-43dd-87d5-15a4523dcf0c","name":"FlaxSeeds","description":"super rich in fiber","imageUrl":""},{"seedId":"178151ab-ed50-4bbb-89a3-627773ae6d1b","name":"FlaxSeeds","description":"super rich in fiber","imageUrl":""},{"seedId":"1d9ee5fb-e3b8-4b72-bce0-c6874e4b4a84","name":"test","description":"test description","imageUrl":"/uploads/1d9ee5fb-e3b8-4b72-bce0-c6874e4b4a84.jpg"},{"seedId":"1f1f763f-9a1a-4866-88ba-73dc8e5dfe0d","name":"test","description":"test description","imageUrl":""},{"seedId":"20113eb3-666f-4752-ac05-1927c2f23290","name":"test","description":"test description","imageUrl":"/uploads/20113eb3-666f-4752-ac05-1927c2f23290.jpg"},{"seedId":"2a1a73e7-3f38-47a0-a056-e2244e8da660","name":"FlaxSeeds","description":"super rich in fiber","imageUrl":""},{"seedId":"2b49d27f-ddea-4230-88d9-e1d1948f6788","name":"FlaxSeeds","description":"super rich in fiber","imageUrl":""},{"seedId":"2b909e65-9e4d-4647-817e-29dc55cdbbc9","name":"FlaxSeeds","description":"super rich in fiber","imageUrl":""},{"seedId":"37f9035c-23a7-4582-9b32-8aa5d4fe5603","name":"FlaxSeeds","description":"super rich in fiber","imageUrl":""},{"seedId":"4409aedc-799f-4f86-99bc-d6f04aa15c81","name":"Jasmine Seeds","description":"You can plant Jasmine seeds by putting it in soil and putting water on it and keeping it in the sun.","imageUrl":"/uploads/4409aedc-799f-4f86-99bc-d6f04aa15c81.jpg"},{"seedId":"4e2cbed7-5931-4ded-a23a-8b496b8fc61e","name":"FlaxSeeds","description":"super rich in fiber","imageUrl":""},{"seedId":"6bacc3c4-bf00-4624-a0b2-a23ba302d757","name":"FlaxSeeds","description":"super rich in fiber","imageUrl":""},{"seedId":"81c4a46f-4e6e-451e-adc4-f4f8b2945fb6","name":"test","description":"test description","imageUrl":"/uploads/81c4a46f-4e6e-451e-adc4-f4f8b2945fb6.jpg"},{"seedId":"8aa3bdea-396e-4f8b-b27a-575b0bf52331","name":"FlaxSeeds","description":"super rich in fiber","imageUrl":""},{"seedId":"8df5b0f1-8e6e-4e42-bfb6-1d12ea68c990","name":"in veniam enim ex","description":"dolor ex amet","imageUrl":""},{"seedId":"8f8f8b27-fce8-405b-a3e3-e584de9595a0","name":"test","description":"test description","imageUrl":"/uploads/8f8f8b27-fce8-405b-a3e3-e584de9595a0.jpg"},{"seedId":"91a77205-53dc-4244-af23-90587253643b","name":"FlaxSeeds","description":"super rich in fiber","imageUrl":""},{"seedId":"928c8c85-f86c-4927-ae87-ad96663fb538","name":"test","description":"test description","imageUrl":""},{"seedId":"98687098-6192-48f1-8ca7-aaec952d3a5e","name":"test","description":"test description","imageUrl":""},{"seedId":"a0375562-31ee-4d0e-b5c8-624d36d22d2b","name":"test","description":"test description","imageUrl":"/uploads/a0375562-31ee-4d0e-b5c8-624d36d22d2b.jpg"},{"seedId":"b6bb37ab-fb28-46a3-aa9f-d27662b22153","name":"FlaxSeeds","description":"super rich in fiber","imageUrl":""},{"seedId":"c67184ab-dc77-4381-a505-17af5b830e85","name":"FlaxSeeds","description":"super rich in fiber","imageUrl":""},{"seedId":"dcbbe466-416c-4797-a496-7e054495d47b","name":"FlaxSeeds","description":"super rich in fiber","imageUrl":"/uploads/dcbbe466-416c-4797-a496-7e054495d47b.jpg"},{"seedId":"eb89fdb6-dad9-4eb2-aaa9-f7a702a55895","name":"FlaxSeeds","description":"super rich in fiber","imageUrl":""},{"seedId":"ed6ba60b-3fb4-494f-8843-78b206e62311","name":"test","description":"test description","imageUrl":"/uploads/ed6ba60b-3fb4-494f-8843-78b206e62311.jpg"},{"seedId":"ef330754-57af-4a77-9466-edd64a63a8bd","name":"test","description":"test description","imageUrl":"/uploads/ef330754-57af-4a77-9466-edd64a63a8bd.jpg"}]

class SeedsModel {
  SeedsModel({
      String? type, 
      String? message, 
      List<Data>? data,}){
    _type = type;
    _message = message;
    _data = data;
}

  SeedsModel.fromJson(dynamic json) {
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
SeedsModel copyWith({  String? type,
  String? message,
  List<Data>? data,
}) => SeedsModel(  type: type ?? _type,
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

/// seedId : "0ba0060a-a353-43dd-87d5-15a4523dcf0c"
/// name : "FlaxSeeds"
/// description : "super rich in fiber"
/// imageUrl : ""

class Data {
  Data({
      String? seedId, 
      String? name, 
      String? description, 
      String? imageUrl,}){
    _seedId = seedId;
    _name = name;
    _description = description;
    _imageUrl = imageUrl;
}

  Data.fromJson(dynamic json) {
    _seedId = json['seedId'];
    _name = json['name'];
    _description = json['description'];
    _imageUrl = json['imageUrl'];
  }
  String? _seedId;
  String? _name;
  String? _description;
  String? _imageUrl;
Data copyWith({  String? seedId,
  String? name,
  String? description,
  String? imageUrl,
}) => Data(  seedId: seedId ?? _seedId,
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