
## ファイル作成
下記ファイルを作成する。

### /env/dev/terraform.tfvars
```
access_key = "***********************"
secret_key = "***********************"
region = "ap-northeast-1"
environment = "dev"
```

### /env/dev/backend.tf
```
terraform {
  required_version = ">= 0.11.0"

  backend "s3" {
    bucket = "<パケット名>"
    key    = "terraform.tfstate.aws.dev"
    region = "ap-northeast-1"
  }
}
```

## terraform実行
ファイル作成後、「/env/dev/」ディレクトリに移動。
下記コマンドを実行。

```
terraform init
terraform plan
terraform apply
```

