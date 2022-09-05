import 'dart:convert';

class UserModel {
<<<<<<< HEAD
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

=======
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
  final int id;
>>>>>>> 5dbe6e7cc5fa1d67892b2da41f9f3d4186794178
  UserModel({
    required this.userNomeCompleto,
    required this.userEmail,
    required this.userSenha,
<<<<<<< HEAD
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
=======
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
    required this.id,
>>>>>>> 5dbe6e7cc5fa1d67892b2da41f9f3d4186794178
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
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'userNomeCompleto': userNomeCompleto});
    result.addAll({'userEmail': userEmail});
    result.addAll({'userSenha': userSenha});
<<<<<<< HEAD
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

=======
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
    result.addAll({'id': id});
  
>>>>>>> 5dbe6e7cc5fa1d67892b2da41f9f3d4186794178
    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
<<<<<<< HEAD
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
=======
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
      id: map['id']?.toInt() ?? 0,
>>>>>>> 5dbe6e7cc5fa1d67892b2da41f9f3d4186794178
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(userNomeCompleto: $userNomeCompleto, userEmail: $userEmail, userSenha: $userSenha, userApelido: $userApelido, userCpf: $userCpf, userTelefone: $userTelefone, userCep: $userCep, userEstado: $userEstado, userCidade: $userCidade, userBairro: $userBairro, userRua: $userRua, userComplemento: $userComplemento, userNumero: $userNumero, userImage: $userImage, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.userNomeCompleto == userNomeCompleto &&
      other.userEmail == userEmail &&
      other.userSenha == userSenha &&
      other.userApelido == userApelido &&
      other.userCpf == userCpf &&
      other.userTelefone == userTelefone &&
      other.userCep == userCep &&
      other.userEstado == userEstado &&
      other.userCidade == userCidade &&
      other.userBairro == userBairro &&
      other.userRua == userRua &&
      other.userComplemento == userComplemento &&
      other.userNumero == userNumero &&
      other.userImage == userImage &&
      other.id == id;
  }

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
      id.hashCode;
  }
}