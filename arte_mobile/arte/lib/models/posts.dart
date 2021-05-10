// To parse this JSON data, do
//
//     final posts = postsFromJson(jsonString);

import 'dart:convert';

Posts postsFromJson(String str) => Posts.fromJson(json.decode(str));

String postsToJson(Posts data) => json.encode(data.toJson());

class Posts {
    Posts({
        this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
    });

    int currentPage;
    List<Datum> data;
    String firstPageUrl;
    int from;
    dynamic nextPageUrl;
    String path;
    int perPage;
    dynamic prevPageUrl;
    int to;

    factory Posts.fromJson(Map<String, dynamic> json) => Posts(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
    };
}

class Datum {
    Datum({
        this.id,
        this.title,
        this.subtitle,
        this.description,
        this.likes,
        this.dislikes,
        this.hearts,
        this.tags,
        this.createdAt,
        this.updatedAt,
        this.userAuthorId,
        this.name,
        this.email,
        this.imageProfile,
        this.uploadImages,
    });

    int id;
    String title;
    String subtitle;
    String description;
    int likes;
    int dislikes;
    int hearts;
    String tags;
    DateTime createdAt;
    DateTime updatedAt;
    int userAuthorId;
    String name;
    String email;
    String imageProfile;
    List<UploadImage> uploadImages;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        description: json["description"],
        likes: json["likes"],
        dislikes: json["dislikes"],
        hearts: json["hearts"],
        tags: json["tags"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        userAuthorId: json["user_author_id"],
        name: json["name"],
        email: json["email"],
        imageProfile: json["image_profile"],
        uploadImages: List<UploadImage>.from(json["upload_images"].map((x) => UploadImage.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "description": description,
        "likes": likes,
        "dislikes": dislikes,
        "hearts": hearts,
        "tags": tags,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user_author_id": userAuthorId,
        "name": name,
        "email": email,
        "image_profile": imageProfile,
        // "upload_images": List<dynamic>.from(uploadImages.map((x) => x.toJson())),
        "upload_images": List<dynamic>.from(uploadImages.map((x) => x.toJson())),
    };
}

class UploadImage {
    UploadImage({
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

    factory UploadImage.fromJson(Map<String, dynamic> json) => UploadImage(
        id: json["id"],
        imageLink: json["image_link"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        postComId: json["post_com_id"],
        userAuthorId: json["user_authorId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image_link": imageLink,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "post_com_id": postComId,
        "user_authorId": userAuthorId,
    };
}
