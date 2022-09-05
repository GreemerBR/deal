class AnnounceModel {
  final String anunTitulo;
  final String anunDescri;
  final String anunData;
  final double anunValor;
  final String anunImage;
  final int categoriesId;
  final int userId;
  final int id;
  AnnounceModel({
    required this.anunTitulo,
    required this.anunDescri,
    required this.anunData,
    required this.anunValor,
    required this.anunImage,
    required this.categoriesId,
    required this.userId,
    required this.id,
  });

  AnnounceModel copyWith({
    String? anunTitulo,
    String? anunDescri,
    String? anunData,
    double? anunValor,
    String? anunImage,
    int? categoriesId,
    int? userId,
    int? id,
  }) {
    return AnnounceModel(
      anunTitulo: anunTitulo ?? this.anunTitulo,
      anunDescri: anunDescri ?? this.anunDescri,
      anunData: anunData ?? this.anunData,
      anunValor: anunValor ?? this.anunValor,
      anunImage: anunImage ?? this.anunImage,
      categoriesId: categoriesId ?? this.categoriesId,
      userId: userId ?? this.userId,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'anunTitulo': anunTitulo});
    result.addAll({'anunDescri': anunDescri});
    result.addAll({'anunData': anunData});
    result.addAll({'anunValor': anunValor});
    result.addAll({'anunImage': anunImage});
    result.addAll({'categoriesId': categoriesId});
    result.addAll({'userId': userId});
    result.addAll({'id': id});
  
    return result;
  }

  factory AnnounceModel.fromMap(Map<String, dynamic> map) {
    return AnnounceModel(
      anunTitulo: map['anunTitulo'] ?? '',
      anunDescri: map['anunDescri'] ?? '',
      anunData: map['anunData'] ?? '',
      anunValor: map['anunValor']?.toDouble() ?? 0.0,
      anunImage: map['anunImage'] ?? '',
      categoriesId: map['categoriesId']?.toInt() ?? 0,
      userId: map['userId']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
    );
  }

  @override
  String toString() {
    return 'AnnounceModel(anunTitulo: $anunTitulo, anunDescri: $anunDescri, anunData: $anunData, anunValor: $anunValor, anunImage: $anunImage, categoriesId: $categoriesId, userId: $userId, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AnnounceModel &&
      other.anunTitulo == anunTitulo &&
      other.anunDescri == anunDescri &&
      other.anunData == anunData &&
      other.anunValor == anunValor &&
      other.anunImage == anunImage &&
      other.categoriesId == categoriesId &&
      other.userId == userId &&
      other.id == id;
  }

  @override
  int get hashCode {
    return anunTitulo.hashCode ^
      anunDescri.hashCode ^
      anunData.hashCode ^
      anunValor.hashCode ^
      anunImage.hashCode ^
      categoriesId.hashCode ^
      userId.hashCode ^
      id.hashCode;
  }
}