
class ForumsModel {
  ForumsModel({
      String? type, 
      String? message, 
      List<Data>? data,}){
    _type = type;
    _message = message;
    _data = data;
}

  ForumsModel.fromJson(dynamic json) {
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
ForumsModel copyWith({  String? type,
  String? message,
  List<Data>? data,
}) => ForumsModel(  type: type ?? _type,
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
      String? forumId, 
      String? title, 
      String? description, 
      String? imageUrl, 
      String? userId, 
      List<String>? forumLikes, 
      List<String>? forumComments,}){
    _forumId = forumId;
    _title = title;
    _description = description;
    _imageUrl = imageUrl;
    _userId = userId;
    _forumLikes = forumLikes;
    _forumComments = forumComments;
}

  Data.fromJson(dynamic json) {
    _forumId = json['forumId'];
    _title = json['title'];
    _description = json['description'];
    _imageUrl = json['imageUrl'];
    _userId = json['userId'];
    _forumLikes = json['ForumLikes'] != null ? json['ForumLikes'].cast<String>() : [];
    _forumComments = json['ForumComments'] != null ? json['ForumComments'].cast<String>() : [];
  }
  String? _forumId;
  String? _title;
  String? _description;
  String? _imageUrl;
  String? _userId;
  List<String>? _forumLikes;
  List<String>? _forumComments;
Data copyWith({  String? forumId,
  String? title,
  String? description,
  String? imageUrl,
  String? userId,
  List<String>? forumLikes,
  List<String>? forumComments,
}) => Data(  forumId: forumId ?? _forumId,
  title: title ?? _title,
  description: description ?? _description,
  imageUrl: imageUrl ?? _imageUrl,
  userId: userId ?? _userId,
  forumLikes: forumLikes ?? _forumLikes,
  forumComments: forumComments ?? _forumComments,
);
  String? get forumId => _forumId;
  String? get title => _title;
  String? get description => _description;
  String? get imageUrl => _imageUrl;
  String? get userId => _userId;
  List<String>? get forumLikes => _forumLikes;
  List<String>? get forumComments => _forumComments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['forumId'] = _forumId;
    map['title'] = _title;
    map['description'] = _description;
    map['imageUrl'] = _imageUrl;
    map['userId'] = _userId;
    map['ForumLikes'] = _forumLikes;
    map['ForumComments'] = _forumComments;
    return map;
  }

}