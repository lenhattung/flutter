class Post {
  final int? id;
  final String? title;
  final String? body;

  Post({
    required this.id,
    required this.title,
    required this.body
  });

  Map<String, dynamic> toJson() => {
    "id" : id,
    "title" : title,
    "body" : body
  };

  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      id: json["id"],
      title: json["title"],
      body: json["body"],
    );
  }
}