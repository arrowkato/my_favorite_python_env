# 1. 概要
長期運用を見据えた場合を想定して、それなりにいろいろはいっているリポジトリです。
個別の記事はたくさんありますが、全部のせリポジトリはあまり見ないので、 `git clone` すればいいリポジトリを作ってみました。

```bash
git clone https://github.com/arrowkato/my_favorite_python_env.git
```

対象読者
- 他のサーバーサイド言語での実装経験はあるものの、Python では、初めて開発環境を作るエンジニア
- 人が作った開発環境上で、Python のコード自体はかけるものの、DevOps 周りにも領域を広げたいエンジニア

全体的に奇をてらわず、類似のサービス、ライブラリの中では、シェアのなるべく多いものを選んでいます。
結果的に、経験のあるエンジニアからすれば、どこかで見た構成になっていると思います。


# 2. この記事で書かないこと
MLエンジニアが PoC 用に使う Jupyter 環境については書きません。
普通(?)のエンジニアがPythonを使う場合を想定しています。
CD周りも書いていないです。

# 3. 各論
- [コンテナ編](./doc/container.md)
- [ディレクトリ構成](./doc/directory_configuration.md)
- [パッケージマネージャー](./doc/package_manager.md)
- [linterとformatter](./doc/linter_formatter.md)
- [エディター](./doc/editor.md)
- [CI tool](./doc/CI_tool.md)
- testing framework. いずれ書きます。pytest 派です。
- Dependabot もいずれ各予定です。ただ、[設定ファイル](.github/dependabot.yml)でほぼ語り尽くされている感がありますが。
