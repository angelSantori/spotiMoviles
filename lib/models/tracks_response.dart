import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:spoti/models/models.dart';


class AlbumTracksResponse {
    String href;
    List<Item> items;
    int limit;
    dynamic next;
    int offset;
    dynamic previous;
    int total;

    AlbumTracksResponse({
        required this.href,
        required this.items,
        required this.limit,
        required this.next,
        required this.offset,
        required this.previous,
        required this.total,
    });

    factory AlbumTracksResponse.fromRawJson(String str) => AlbumTracksResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AlbumTracksResponse.fromJson(Map<String, dynamic> json) => AlbumTracksResponse(
        href: json["href"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "limit": limit,
        "next": next,
        "offset": offset,
        "previous": previous,
        "total": total,
    };
}
