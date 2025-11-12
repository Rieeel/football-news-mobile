// To parse this JSON data, do
//
//     final newsEntry = newsEntryFromJson(jsonString);

import 'dart:convert';

List<NewsEntry> newsEntryFromJson(String str) => List<NewsEntry>.from(json.decode(str).map((x) => NewsEntry.fromJson(x)));

String newsEntryToJson(List<NewsEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsEntry {
    String model;
    String pk;
    Fields fields;

    NewsEntry({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory NewsEntry.fromJson(Map<String, dynamic> json) => NewsEntry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String title;
    String content;
    String category;
    String thumbnail;
    bool isFeatured;
    DateTime createdAt;
    DateTime updatedAt;

    Fields({
        required this.user,
        required this.title,
        required this.content,
        required this.category,
        required this.thumbnail,
        required this.isFeatured,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        title: json["title"],
        content: json["content"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        isFeatured: json["is_featured"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "title": title,
        "content": content,
        "category": category,
        "thumbnail": thumbnail,
        "is_featured": isFeatured,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
