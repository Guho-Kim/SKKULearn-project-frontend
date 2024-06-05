class Post {
  final int id;
  final String title;
  final String content;
  final int point;
  final String imageUrl;
  final int likes;

  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.point,
    required this.imageUrl,
    required this.likes,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      point: json['point'],
      imageUrl: json['imageUrl'],
      likes: json['likes'],
    );
  }
}
