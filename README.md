# LINE BOTの開発

1. リポジトリのクローン

```bash
$ git clone git@github.com:yokoto/line-bot-app.git
```

2. dockerイメージのビルド

```bash
$ docker-compose build
```

3. DBの作成

```
$ docker-compose run web bundle exec rails db:create
$ docker-compose run web bundle exec rails db:migrate
```

4. Webサーバーの起動

```
$ docker-compose up
```
