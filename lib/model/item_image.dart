class ItemImage {
  String imageUrl;
  String type;
  String tags;

//<editor-fold desc="Data Methods">
  ItemImage({
    required this.imageUrl,
    required this.type,
    required this.tags,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemImage &&
          runtimeType == other.runtimeType &&
          imageUrl == other.imageUrl &&
          type == other.type &&
          tags == other.tags);

  @override
  int get hashCode => imageUrl.hashCode ^ type.hashCode ^ tags.hashCode;

  @override
  String toString() {
    return 'ItemImage{ imageUrl: $imageUrl, type: $type, tags: $tags,}';
  }

  ItemImage copyWith({
    String? imageUrl,
    String? type,
    String? tags,
  }) {
    return ItemImage(
      imageUrl: imageUrl ?? this.imageUrl,
      type: type ?? this.type,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': this.imageUrl,
      'type': this.type,
      'tags': this.tags,
    };
  }

  factory ItemImage.fromJson(Map<String, dynamic> json) {
    return ItemImage(
      imageUrl: json['imageUrl'] as String,
      type: json['type'] as String,
      tags: json['tags'] as String,
    );
  }

//</editor-fold>
}
