void main() {
  PokemonBuilder builder = PikachuBuilder();
  Director director = Director(builder);
  director.constructPokeomn();
  Pokemon pikachu = builder.getPokemon();
  print(pikachu.getStatus());
}

/// Pokemonクラス
class Pokemon {
  ///  こうげき
  late int _attack;

  /// ぼうぎょ
  late int _defense;

  /// すばやさ
  late int _speed;

  /// とくしゅ
  late int _specialAttack;

  /// コンストラクタ
  ///
  /// [attack] こうげき
  ///
  /// [defense] ぼうぎょ
  ///
  /// [speed] すばやさ
  ///
  /// [specialAttack] とくしゅ
  Pokemon({
    required int attack,
    required int defense,
    required int speed,
    required int specialAttack,
  }) {
    _attack = attack;
    _defense = defense;
    _speed = speed;
    _specialAttack = specialAttack;
  }

  /// ステータス取得
  String getStatus() {
    return '攻撃:$_attack ぼうぎょ:$_defense すばやさ:$_speed とくしゅ:$_specialAttack';
  }
}

/// PokemonBuidlerクラス
abstract class PokemonBuilder {
  void buildAtack();
  void buildDefence();
  void buildSpeed();
  void buildSpecialAttack();
  Pokemon getPokemon();
}

/// PikachuBuilderクラス
class PikachuBuilder implements PokemonBuilder {
  ///  こうげき
  late int _attack;

  /// ぼうぎょ
  late int _defense;

  /// すばやさ
  late int _speed;

  /// とくしゅ
  late int _specialAttack;

  @override
  void buildAtack() {
    _attack = 10;
  }

  @override
  void buildDefence() {
    _defense = 20;
  }

  @override
  void buildSpeed() {
    _speed = 30;
  }

  @override
  void buildSpecialAttack() {
    _specialAttack = 40;
  }

  @override
  Pokemon getPokemon() {
    return Pokemon(
      attack: _attack,
      defense: _defense,
      speed: _speed,
      specialAttack: _specialAttack,
    );
  }
}

/// Directorクラス
class Director {
  /// Builder
  late PokemonBuilder _builder;

  /// コンストラクタ
  ///
  /// [builder] Builder
  Director(PokemonBuilder builder) {
    this._builder = builder;
  }

  /// コンストラクト関数
  void constructPokeomn() {
    _builder.buildAtack();
    _builder.buildDefence();
    _builder.buildSpeed();
    _builder.buildSpecialAttack();
  }
}
