import 'dart:convert';

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
      userEstado: map['userEstado'] ?? 'Estado não informado',
      userCidade: map['userCidade'] ?? 'Cidade não informada',
      userBairro: map['userBairro'] ?? '',
      userRua: map['userRua'] ?? '',
      userComplemento: map['userComplemento'] ?? '',
      userNumero: map['userNumero']?.toInt() ?? 0,
      userImage: map['userImage'] ?? '',
      id: map['id']?.toInt() ?? 0,
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