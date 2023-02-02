class NotificationFields {
  static const String id = "id";
  static const String newsTitle = "newsTitle";
  static const String description = "description";
  static const String newsImage = "newsImage";
  static const String dateTime = "dateTime";
}

class BreakingNews {
  final int? id;
  final String newsTitle;
  final String description;
  final String newsImage;
  final String dateTime;

  BreakingNews({
    this.id,
    required this.newsTitle,
    required this.description,
    required this.newsImage,
    required this.dateTime,
  });

  factory BreakingNews.fromJson(Map<String, Object?> json) => BreakingNews(
        id: json[NotificationFields.id] as int?,
        newsTitle: json[NotificationFields.newsTitle] as String? ?? "",
        description: json[NotificationFields.description] as String? ?? "",
        newsImage: json[NotificationFields.newsImage] as String? ?? "",
        dateTime: json[NotificationFields.dateTime] as String? ?? "",
      );

  BreakingNews copyWith(
          {int? id,
          String? newsTitle,
          String? description,
          String? newsImage,
          String? dateTime}) =>
      BreakingNews(
        id: id ?? this.id,
        newsTitle: newsTitle ?? this.newsTitle,
        description: description ?? this.description,
        newsImage: newsImage ?? this.newsImage,
        dateTime: dateTime ?? this.dateTime,
      );

  Map<String, dynamic> toJson() {
    return {
      'newsTitle': newsTitle,
      'description': description,
      'newsImage': newsImage,
      'dateTime': dateTime,
    };
  }
}
