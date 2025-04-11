/// Enum que representa os caminhos do personagem. Esta enum é utilizada para categorizar os personagens em diferentes caminhos, cada um com suas características e imagens associadas.
///
/// **Os caminhos disponíveis são:**
/// - `abundancia`: Representa o caminho da abundância
/// - `destruicao`: Representa o caminho da destruição
/// - `caca`: Representa o caminho da caça
/// - `erudicao`: Representa o caminho da erudição
/// - `harmonia`: Representa o caminho da harmonia
/// - `inexistencia`: Representa o caminho da inexistência
/// - `preservacao`: Representa o caminho da preservação
enum Caminho {
  abudancia,
  destruicao,
  caca,
  erudicao,
  harmonia,
  inexistencia,
  preservacao,
  recordacao,
}

extension CaminhoExtension on Caminho {
  /// Retorna o caminho do personagem em formato de [String].
  /// - [abudancia]: "A Abundância"
  /// - [destruicao]: "A Destruição"
  /// - [caca]: "A Caça"
  /// - [erudicao]: "A Erudição"
  /// - [harmonia]: "A Harmonia"
  /// - [inexistencia]: "A Inexistência"
  /// - [preservacao]: "A Preservação"
  /// - [recordacao]: "A Recordação"
  String get nome {
    switch (this) {
      case Caminho.abudancia:
        return "A Abundância";
      case Caminho.destruicao:
        return "A Destruição";
      case Caminho.caca:
        return "A Caça";
      case Caminho.erudicao:
        return "A Erudição";
      case Caminho.harmonia:
        return "A Harmonia";
      case Caminho.inexistencia:
        return "A Inexistência";
      case Caminho.preservacao:
        return "A Preservação";
      case Caminho.recordacao:
        return "A Recordação";
    }
  }

  /// Retorna a foto representativa do caminho do personagem em formato de [String].
  /// - [abudancia]: "assets/images/caminhos/abundancia.png"
  /// - [destruicao]: "assets/images/caminhos/destruicao.png"
  /// - [caca]: "assets/images/caminhos/caca.png"
  /// - [erudicao]: "assets/images/caminhos/erudicao.png"
  /// - [harmonia]: "assets/images/caminhos/harmonia.png"
  /// - [inexistencia]: "assets/images/caminhos/inexistencia.png"
  /// - [preservacao]: "assets/images/caminhos/preservacao.png"
  /// - [recordacao]: "assets/images/caminhos/recordacao.png"
  String get imagem {
    switch (this) {
      case Caminho.abudancia:
        return "assets/images/caminhos/abundancia.png";
      case Caminho.destruicao:
        return "assets/images/caminhos/destruicao.png";
      case Caminho.caca:
        return "assets/images/caminhos/caca.png";
      case Caminho.erudicao:
        return "assets/images/caminhos/erudicao.png";
      case Caminho.harmonia:
        return "assets/images/caminhos/harmonia.png";
      case Caminho.inexistencia:
        return "assets/images/caminhos/inexistencia.png";
      case Caminho.preservacao:
        return "assets/images/caminhos/preservacao.png";
      case Caminho.recordacao:
        return "assets/images/caminhos/recordacao.png";
    }
  }
}
