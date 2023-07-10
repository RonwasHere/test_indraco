import 'dart:convert';

List<UserAlbum> userAlbumFromJson(String str) =>
    List<UserAlbum>.from(json.decode(str).map((x) => UserAlbum.fromJson(x)));

String userAlbumToJson(List<UserAlbum> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserAlbum {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  UserAlbum({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory UserAlbum.fromJson(Map<String, dynamic> json) => UserAlbum(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
