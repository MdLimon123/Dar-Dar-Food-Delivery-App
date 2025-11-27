class PrivacyPolicyModel {
  final String status;
  final List<PrivacyPolicData> data;

  PrivacyPolicyModel({
    required this.status,
    required this.data,
  });

  factory PrivacyPolicyModel.fromJson(Map<String, dynamic> json) {
    return PrivacyPolicyModel(
      status: json['status'] ?? '',
      data: (json['data'] as List<dynamic>)
          .map((item) => PrivacyPolicData.fromJson(item))
          .toList(),
    );
  }
}
class PrivacyPolicData {
  final int id;
  final String title;
  final String content;
  final DateTime createdOn;
  final DateTime updatedOn;

  PrivacyPolicData({
    required this.id,
    required this.title,
    required this.content,
    required this.createdOn,
    required this.updatedOn,
  });

  factory PrivacyPolicData.fromJson(Map<String, dynamic> json) {
    return PrivacyPolicData(
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
