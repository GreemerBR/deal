import 'dart:typed_data';

class UserModel {
  String userNomeCompleto;
  String userEmail;
  String userSenha;
  Uint8List? userImage;
  String? userApelido;
  String? userCpf;
  String? userTelefone;
  String? userCep;
  String? userCidade;
  String? userEstado;
  String? userRua;
  int? userNumero;
  String? userComplemento;

  UserModel({
    required this.userNomeCompleto,
    required this.userEmail,
    required this.userSenha,
    this.userImage,
    this.userApelido,
    this.userCpf,
    this.userTelefone,
    this.userCep,
    this.userCidade,
    this.userEstado,
    this.userRua,
    this.userNumero,
    this.userComplemento,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'userNomeCompleto': userNomeCompleto});
    result.addAll({'userEmail': userEmail});
    result.addAll({'userSenha': userSenha});
    if (userImage != null) {
      result.addAll({'userImage': userImage!.asMap()});
    }
    if (userApelido != null) {
      result.addAll({'userApelido': userApelido});
    }
    if (userCpf != null) {
      result.addAll({'userCpf': userCpf});
    }
    if (userTelefone != null) {
      result.addAll({'userTelefone': userTelefone});
    }
    if (userCep != null) {
      result.addAll({'userCep': userCep});
    }
    if (userCidade != null) {
      result.addAll({'userCidade': userCidade});
    }
    if (userEstado != null) {
      result.addAll({'userEstado': userEstado});
    }
    if (userRua != null) {
      result.addAll({'userRua': userRua});
    }
    if (userNumero != null) {
      result.addAll({'userNumero': userNumero});
    }
    if (userComplemento != null) {
      result.addAll({'userComplemento': userComplemento});
    }

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userNomeCompleto: map['UserNomeCompleto'] ?? '',
      userEmail: map['UserEmail'] ?? '',
      userSenha: map['UserSenha'] ?? '',
      userImage: map['UserImage'] != null ? map['UserImage'] : [],
      userApelido: map['UserApelido'],
      userCpf: map['UserCpf'],
      userTelefone: map['UserTelefone'],
      userCep: map['UserCep'],
      userCidade: map['UserCidade'],
      userEstado: map['UserEstado'],
      userRua: map['UserRua'],
      userNumero: map['UserNumero']?.toInt(),
      userComplemento: map['UserComplemento'],
    );
  }

  
}
