/// type : "Success"
/// message : "Forums fetched successfully"
/// data : [{"forumId":"3de0e540-d1d9-4b8b-adb2-e261019d323f","title":"exercitation laborum","description":"Lorem tempor consequat","imageUrl":"/uploads/3de0e540-d1d9-4b8b-adb2-e261019d323f.jpg","userId":"32c8f294-574f-4aef-b821-47ea41f46615","ForumLikes":[{"forumId":"3de0e540-d1d9-4b8b-adb2-e261019d323f","userId":"1863ad5c-7a66-48bc-bea6-c81b31905032"}],"ForumComments":[{"forumCommentId":"0a2d2c22-9f49-44d3-81e1-2d29650fbdeb","forumId":"3de0e540-d1d9-4b8b-adb2-e261019d323f","userId":"1863ad5c-7a66-48bc-bea6-c81b31905032","comment":"consectetur ullamco cillum iru","createdAt":"2022-08-20T22:32:57.385Z"},{"forumCommentId":"11680c1a-5521-49ec-b794-76aaae337691","forumId":"3de0e540-d1d9-4b8b-adb2-e261019d323f","userId":"1863ad5c-7a66-48bc-bea6-c81b31905032","comment":"consectetur ullamco cillum iru","createdAt":"2022-08-20T22:33:05.652Z"},{"forumCommentId":"15573426-62e9-478d-a20d-c40a5551bace","forumId":"3de0e540-d1d9-4b8b-adb2-e261019d323f","userId":"1863ad5c-7a66-48bc-bea6-c81b31905032","comment":"consectetur ullamco cillum iru","createdAt":"2022-08-20T22:33:02.785Z"},{"forumCommentId":"28838869-46c5-40f3-8d47-8d50a6475065","forumId":"3de0e540-d1d9-4b8b-adb2-e261019d323f","userId":"1863ad5c-7a66-48bc-bea6-c81b31905032","comment":"consectetur ullamco cillum iru","createdAt":"2022-08-20T22:33:03.854Z"},{"forumCommentId":"3bfd3828-b3c9-4f4e-937c-99cb6e7c47e3","forumId":"3de0e540-d1d9-4b8b-adb2-e261019d323f","userId":"1863ad5c-7a66-48bc-bea6-c81b31905032","comment":"consectetur ullamco cillum iru","createdAt":"2022-08-20T22:32:55.783Z"},{"forumCommentId":"4a2b3731-2897-4fcb-8fd2-385641ea1e1e","forumId":"3de0e540-d1d9-4b8b-adb2-e261019d323f","userId":"1863ad5c-7a66-48bc-bea6-c81b31905032","comment":"consectetur ullamco cillum iru","createdAt":"2022-08-20T19:47:28.946Z"},{"forumCommentId":"6070a8ef-5c0c-44ab-b181-6447449e4a64","forumId":"3de0e540-d1d9-4b8b-adb2-e261019d323f","userId":"1863ad5c-7a66-48bc-bea6-c81b31905032","comment":"consectetur ullamco cillum iru","createdAt":"2022-08-20T22:32:58.851Z"},{"forumCommentId":"7585bd85-fb41-4d48-961f-6d3a182afdc9","forumId":"3de0e540-d1d9-4b8b-adb2-e261019d323f","userId":"1863ad5c-7a66-48bc-bea6-c81b31905032","comment":"consectetur ullamco cillum iru","createdAt":"2022-08-20T22:33:00.419Z"},{"forumCommentId":"79924032-c4a6-4d45-b780-eaee067498d8","forumId":"3de0e540-d1d9-4b8b-adb2-e261019d323f","userId":"1863ad5c-7a66-48bc-bea6-c81b31905032","comment":"consectetur ullamco cillum iru","createdAt":"2022-08-20T22:33:06.863Z"},{"forumCommentId":"8c976657-35d9-427d-a280-dea1439c5309","forumId":"3de0e540-d1d9-4b8b-adb2-e261019d323f","userId":"1863ad5c-7a66-48bc-bea6-c81b31905032","comment":"consectetur ullamco cillum iru","createdAt":"2022-08-20T22:33:07.734Z"},{"forumCommentId":"e1d371d6-5a54-487b-af30-881eb57546de","forumId":"3de0e540-d1d9-4b8b-adb2-e261019d323f","userId":"1863ad5c-7a66-48bc-bea6-c81b31905032","comment":"consectetur ullamco cillum iru","createdAt":"2022-08-20T22:33:04.752Z"},{"forumCommentId":"e65f1411-b632-46ce-8b12-06b81bf5729c","forumId":"3de0e540-d1d9-4b8b-adb2-e261019d323f","userId":"1863ad5c-7a66-48bc-bea6-c81b31905032","comment":"consectetur ullamco cillum iru","createdAt":"2022-08-20T22:33:01.752Z"}]},null]

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

