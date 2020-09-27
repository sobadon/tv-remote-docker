# tv-remote-docker

これは [BonDriverProxy_Linux](https://github.com/u-n-k-n-o-w-n/BonDriverProxy_Linux) + [Mirakurun](https://github.com/Chinachu/Mirakurun) + [EPGStation](https://github.com/l3tnun/EPGStation) の構築を楽にするための docker-compose.yml と各種 config をひとまとめにしたリポジトリです。

## 想定されている環境

- Windows or Linux マシンにて BonDriverProxyEx のサーバが起動している

- Mirakurun はそのサーバへ BonDriverProxy_Linux を利用して接続する

- EPGStation は Mirakurun に接続


## etc

- チャンネルスキャン
    - Mirakurun を BonDriverProxy 系に接続している場合は API を叩いて起動するチャンネルスキャンが正常に動作しない
    - TVTest + BonDriverProxy の構成で一度チャンネルスキャンを行ない、生成された .ch2 を元に channels.yml を手動で作成する

- CIFS マウント
    - Docker 側でマウント対象のディレクトリは自動作られないので、あらかじめ作成しておく（`epgstation/recorded`, `epgstation/data`）
    - TS 録画時の Drop に関しては検証していない
