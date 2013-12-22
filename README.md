<!--
************************************************************
OpenStack Grizzlyインストール時の設定ファイル
Copyright (c) Takehiko OGASAWARA 2013 All Rights Reserved.
************************************************************
-->
<div id='title'>　</div>    

# Grizzlyインストール時の設定ファイル

## 構成
```
ryunosuke: Controll node + nova-compute node + Network node
           eth0(br-ex): 192.168.0.200
           eth1(br-eth1): 10.0.1.200
kinder: nova-compute node
           eth0(br-ex): 192.168.0.210
           eth1(br-eth1): 10.0.1.210
```

### 詳細
 ryunosukeでnova,quantumなどの全サービスを担っている
 kinder→ryunosuke経由で表側のアクセスを行う。
 maintenanse系のネットワークは、10.0.1.0/24で、kinder→ryunosuke間はvlan構成としている。
 (openvswitch1.4.3がgreトンネリング非対応であったため)
 
 nova(KVM)+quantum(openvswitch)の構成としている。
 
 以上
 
