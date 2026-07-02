# dg.sh - DNS Record Lookup Tool

`dg.sh` は、指定したドメインの主要な DNS レコード（NS, A, MX, TXT）を簡易的に取得・表示するための Bash スクリプトです。

## 機能
- 入力された URL やドメインから自動的にドメイン名部分を抽出します。
- 以下の DNS レコードを取得し、見やすく整形して出力します。
  - **NS レコード** (Name Server)
  - **A レコード** (IPv4 アドレス)
  - **AW レコード** (`www.` 付きの A レコード)
  - **MX レコード** (Mail Exchange)
  - **TXT レコード** (テキスト)

## 動作要件
このスクリプトを実行するには、以下のコマンドがシステムにインストールされている必要があります。
- `bash`
- `dig` (通常 `dnsutils` または `bind-utils` パッケージに含まれます)
- `sed`

## 使い方

スクリプトに実行権限を与えて実行するか、`bash` コマンド経由で呼び出します。引数にはドメイン名、または `http://` や `https://` が含まれる URL を指定できます。

```bash
# 実行権限の付与 (初回のみ)
chmod +x dg.sh

# ドメイン名で指定して実行
./dg.sh example.com

# URL 形式で指定して実行 (自動的にドメイン名に変換されます)
./dg.sh https://example.com/subdir/
```

## 出力例

```text
DOMAIN: example.com
NS :  ns1.example.com.
NS :  ns2.example.com.
A  :  93.184.215.14
AW :  93.184.215.14
MX :  0 .
TXT:  "v=spf1 -all"
```