/// forumId : "3de0e540-d1d9-4b8b-adb2-e261019d323f"
/// title : "exercitation laborum"
/// description : "Lorem tempor consequat"
/// imageUrl : "/uploads/3de0e540-d1d9-4b8b-adb2-e261019d323f.jpg"
/// userId : "32c8f294-574f-4aef-b821-47ea41f46615"
/// ForumLikes : [{"forumId":"3de0e540-d1d9-4b8b-adb2-e261019d323f","userId":"1863ad5c-7a66-48bc-bea6-c81b31905032"}]
/// ForumComments : [{"forumCommentId":"0a2d2c22-9f49-44d3-81e1-2d29650fbdeb","forumId":"3de0e540-d1d9-4b8b-adb2-e261019d323f","userId":"1863ad5c-7a66-48bc-bea6-c81b31905032","comment":"consectetur ullamco cillum iru","createdAt":"2022-08-20T22:32:57.385Z"},{"forumCommentId":"11680c1a-5521-49ec-b794-76aaae337691","forumId":"3de0e540-d1d9-4b8b-adb2-e261019d323f","userId":"1863ad5c-7a66-48bc-bea6-c81b31905032","comment":"consectetur ullamco cillum iru","createdAt":"2022-08-20T22:33:05.652Z"},{"forumCommentId":"15573426-62e9-478d-a20d-c40a5551bace","forumId":"3de0e540-d1d9-4b8b-adb2-e261019d323f","userId":"1863ad5c-7a66-48bc-bea6-c81b31905032","comment":"consectetur ullamco cillum iru","createdAt":"2022-08-20T22:33:02.785Z"},{"forumCommentId":"28838869-46c5-40f3-8d47-8d50a6475065","forumId":"3de0e540-d1d9-4b8b-adb2-e261019d323f","userId":"1863ad5c-7a66-48bc-bea6-c81b31905032","comment":"consectetur ullamco cillum iru","createdAt":"2022-08-20T22:33:03.854Z"},{"forumCommentId":"3bfd3828-b3c9-4f4e-937c-99cb6e7c47e3","forumId":"3de0e540-d1d9-4b8b-adb2-e261019d323f","userId":"1863ad5c-7a66-48bc-bea6-c81b31905032","comment":"consectetur ullamco cillum iru","createdAt":"2022-08-20T22:32:55.783Z"},{"forumCommentId":"4a2b3731-2897-4fcb-8fd2-385641ea1e1e","forumId":"3de0e540-d1d9-4b8b-adb2-e261019d323f","userId":"1863ad5c-7a66-48bc-bea6-c81b31905032","comment":"consectetur ullamco cillum iru","createdAt":"2022-08-20T19:47:28.946Z"},{"forumCommentId":"6070a8ef-5c0c-44ab-b181-6447449e4a64","forumId":"3de0e540-d1d9-4b8b-adb2-e261019d323f","userId":"1863ad5c-7a66-48bc-bea6-c81b31905032","comment":"consectetur ullamco cillum iru","createdAt":"2022-08-20T22:32:58.851Z"},{"forumCommentId":"7585bd85-fb41-4d48-961f-6d3a182afdc9","forumId":"3de0e540-d1d9-4b8b-adb2-e261019d323f","userId":"1863ad5c-7a66-48bc-bea6-c81b31905032","comment":"consectetur ullamco cillum iru","createdAt":"2022-08-20T22:33:00.419Z"},{"forumCommentId":"79924032-c4a6-4d45-b780-eaee067498d8","forumId":"3de0e540-d1d9-4b8b-adb2-e261019d323f","userId":"1863ad5c-7a66-48bc-bea6-c81b31905032","comment":"consectetur ullamco cillum iru","createdAt":"2022-08-20T22:33:06.863Z"},{"forumCommentId":"8c976657-35d9-427d-a280-dea1439c5309","forumId":"3de0e540-d1d9-4b8b-adb2-e261019d323f","userId":"1863ad5c-7a66-48bc-bea6-c81b31905032","comment":"consectetur ullamco cillum iru","createdAt":"2022-08-20T22:33:07.734Z"},{"forumCommentId":"e1d371d6-5a54-487b-af30-881eb57546de","forumId":"3de0e540-d1d9-4b8b-adb2-e261019d323f","userId":"1863ad5c-7a66-48bc-bea6-c81b31905032","comment":"consectetur ullamco cillum iru","createdAt":"2022-08-20T22:33:04.752Z"},{"forumCommentId":"e65f1411-b632-46ce-8b12-06b81bf5729c","forumId":"3de0e540-d1d9-4b8b-adb2-e261019d323f","userId":"1863ad5c-7a66-48bc-bea6-c81b31905032","comment":"consectetur ullamco cillum iru","createdAt":"2022-08-20T22:33:01.752Z"}]

