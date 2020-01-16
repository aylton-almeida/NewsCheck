class ResponseModel {
  final int id;
  final String content;

  ResponseModel(this.id, this.content);

  ResponseModel.fromJson(Map<String, dynamic> json)
      : id = int.parse(json['id']),
        content = json['content'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'content': content,
      };
}
