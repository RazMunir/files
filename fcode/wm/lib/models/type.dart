class Type{
  int id;
  String name;

  Type({this.name});

  Type.withId({
    this.id,
    this.name
  });

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();

    if (id != null) {
      map['id'] = id;
    }
    map['name'] = name;

    return map;
  }

  factory Type.fromMap(Map<String, dynamic> map) {
    return Type.withId(
      id: map['id'],
      name: map['name'],
    );
  }
}