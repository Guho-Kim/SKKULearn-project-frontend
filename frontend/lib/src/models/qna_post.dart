class Post {
  final int id;
  final String title;
  final String content;
  final int point;
  final String imageUrl;
  final List<Comment> comments;

  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.point,
    required this.imageUrl,
    required this.comments,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    var commentsFromJson = json['comments'] as List? ?? [];
    List<Comment> commentList =
        commentsFromJson.map((i) => Comment.fromJson(i)).toList();

    return Post(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      point: json['point'],
      imageUrl: json['imageUrl'],
      comments: commentList,
    );
  }
}

class Comment {
  final String author;
  final String content;

  Comment({required this.author, required this.content});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      author: json['author'],
      content: json['content'],
    );
  }
}
