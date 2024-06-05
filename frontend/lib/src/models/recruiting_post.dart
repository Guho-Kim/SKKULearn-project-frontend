class RecruitingPost {
  final String title;
  final String content;
  final int available;
  final String type;
  final String userName;
  final String imageUrl;

  RecruitingPost({
    required this.title,
    required this.content,
    required this.available,
    required this.type,
    required this.userName,
    required this.imageUrl,
  });
  factory RecruitingPost.fromJson(Map<String, dynamic> json) {
    return RecruitingPost(
      title: json['title'],
      content: json['content'],
      available: json['available'],
      type: json['type'],
      userName: json['userName'],
      imageUrl: json['imageUrl'],
    );
  }
}
