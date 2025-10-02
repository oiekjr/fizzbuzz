# FizzBuzz CLI コンテナ

Laravel 12 で実装した FizzBuzz コマンドを PHP 8.2 コンテナで実行するためのプロジェクトです。Docker イメージをビルドすれば、引数に上限値を指定して FizzBuzz の結果を出力できます。

## 前提条件

- Docker もしくは互換コンテナランタイムがインストールされていること
- (開発用途) PHP 8.2、Composer、Node.js をローカルで利用する場合は別途インストールしてください

## セットアップ

1. Docker イメージをビルドします。
    ```bash
    docker build -t fizzbuzz .
    ```

## 実行方法

- コンテナ経由で FizzBuzz コマンドを実行する場合は、引数に最大値を渡します。
    ```bash
    docker run --rm fizzbuzz 15
    ```
    上記例では 1 から 15 までを評価し、3 の倍数で `Fizz`、5 の倍数で `Buzz`、両方の倍数で `FizzBuzz` を出力します。
