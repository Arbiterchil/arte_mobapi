// To parse this JSON data, do
//
//     final uploads = uploadsFromJson(jsonString);

import 'dart:convert';

List<Uploads> uploadsFromJson(String str) => List<Uploads>.from(json.decode(str).map((x) => Uploads.fromJson(x)));

String uploadsToJson(List<Uploads> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Uploads {
    Uploads({
        this.id,
        this.imageLink,
        this.createdAt,
        this.updatedAt,
        this.postComId,
        this.userAuthorId,
    });

    int id;
    String imageLink;
    DateTime createdAt;
    DateTime updatedAt;
    int postComId;
    int userAuthorId;

    factory Uploads.fromJson(Map<String, dynamic> json) => Uploads(
        id: json["id"] == null ? null : json["id"],
        imageLink: json["image_link"] == null ? null : json["image_link"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        postComId: json["post_com_id"] == null ? null : json["post_com_id"],
        userAuthorId: json["user_authorId"] == null ? null : json["user_authorId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "image_link": imageLink == null ? null : imageLink,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "post_com_id": postComId == null ? null : postComId,
        "user_authorId": userAuthorId == null ? null : userAuthorId,
    };
}
