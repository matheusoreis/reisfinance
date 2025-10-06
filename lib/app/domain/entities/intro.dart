class IntroEntity {
  final String message;

  IntroEntity({required this.message});

  factory IntroEntity.fromMap(Map<String, dynamic> json) {
    return IntroEntity(message: json["message"] ?? "");
  }

  Map<String, dynamic> toMap() {
    return {"message": message};
  }
}
