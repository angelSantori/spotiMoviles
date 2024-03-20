import 'package:meta/meta.dart';
import 'dart:convert';

class CategoriesResponse {
    Categories categories;

    CategoriesResponse({
        required this.categories,
    });

    factory CategoriesResponse.fromRawJson(String str) => CategoriesResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CategoriesResponse.fromJson(Map<String, dynamic> json) => CategoriesResponse(
        categories: Categories.fromJson(json["categories"]),
    );

    Map<String, dynamic> toJson() => {
        "categories": categories.toJson(),
    };
}

class Categories {
    String href;
    List<Item> items;
    int limit;
    String next;
    int offset;
    dynamic previous;
    int total;

    Categories({
        required this.href,
        required this.items,
        required this.limit,
        required this.next,
        required this.offset,
        required this.previous,
        required this.total,
    });

    factory Categories.fromRawJson(String str) => Categories.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Categories.fromJson(Map<String, dynamic> json) => Categories(
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

class Item {
    String href;
    String id;
    List<Icon> icons;
    String name;

    Item({
        required this.href,
        required this.id,
        required this.icons,
        required this.name,
    });

    factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        href: json["href"],
        id: json["id"],
        icons: List<Icon>.from(json["icons"].map((x) => Icon.fromJson(x))),
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
        "id": id,
        "icons": List<dynamic>.from(icons.map((x) => x.toJson())),
        "name": name,
    };
}

class Icon {
    int height;
    String url;
    int width;

    Icon({
        required this.height,
        required this.url,
        required this.width,
    });

    factory Icon.fromRawJson(String str) => Icon.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Icon.fromJson(Map<String, dynamic> json) => Icon(
        height: json["height"],
        url: json["url"],
        width: json["width"],
    );

    Map<String, dynamic> toJson() => {
        "height": height,
        "url": url,
        "width": width,
    };
}
