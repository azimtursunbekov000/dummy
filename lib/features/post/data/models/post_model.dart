import 'package:dummy/features/user/data/models/user_preview_model.dart';

class PostDataModel {
  final List<PostPreview> data;
  final int total;
  final int page;
  final int limit;

  PostDataModel({
    required this.data,
    required this.total,
    required this.page,
    required this.limit,
  });

  factory PostDataModel.fromJson(Map<String, dynamic> json) {
    return PostDataModel(
      data: (json['data'] as List)
          .map((item) => PostPreview.fromJson(item))
          .toList(),
      total: json['total'] ?? 0,
      page: json['page'] ?? 0,
      limit: json['limit'] ?? 0,
    );
  }
}

class PostPreview {
  final String id;
  final String text;
  final String imageUrl;
  int likes;
  final String link;
  final List<String> tags;
  final String publishDate;
  final UserPreview? owner;

  PostPreview({
    required this.id,
    required this.text,
    required this.imageUrl,
    required this.likes,
    required this.link,
    required this.tags,
    required this.publishDate,
    required this.owner,
  });

  factory PostPreview.fromJson(Map<String, dynamic> json) {
    return PostPreview(
      id: json['id'] ?? '',
      text: json['text'] ?? '',
      imageUrl: json['image'] ?? '',
      likes: json['likes'] ?? 0,
      link: json['link'] ?? '',
      tags: List<String>.from(json['tags'] ?? []),
      publishDate: json['publishDate'] ?? '',
      owner: json['owner'] != null ? UserPreview.fromJson(json['owner']) : null,
    );
  }
}
