class NewsRes {
  const NewsRes(this.title, this.content, this.created_at, this.id, this.updated_at, this.user_id, this.status );

  NewsRes.fromJson(Map<String, dynamic> json)
      : content = json['content'],
        title = json['title'],
        created_at = json['created_at'],
        updated_at = json['updated_at'] ??= "",
        status = json['status'] ??= "ANALISANDO",
        id = json['id'],
        user_id = json['user_id'];

  final String content;
  final String title;
  final String created_at;
  final String updated_at;
  final int id; 
  final int user_id; 
  final String status;
}