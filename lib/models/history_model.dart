class History {
  int? id;
  String data;
  int isUnicode;
  String createdAt;

  History(
      {this.id,
      required this.data,
      required this.isUnicode,
      required this.createdAt});

  factory History.fromMap(Map<String, dynamic> data) => History(
        id: data["id"],
        data: data["data"],
        isUnicode: data['isUnicode'] as int,
        createdAt: data["createdAt"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "data": data,
        "isUnicode": isUnicode,
        "createdAt": createdAt,
      };
}
