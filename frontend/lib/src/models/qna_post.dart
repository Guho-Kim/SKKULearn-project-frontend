class QnaPost {
  final int id;
  final String title;
  final String content;
  final int point;
  final String postImageUrl;
  final List<Comment> comments;

  QnaPost({
    required this.id,
    required this.title,
    required this.content,
    required this.point,
    required this.postImageUrl,
    required this.comments,
  });

  factory QnaPost.fromJson(Map<String, dynamic> json) {
    var commentsFromJson = json['comments'] as List? ?? [];
    List<Comment> commentList =
        commentsFromJson.map((i) => Comment.fromJson(i)).toList();

    return QnaPost(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      point: json['point'],
      postImageUrl: json['postImageUrl'],
      comments: commentList,
    );
  }
}

class Comment {
  final String author;
  final String content;
  final String userImageUrl;

  Comment(
      {required this.author,
      required this.content,
      required this.userImageUrl});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      author: json['author'],
      content: json['content'],
      userImageUrl: json['userImageUrl'],
    );
  }
}
