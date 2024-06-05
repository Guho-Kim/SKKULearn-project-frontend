class SharingPost {
  final int id;
  final String title;
  final String content;
  final int point;
  final String imageUrl;
  final int likes;

  SharingPost({
    required this.id,
    required this.title,
    required this.content,
    required this.point,
    required this.imageUrl,
    required this.likes,
  });

  factory SharingPost.fromJson(Map<String, dynamic> json) {
    return SharingPost(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      point: json['point'],
      imageUrl: json['imageUrl'],
      likes: json['likes'],
    );
  }
}
