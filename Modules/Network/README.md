# Network Module
このモジュールは、AWS上にVPC、サブネット、ルートテーブル、NACLを作成し構成するためのモジュール

## VPC
VPCの作成には以下の変数を定義してください。

|variables|用途                                                              |type|
|:--------|:----------------------------------------------------------------|:----|
|vpc_cidr |VPCで使用するCIDR Blockを指定する。指定するCIDRは/16のみ            |string|
|vpc_name |Nameタグに使用される                                               |string|


## Subnet
本モジュールではVPC作成時に与えられたCIDRを用途ごとに等分し、
当分されたCIDRをさらにAZ毎等に当分することで一定のルールに従ったサブネットを作成する。

以下の変数を定義してください
|variables|用途                                                                |type         |
|:-----------|:----------------------------------------------------------------|:-----------|
|subnet_roles|サブネットの役割。ここに記述された役割の数でVPC CIDRは等分される。    |list(string)|
||

