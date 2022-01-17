class Category{
  int id;
  int typeId;
  String name;

  Category({
    this.typeId,
    this.name
  });

  Category.withId({
    this.id,
    this.typeId,
    this.name
  });

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();

    if (id != null) {
      map['id'] = id;
    }
    map['typeId'] = typeId;
    map['name'] = name;

    return map;
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category.withId(
      id: map['id'],
      typeId: map['typeId'],
      name: map['name'],
    );
  }
}