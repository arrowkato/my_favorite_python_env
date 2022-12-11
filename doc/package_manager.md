# 候補
- pip
- conda
- Poetry
- Pipenv

# poetry 選定理由
素の pip は、依存ライブラリまでを含めて、ライブラリのバージョン固定がやりづらいので却下。
conda は、[200人以上の企業の場合は有料](https://legal.anaconda.com/policies/en/?name=terms-of-service) なので、ファーストチョイスとしては、却下します。使いたい人はどうぞ。

よって、 Poetry VS Pipenv ですが、これは、私がよく使っているから選びました。
もう少し深堀りすると、pyproject.toml を見てもらえるとわかると思いますが、
- 複数リポジトリで開発を行う場合に他のリポジトリをパッケージとして参照することができる
- パッケージマネージャー本体とはややずれますが、pyproject.toml に linter, formatter の設定を集約でき、情報が散乱しづらい
- Dependabot の適用が容易だった

あたりが長所だと思います。試していないですが、Pipenvでも実現できる可能性はあります。

```toml
my_private_repo = {git = "ssh://git@github.com/arrowkato/my_private_repo.git"}
```

Dependabotとの連携で、DevSecOps 的なことまで書いているのは少ない印象です。
