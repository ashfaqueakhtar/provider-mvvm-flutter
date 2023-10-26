/// page : 2
/// per_page : 6
/// total : 12
/// total_pages : 2
/// data : [{"id":7,"email":"michael.lawson@reqres.in","first_name":"Michael","last_name":"Lawson","avatar":"https://reqres.in/img/faces/7-image.jpg"}]

class ColorNameListModel {
  ColorNameListModel({
    num? page,
      num? perPage, 
      num? total, 
      num? totalPages, 
      List<Data>? data,}){
    _page = page;
    _perPage = perPage;
    _total = total;
    _totalPages = totalPages;
    _data = data;
}

  ColorNameListModel.fromJson(dynamic json) {
    _page = json['page'];
    _perPage = json['per_page'];
    _total = json['total'];
    _totalPages = json['total_pages'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  num? _page;
  num? _perPage;
  num? _total;
  num? _totalPages;
  List<Data>? _data;
ColorNameListModel copyWith({  num? page,
  num? perPage,
  num? total,
  num? totalPages,
  List<Data>? data,
}) => ColorNameListModel(  page: page ?? _page,
  perPage: perPage ?? _perPage,
  total: total ?? _total,
  totalPages: totalPages ?? _totalPages,
  data: data ?? _data,
);
  num? get page => _page;
  num? get perPage => _perPage;
  num? get total => _total;
  num? get totalPages => _totalPages;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    map['per_page'] = _perPage;
    map['total'] = _total;
    map['total_pages'] = _totalPages;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 7
/// email : "michael.lawson@reqres.in"
/// first_name : "Michael"
/// last_name : "Lawson"
/// avatar : "https://reqres.in/img/faces/7-image.jpg"

class Data {
  Data({
      num? id, 
      String? email, 
      String? firstName, 
      String? lastName, 
      String? avatar,}){
    _id = id;
    _email = email;
    _firstName = firstName;
    _lastName = lastName;
    _avatar = avatar;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _email = json['email'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _avatar = json['avatar'];
  }
  num? _id;
  String? _email;
  String? _firstName;
  String? _lastName;
  String? _avatar;
Data copyWith({  num? id,
  String? email,
  String? firstName,
  String? lastName,
  String? avatar,
}) => Data(  id: id ?? _id,
  email: email ?? _email,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  avatar: avatar ?? _avatar,
);
  num? get id => _id;
  String? get email => _email;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get avatar => _avatar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['email'] = _email;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['avatar'] = _avatar;
    return map;
  }

}