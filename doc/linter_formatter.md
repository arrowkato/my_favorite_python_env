
各種、linter formatter でやりたいことは、　
1. [PEP8](https://peps.python.org/pep-0008/) 準拠のコードにする。
2. Python は動的言語ではあるものの、静的解析でバグになりやすい箇所を静的解析で洗い出す。
3. チームで共通のコーディング規約にする
4. 1 or 2 で異常が見つかった場合、可能な限り自動で修正する

あたりだと思います。
[Pythonのコードフォーマッターについての個人的ベストプラクティス](https://qiita.com/sin9270/items/85e2dab4c0144c79987d) を参照して下さい。
1, 2は当然として、個人的には、3,4が開発者体験に大きく関わると思っているので、formatterを起点に選定しています。

# Black 選定理由
Black を採用すると[自転車置き場議論](https://ja.wikipedia.org/wiki/%E3%83%91%E3%83%BC%E3%82%AD%E3%83%B3%E3%82%BD%E3%83%B3%E3%81%AE%E5%87%A1%E4%BF%97%E6%B3%95%E5%89%87)をなくせるためです。
また、formatterの初期設定及び設定変更の頻度は高くなく、詳しいエンジニアはあまりいない印象であるため、default 設定でそれなり以上に使えるのは、多くのチームで有用と思います。

[the-black-code-style](https://github.com/psf/black#the-black-code-style) より抜粋
> Black is a PEP 8 compliant opinionated formatter. Black reformats entire files in place. Style configuration options are deliberately limited and rarely added. It doesn't take previous formatting into account (see Pragmatism for exceptions).

deeplで翻訳
> Black は、PEP 8 に準拠したオピニオンフォーマッターです。Black はファイル全体をその場で再フォーマットします。スタイル設定オプションは意図的に制限されており、ほとんど追加されません。以前の書式を考慮することはありません（例外についてはプラグマティズムを参照してください）。

僕の考えた最強のコーディング規約があって、チームメンバーを説得できて、formatterの設定を書ける人は、autopep8, yapf をどうぞ。

# pflake8 選定理由
Black 適用でほぼ大丈夫ですが、
Black でformatしても、 循環的複雑度(Cyclomatic complexity) の修正まではしてくれないので、flake8 を併用しています。
素の flake8 だとpyproject.toml に設定を設定を書けず、tox.ini ファイルを別途作る必要があったので、pflake にしています。

# isort 選定理由
isort は、importの順序を並べ替えてくれます。importの順序にこだわりが人がいる場合、Pull Requestで差分が出やすくなりますが、それを防いでくれます。
import 順序が品質や可読性に大きく影響すると思えないので、formatterにおまかせで良いと思っています。

ファイル保存時に、整形用のコマンドを実行すると開発者体験が上がります。
VS Codeの場合は、すでに設定を書いています。

# mypy  選定理由
mypy以外の候補は、
- Pyright
- Pytype
- Pysa

ですが、mypyは古参で情報量が多いので採用しています。

mypyに不満がある場合は、[タイプチェッカ](https://qiita.com/edge-m/items/846715217fc3dd481a84#-%E3%82%BF%E3%82%A4%E3%83%97%E3%83%81%E3%82%A7%E3%83%83%E3%82%AB-mypy) を読んだ後に乗り換え検討をしてください。
