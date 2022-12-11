
Python そのものではないですが、コンテナがないと始まりません。
今回は、 DockerHub で公開していますが、通常時は、
- GitHub Container Registry
- AWS の ECR
- Google Cloud のGAR, GCR
あたりを使うことになると思います。
ECS, EKS, GKEあたりで本番サービスを運用する場合、クラウドサービスとあわせると、deploy 時のコンテナのダウンロード速度が速くなりやすいです。
このリポジトリの CIは、GitHub Actionsなので、多少ダウンロードに時間がかかるかもしれませんが、そちらは、個人的には、許容の範疇と思います。

手元での Python のバージョン変更がやりやすいので、pyenv(後述) をインストールしていますが、
https://hub.docker.com/_/python からお目当てのimageを選ぶという方法でもいいです。
Ubuntu以外の OS を使いたい場合は、DockerHub から探すか自分で Dockerfile を書いてください。

OSの選定理由: [OSのシェア](https://ja.hostadvice.com/marketshare/os/) より、Linux の中だと Ubuntu が一番なので、Ubuntuにしています。
Containerの選定理由: Docker以外に選択肢を知りません。

また、開発時には、VS Codeの 拡張機能の Remote Container を使えるように `.devcointer` および `.vscode` ディレクトリで設定ファイルをを配置しています。
VS Codeを使わない人は無視してください。