class Data {
  Data({
      String? forumId, 
      String? title, 
      String? description, 
      String? imageUrl, 
      String? userId, 
      List<ForumLikes>? forumLikes, 
      List<ForumComments>? forumComments,}){
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
    if (json['ForumLikes'] != null) {
      _forumLikes = [];
      json['ForumLikes'].forEach((v) {
        _forumLikes?.add(ForumLikes.fromJson(v));
      });
    }
    if (json['ForumComments'] != null) {
      _forumComments = [];
      json['ForumComments'].forEach((v) {
        _forumComments?.add(ForumComments.fromJson(v));
      });
    }
  }
  String? _forumId;
  String? _title;
  String? _description;
  String? _imageUrl;
  String? _userId;
  List<ForumLikes>? _forumLikes;
  List<ForumComments>? _forumComments;
Data copyWith({  String? forumId,
  String? title,
  String? description,
  String? imageUrl,
  String? userId,
  List<ForumLikes>? forumLikes,
  List<ForumComments>? forumComments,
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
  List<ForumLikes>? get forumLikes => _forumLikes;
  List<ForumComments>? get forumComments => _forumComments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['forumId'] = _forumId;
    map['title'] = _title;
    map['description'] = _description;
    map['imageUrl'] = _imageUrl;
    map['userId'] = _userId;
    if (_forumLikes != null) {
      map['ForumLikes'] = _forumLikes?.map((v) => v.toJson()).toList();
    }
    if (_forumComments != null) {
      map['ForumComments'] = _forumComments?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// forumCommentId : "0a2d2c22-9f49-44d3-81e1-2d29650fbdeb"
/// forumId : "3de0e540-d1d9-4b8b-adb2-e261019d323f"
/// userId : "1863ad5c-7a66-48bc-bea6-c81b31905032"
/// comment : "consectetur ullamco cillum iru"
/// createdAt : "2022-08-20T22:32:57.385Z"

class ForumComments {
  ForumComments({
      String? forumCommentId, 
      String? forumId, 
      String? userId, 
      String? comment, 
      String? createdAt,}){
    _forumCommentId = forumCommentId;
    _forumId = forumId;
    _userId = userId;
    _comment = comment;
    _createdAt = createdAt;
}

  ForumComments.fromJson(dynamic json) {
    _forumCommentId = json['forumCommentId'];
    _forumId = json['forumId'];
    _userId = json['userId'];
    _comment = json['comment'];
    _createdAt = json['createdAt'];
  }
  String? _forumCommentId;
  String? _forumId;
  String? _userId;
  String? _comment;
  String? _createdAt;
ForumComments copyWith({  String? forumCommentId,
  String? forumId,
  String? userId,
  String? comment,
  String? createdAt,
}) => ForumComments(  forumCommentId: forumCommentId ?? _forumCommentId,
  forumId: forumId ?? _forumId,
  userId: userId ?? _userId,
  comment: comment ?? _comment,
  createdAt: createdAt ?? _createdAt,
);
  String? get forumCommentId => _forumCommentId;
  String? get forumId => _forumId;
  String? get userId => _userId;
  String? get comment => _comment;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['forumCommentId'] = _forumCommentId;
    map['forumId'] = _forumId;
    map['userId'] = _userId;
    map['comment'] = _comment;
    map['createdAt'] = _createdAt;
    return map;
  }

}

/// forumId : "3de0e540-d1d9-4b8b-adb2-e261019d323f"
/// userId : "1863ad5c-7a66-48bc-bea6-c81b31905032"

class ForumLikes {
  ForumLikes({
      String? forumId, 
      String? userId,}){
    _forumId = forumId;
    _userId = userId;
}

  ForumLikes.fromJson(dynamic json) {
    _forumId = json['forumId'];
    _userId = json['userId'];
  }
  String? _forumId;
  String? _userId;
ForumLikes copyWith({  String? forumId,
  String? userId,
}) => ForumLikes(  forumId: forumId ?? _forumId,
  userId: userId ?? _userId,
);
  String? get forumId => _forumId;
  String? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['forumId'] = _forumId;
    map['userId'] = _userId;
    return map;
  }

}