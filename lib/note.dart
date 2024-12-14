/// id : 5
/// body : "Note added from console"
/// updated : "2024-12-12T18:12:27.771115Z"
/// created : "2024-12-12T18:12:27.771115Z"

class Note {
  Note({
      num? id, 
      String? body, 
      String? updated, 
      String? created,}){
    _id = id;
    _body = body;
    _updated = updated;
    _created = created;
}

  Note.fromJson(dynamic json) {
    _id = json['id'];
    _body = json['body'];
    _updated = json['updated'];
    _created = json['created'];
  }
  num? _id;
  String? _body;
  String? _updated;
  String? _created;
Note copyWith({  num? id,
  String? body,
  String? updated,
  String? created,
}) => Note(  id: id ?? _id,
  body: body ?? _body,
  updated: updated ?? _updated,
  created: created ?? _created,
);
  num? get id => _id;
  String? get body => _body;
  String? get updated => _updated;
  String? get created => _created;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['body'] = _body;
    map['updated'] = _updated;
    map['created'] = _created;
    return map;
  }

}