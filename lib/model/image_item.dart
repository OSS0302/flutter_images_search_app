class ImageItem {
  String imageUrl;
  String tags;

  ImageItem({
    required this.imageUrl,
    required this.tags,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ImageItem &&
          runtimeType == other.runtimeType &&
          imageUrl == other.imageUrl &&
          tags == other.tags);

  @override
  int get hashCode => imageUrl.hashCode ^ tags.hashCode;

  @override
  String toString() {
    return 'ImageItem{ imageUrl: $imageUrl, tags: $tags,}';
  }

  ImageItem copyWith({
    String? imageUrl,
    String? tags,
  }) {
    return ImageItem(
      imageUrl: imageUrl ?? this.imageUrl,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': this.imageUrl,
      'tags': this.tags,
    };
  }

  factory ImageItem.fromJson(Map<String, dynamic> json) {
    return ImageItem(
      imageUrl: json['imageUrl'] as String,
      tags: json['tags'] as String,
    );
  }
}
