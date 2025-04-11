// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../enum/caminho.dart';

class Personagem {
  /// ID do personagem.
  int id;

  /// Nome do personagem.
  String nome;

  /// URL da foto do personagem.
  String foto;

  /// Raridade do personagem (4 ou 5 estrelas).
  int raridade;

  /// Caminho do personagem (ex: "A Abundância", "A Destruição").
  String caminho;

  /// Elemento que o personagem representa e causa dano (ex: "Vento", "Físico").
  String elemento;

  /// Pontos de vida do personagem.
  int hp;

  /// Pontos de ataque do personagem.
  int atk;

  /// Pontos de defesa do personagem.
  int def;

  /// Pontos de velocidade do personagem.
  int spd;

  /// Pontos de taunt do personagem.
  int taunt;

  /// Construtor da classe de cada um dos personagens disponíveis e previstos
  /// do jogo.
  Personagem({
    required this.id,
    required this.nome,
    required this.foto,
    required this.raridade,
    required this.caminho,
    required this.elemento,
    required this.hp,
    required this.atk,
    required this.def,
    required this.spd,
    required this.taunt,
  });

  Personagem copyWith({
    int? id,
    String? nome,
    String? foto,
    int? raridade,
    String? caminho,
    String? elemento,
    int? hp,
    int? atk,
    int? def,
    int? spd,
    int? taunt,
  }) {
    return Personagem(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      foto: foto ?? this.foto,
      raridade: raridade ?? this.raridade,
      caminho: caminho ?? this.caminho,
      elemento: elemento ?? this.elemento,
      hp: hp ?? this.hp,
      atk: atk ?? this.atk,
      def: def ?? this.def,
      spd: spd ?? this.spd,
      taunt: taunt ?? this.taunt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'foto': foto,
      'raridade': raridade,
      'caminho': caminho,
      'elemento': elemento,
      'hp': hp,
      'atk': atk,
      'def': def,
      'spd': spd,
      'taunt': taunt,
    };
  }

  factory Personagem.fromMap(Map<String, dynamic> map) {
    try {
      return Personagem(
        id: int.parse(map['id'].toString()),
        nome: map['nome'].toString(),
        foto: map['foto'].toString(),
        raridade: int.parse(map['raridade'].toString()),
        caminho: map['caminho'].toString(),
        elemento: map['elemento'].toString(),
        hp: int.parse(map['hp'].toString()),
        atk: int.parse(map['atk'].toString()),
        def: int.parse(map['def'].toString()),
        spd: int.parse(map['spd'].toString()),
        taunt: int.parse(map['taunt'].toString()),
      );
    } catch (e, s) {
      throw Exception('Erro ao converter JSON para Characters: $e - $s');
    }
  }

  static Caminho caminhoFromString(String caminho) {
    return Caminho.values.firstWhere(
      (e) => e.toString().split('.').last == caminho,
      orElse: () => throw Exception('Caminho inválido: $caminho'),
    );
  }

  String toJson() => json.encode(toMap());

  factory Personagem.fromJson(String source) =>
      Personagem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Characters(id: $id, nome: $nome, foto: $foto, raridade: $raridade, caminho: $caminho, elemento: $elemento, hp: $hp, atk: $atk, def: $def, spd: $spd, taunt: $taunt)';
  }

  @override
  bool operator ==(covariant Personagem other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nome == nome &&
        other.foto == foto &&
        other.raridade == raridade &&
        other.caminho == caminho &&
        other.elemento == elemento &&
        other.hp == hp &&
        other.atk == atk &&
        other.def == def &&
        other.spd == spd &&
        other.taunt == taunt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nome.hashCode ^
        foto.hashCode ^
        raridade.hashCode ^
        caminho.hashCode ^
        elemento.hashCode ^
        hp.hashCode ^
        atk.hashCode ^
        def.hashCode ^
        spd.hashCode ^
        taunt.hashCode;
  }
}
