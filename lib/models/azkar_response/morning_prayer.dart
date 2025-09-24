class MorningPrayer {
  String? category;
  String? count;
  String? description;
  String? reference;
  String? content;

  MorningPrayer({
    this.category,
    this.count,
    this.description,
    this.reference,
    this.content,
  });

  factory MorningPrayer.fromJson(Map<String, dynamic> json) => MorningPrayer(
    category: json['category'] as String?,
    count: json['count'] as String?,
    description: json['description'] as String?,
    reference: json['reference'] as String?,
    content: json['content'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'category': category,
    'count': count,
    'description': description,
    'reference': reference,
    'content': content,
  };
}
