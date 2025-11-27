class TermsConditionModel {
  final String status;
  final List<TermsConditionData> data;

  TermsConditionModel({
    required this.status,
    required this.data,
  });

  factory TermsConditionModel.fromJson(Map<String, dynamic> json) {
    return TermsConditionModel(
      status: json['status'] ?? '',
      data: (json['data'] as List<dynamic>)
          .map((item) => TermsConditionData.fromJson(item))
          .toList(),
    );
  }
}
class TermsConditionData {
  final int id;
  final String title;
  final String content;
  final DateTime createdOn;
  final DateTime updatedOn;

  TermsConditionData({
    required this.id,
    required this.title,
    required this.content,
    required this.createdOn,
    required this.updatedOn,
  });

  factory TermsConditionData.fromJson(Map<String, dynamic> json) {
    return TermsConditionData(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      createdOn: DateTime.parse(json['created_on']),
      updatedOn: DateTime.parse(json['updated_on']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "content": content,
      "created_on": createdOn.toIso8601String(),
      "updated_on": updatedOn.toIso8601String(),
    };
  }
}
