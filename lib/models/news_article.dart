class NewsArticle {
  final String? title;
  final String? author;
  final String? description;
  final String? urlToImage;
  final String? url;
  final String? publishedAt;
  final String? content;

  NewsArticle({this.author,
       this.content,
       this.description,
       this.publishedAt,
       this.title,
       this.url,
      this.urlToImage});
  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'],
      author: json['author'],
      description: json['description'],
      urlToImage: json['urlToImage'],
      url: json['url'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
}
