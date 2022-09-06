import 'dart:convert';

import 'package:app_2/core/models/announce_model.dart';

class UserModel {
  final String userNomeCompleto;
  final String userEmail;
  final String userSenha;
  final String userApelido;
  final String userCpf;
  final String userTelefone;
  final String userCep;
  final String userEstado;
  final String userCidade;
  final String userBairro;
  final String userRua;
  final String userComplemento;
  final int userNumero;
  final String userImage;
  final List<AnnounceModel> announces;
  final List<FavoriteAnnounceModel> favoriteAnnounces;
  final int id;
  UserModel({
    required this.userNomeCompleto,
    required this.userEmail,
    required this.userSenha,
    required this.userApelido,
    required this.userCpf,
    required this.userTelefone,
    required this.userCep,
    required this.userEstado,
    required this.userCidade,
    required this.userBairro,
    required this.userRua,
    required this.userComplemento,
    required this.userNumero,
    required this.userImage,
    required this.announces,
    required this.favoriteAnnounces,
    required this.id,
  });

  UserModel copyWith({
    String? userNomeCompleto,
    String? userEmail,
    String? userSenha,
    String? userApelido,
    String? userCpf,
    String? userTelefone,
    String? userCep,
    String? userEstado,
    String? userCidade,
    String? userBairro,
    String? userRua,
    String? userComplemento,
    int? userNumero,
    String? userImage,
    List<AnnounceModel>? announces,
    List<FavoriteAnnounceModel>? favoriteAnnounces,
    int? id,
  }) {
    return UserModel(
      userNomeCompleto: userNomeCompleto ?? this.userNomeCompleto,
      userEmail: userEmail ?? this.userEmail,
      userSenha: userSenha ?? this.userSenha,
      userApelido: userApelido ?? this.userApelido,
      userCpf: userCpf ?? this.userCpf,
      userTelefone: userTelefone ?? this.userTelefone,
      userCep: userCep ?? this.userCep,
      userEstado: userEstado ?? this.userEstado,
      userCidade: userCidade ?? this.userCidade,
      userBairro: userBairro ?? this.userBairro,
      userRua: userRua ?? this.userRua,
      userComplemento: userComplemento ?? this.userComplemento,
      userNumero: userNumero ?? this.userNumero,
      userImage: userImage ?? this.userImage,
      announces: announces ?? this.announces,
      favoriteAnnounces: favoriteAnnounces ?? this.favoriteAnnounces,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'userNomeCompleto': userNomeCompleto});
    result.addAll({'userEmail': userEmail});
    result.addAll({'userSenha': userSenha});
    result.addAll({'userApelido': userApelido});
    result.addAll({'userCpf': userCpf});
    result.addAll({'userTelefone': userTelefone});
    result.addAll({'userCep': userCep});
    result.addAll({'userEstado': userEstado});
    result.addAll({'userCidade': userCidade});
    result.addAll({'userBairro': userBairro});
    result.addAll({'userRua': userRua});
    result.addAll({'userComplemento': userComplemento});
    result.addAll({'userNumero': userNumero});
    result.addAll({'userImage': userImage});
    result.addAll({'announces': announces.map((x) => x.toMap()).toList()});
    result.addAll({'favoriteAnnounces': favoriteAnnounces.map((x) => x.toMap()).toList()});
    result.addAll({'id': id});
  
    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userNomeCompleto: map['userNomeCompleto'] ?? '',
      userEmail: map['userEmail'] ?? '',
      userSenha: map['userSenha'] ?? '',
      userApelido: map['userApelido'] ?? '',
      userCpf: map['userCpf'] ?? '',
      userTelefone: map['userTelefone'] ?? '',
      userCep: map['userCep'] ?? '',
      userEstado: map['userEstado'] ?? '',
      userCidade: map['userCidade'] ?? '',
      userBairro: map['userBairro'] ?? '',
      userRua: map['userRua'] ?? '',
      userComplemento: map['userComplemento'] ?? '',
      userNumero: map['userNumero']?.toInt() ?? 0,
      userImage: map['userImage'] ?? '',
      announces: List<AnnounceModel>.from(map['announces']?.map((x) => AnnounceModel.fromMap(x))),
      favoriteAnnounces: List<FavoriteAnnounceModel>.from(map['favoriteAnnounces']?.map((x) => FavoriteAnnounceModel.fromMap(x))),
      id: map['id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());


  @override
  int get hashCode {
    return userNomeCompleto.hashCode ^
      userEmail.hashCode ^
      userSenha.hashCode ^
      userApelido.hashCode ^
      userCpf.hashCode ^
      userTelefone.hashCode ^
      userCep.hashCode ^
      userEstado.hashCode ^
      userCidade.hashCode ^
      userBairro.hashCode ^
      userRua.hashCode ^
      userComplemento.hashCode ^
      userNumero.hashCode ^
      userImage.hashCode ^
      announces.hashCode ^
      favoriteAnnounces.hashCode ^
      id.hashCode;
  }
}

class FavoriteAnnounceModel {
  final int userId;
  final int announceId;
  final int id;
  FavoriteAnnounceModel({
    required this.userId,
    required this.announceId,
    required this.id,
  });

  FavoriteAnnounceModel copyWith({
    int? userId,
    int? announceId,
    int? id,
  }) {
    return FavoriteAnnounceModel(
      userId: userId ?? this.userId,
      announceId: announceId ?? this.announceId,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'userId': userId});
    result.addAll({'announceId': announceId});
    result.addAll({'id': id});
  
    return result;
  }

  factory FavoriteAnnounceModel.fromMap(Map<String, dynamic> map) {
    return FavoriteAnnounceModel(
      userId: map['userId']?.toInt() ?? 0,
      announceId: map['announceId']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory FavoriteAnnounceModel.fromJson(String source) => FavoriteAnnounceModel.fromMap(json.decode(source));

  @override
  String toString() => 'FavoriteAnnounce(userId: $userId, announceId: $announceId, id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is FavoriteAnnounceModel &&
      other.userId == userId &&
      other.announceId == announceId &&
      other.id == id;
  }

  @override
  int get hashCode => userId.hashCode ^ announceId.hashCode ^ id.hashCode;
}