void main() {
  PokemonFactory pikachuFactory = PikachuFactory();
  Pokemon pikachu = pikachuFactory.createPokemon();
  pikachu.getName();

  PokemonFactory rattataFactory = RattataFactory();
  Pokemon rattata = rattataFactory.createPokemon();
  rattata.getName();
}

/// Factory基底クラス
abstract class PokemonFactory {
  /// ポケモン生成
  Pokemon createPokemon();
}

/// ピカチュウFactoryクラス
class PikachuFactory extends PokemonFactory {
  /// ポケモン生成
  @override
  Pokemon createPokemon() {
    return Pikachu();
  }
}

/// コラッタFactoryクラス
class RattataFactory extends PokemonFactory {
  /// ポケモン生成
  @override
  Pokemon createPokemon() {
    return Rattata();
  }
}

/// ポケモン基底クラス
abstract class Pokemon {
  /// 名前出力
  void getName();
}

/// ピカチュウ
class Pikachu extends Pokemon {
  /// 名前出力
  @override
  void getName() {
    print('Pikachu');
  }
}

/// コラッタ
class Rattata extends Pokemon {
  /// 名前出力
  @override
  void getName() {
    print('Rattata');
  }
}
