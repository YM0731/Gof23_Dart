/// 使用：使用出来る
/// 内容：インスタンスの生成をサブクラスに任せることで、オブジェクトの生成方法を柔軟に変更できる
/// 使用方法：
/// 　クラスのインスタンス化を動的に行う必要がある場合に役立つ。
/// 　通常のインスタンス生成では、クライアントコードが具体的なクラス名に依存するため、
/// 　クラス名の変更や拡張に柔軟に対応するのが難しくなるが、
/// 　Factory Methodを使用することでクライアントコードがどのクラスを使用しているかを
/// 　意識せずにインスタンス生成を行うことが出来る。

void main() {
  PokemonFactory factory = PokemonFactory();
  Pokemon pikachu = factory.createPokemon(PokemonType.pikachu);
  Pokemon rattata = factory.createPokemon(PokemonType.rattata);
  pikachu.getName();
  rattata.getName();
}

/// Factory基底クラス
class PokemonFactory {
  /// ポケモン生成
  Pokemon createPokemon(PokemonType pokemon) {
    switch (pokemon) {
      case PokemonType.pikachu:
        return Pikachu();
      case PokemonType.rattata:
        return Rattata();
    }
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

enum PokemonType {
  /// ピカチュウ
  pikachu,

  /// コラッタ
  rattata,
}
