class PrayerRemembrances {
  String? category;
  String? count;
  String? description;
  String? reference;
  String? content;

  PrayerRemembrances({
    this.category,
    this.count,
    this.description,
    this.reference,
    this.content,
  });

  factory PrayerRemembrances.fromJson(Map<String, dynamic> json) {
    return PrayerRemembrances(
      category: json['category'] as String?,
      count: json['count'] as String?,
      description: json['description'] as String?,
      reference: json['reference'] as String?,
      content: json['content'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'category': category,
    'count': count,
    'description': description,
    'reference': reference,
    'content': content,
  };
}
