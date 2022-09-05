import 'dart:convert';

import 'announce_model.dart';

class CategoryModel {
  final String nome;
  final List<AnnounceModel> announces;
  final int id;
  CategoryModel({
    required this.nome,
    required this.announces,
    required this.id,
  });

  CategoryModel copyWith({
    String? nome,
    List<AnnounceModel>? announces,
    int? id,
  }) {
    return CategoryModel(
      nome: nome ?? this.nome,
      announces: announces ?? this.announces,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'nome': nome});
    result.addAll({'announces': announces.map((x) => x.toMap()).toList()});
    result.addAll({'id': id});
  
    return result;
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      nome: map['nome'] ?? '',
      announces: List<AnnounceModel>.from(map['announces']?.map((x) => AnnounceModel.fromMap(x))),
      id: map['id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());


  @override
  int get hashCode => nome.hashCode ^ announces.hashCode ^ id.hashCode;
}

