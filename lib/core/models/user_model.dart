import 'dart:convert';

import 'announce_model.dart';

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
  final List<FavoriteAnnounce> favoriteAnnounces;
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
    List<FavoriteAnnounce>? favoriteAnnounces,
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
    result.addAll({
      'favoriteAnnounces': favoriteAnnounces.map((x) => x.toMap()).toList()
    });
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
      announces: List<AnnounceModel>.from(
          map['announces']?.map((x) => AnnounceModel.fromMap(x))),
      favoriteAnnounces: List<FavoriteAnnounce>.from(
          map['favoriteAnnounces']?.map((x) => FavoriteAnnounce.fromMap(x))),
      id: map['id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());
}

class FavoriteAnnounce {
  final int userId;
  final int announceId;
  final AnnounceModel announce;
  final int id;
  FavoriteAnnounce({
    required this.userId,
    required this.announceId,
    required this.announce,
    required this.id,
  });

  FavoriteAnnounce copyWith({
    int? userId,
    int? announceId,
    AnnounceModel? announce,
    int? id,
  }) {
    return FavoriteAnnounce(
      userId: userId ?? this.userId,
      announceId: announceId ?? this.announceId,
      announce: announce ?? this.announce,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'userId': userId});
    result.addAll({'announceId': announceId});
    result.addAll({'announce': announce.toMap()});
    result.addAll({'id': id});

    return result;
  }

  factory FavoriteAnnounce.fromMap(Map<String, dynamic> map) {
    return FavoriteAnnounce(
      userId: map['userId']?.toInt() ?? 0,
      announceId: map['announceId']?.toInt() ?? 0,
      announce: AnnounceModel.fromMap(map['announce']),
      id: map['id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());
}
