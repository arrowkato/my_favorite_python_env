# Github Actions選定理由
他の候補は、大体このくらいかと思います。
- CircleCI
- Travis CI
- Jenkins
- Bitrise
- AWS CodeBuild
- Google Cloud Build

## 他のサービスとの比較
AWS, Google Cloud 等の特定のクラウドサービス、オンプレ、スマホの開発のCIに特化させたい場合は、
CodeBuild, Cloud Build, Jenkins, Bitrise を個別に使うのは十分選択肢と思います。

そういう意味で、GitHub Actions と同じ条件なのは、CircleCIとTravis CIです。
GitHub を使う場合、workflowのファイルを書けば、特に連携の必要がないことが1つ目のメリットです。

2つ目は、特に初期の料金です。
個人的に、CI での各種チェックは料金を見てケチるところではないと思いますが、
企業で GitHub を使う場合のほとんどで、 organization plan または、Enterprise plan で契約すると思います。
その際に、GitHub Actions の利用枠が自動でついてくるので、CI で新たに料金が発生しづらいところもメリットと思います。

[OIDC](https://docs.github.com/ja/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-amazon-web-services#adding-the-identity-provider-to-aws) にも対応しているので、
秘匿情報も漏れにくくなっています。ただし、 [OIDCはCirclCIでも利用できます](https://circleci.com/docs/ja/openid-connect-tokens/)。

