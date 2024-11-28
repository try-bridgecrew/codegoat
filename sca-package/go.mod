module github.com/hashicorp/terraform

go 1.16

require (
	cloud.google.com/go/storage v1.28.1
	github.com/Azure/azure-sdk-for-go v59.2.0+incompatible
	github.com/Azure/go-autorest/autorest v0.11.22
	github.com/Netflix/go-expect v0.0.0-20211003183012-e1a7c020ce25
	github.com/agext/levenshtein v1.2.3
	github.com/aliyun/alibaba-cloud-sdk-go v1.62.247
	github.com/aliyun/aliyun-oss-go-sdk v0.0.0-20190103054945-8205d1f41e70
	github.com/aliyun/aliyun-tablestore-go-sdk v4.1.2+incompatible
	github.com/armon/circbuf v0.0.0-20190214190532-5111143e8da2
	github.com/aws/aws-sdk-go v1.42.35
	github.com/bgentry/speakeasy v0.1.0
	github.com/bmatcuk/doublestar v1.1.5
	github.com/chzyer/readline v0.0.0-20180603132655-2972be24d48e
	github.com/coreos/pkg v0.0.0-20180928190104-399ea9e2e55f // indirect
	github.com/dylanmei/winrmtest v0.0.0-20190225150635-99b7fe2fddf1
	github.com/go-test/deep v1.0.3
	github.com/google/uuid v1.3.0
	github.com/gophercloud/gophercloud v0.10.1-0.20200424014253-c3bfe50899e5
	github.com/hashicorp/aws-sdk-go-base v0.7.1
	github.com/hashicorp/consul/api v1.9.1
	github.com/hashicorp/errwrap v1.1.0
	github.com/hashicorp/go-checkpoint v0.5.0
	github.com/hashicorp/go-cleanhttp v0.5.2
	github.com/hashicorp/go-getter v1.5.10
	github.com/hashicorp/go-hclog v0.15.0
	github.com/hashicorp/go-multierror v1.1.1
	github.com/hashicorp/go-plugin v1.4.3
	github.com/hashicorp/go-retryablehttp v0.7.0
	github.com/hashicorp/go-tfe v0.21.0
	github.com/hashicorp/go-uuid v1.0.2
	github.com/hashicorp/go-version v1.3.0
	github.com/hashicorp/hcl v0.0.0-20170504190234-a4b07c25de5f
	github.com/hashicorp/hcl/v2 v2.11.1
	github.com/hashicorp/terraform-config-inspect v0.0.0-20210209133302-4fd17a0faac2
	github.com/hashicorp/terraform-svchost v0.0.0-20200729002733-f050f53b9734
	github.com/jmespath/go-jmespath v0.4.0
	github.com/joyent/triton-go v0.0.0-20180313100802-d8f9c0314926
	github.com/kardianos/osext v0.0.0-20190222173326-2bc1f35cddc0
	github.com/lib/pq v1.10.3
	github.com/masterzen/winrm v0.0.0-20200615185753-c42b5136ff88
	github.com/mattn/go-isatty v0.0.16
	github.com/mattn/go-shellwords v1.0.4
	github.com/mitchellh/cli v1.1.2
	github.com/mitchellh/colorstring v0.0.0-20190213212951-d06e56a500db
	github.com/mitchellh/copystructure v1.2.0
	github.com/mitchellh/go-homedir v1.1.0
	github.com/mitchellh/go-linereader v0.0.0-20190213213312-1b945b3263eb
	github.com/mitchellh/go-wordwrap v1.0.1
	github.com/mitchellh/gox v1.0.1
	github.com/mitchellh/mapstructure v1.1.2
	github.com/mitchellh/reflectwalk v1.0.2
	github.com/nishanths/exhaustive v0.2.3
	github.com/packer-community/winrmcp v0.0.0-20180921211025-c76d91c1e7db
	github.com/pkg/browser v0.0.0-20201207095918-0426ae3fba23
	github.com/pkg/errors v0.9.1
	github.com/posener/complete v1.2.3
	github.com/spf13/afero v1.9.2
	github.com/tencentcloud/tencentcloud-sdk-go/tencentcloud/common v1.0.232
	github.com/tencentcloud/tencentcloud-sdk-go/tencentcloud/tag v1.0.233
	github.com/tencentyun/cos-go-sdk-v5 v0.7.29
	github.com/xanzy/ssh-agent v0.3.1
	github.com/xlab/treeprint v0.0.0-20161029104018-1d6e34225557
	github.com/zclconf/go-cty v1.10.0 // indirect
	github.com/zclconf/go-cty-yaml v1.0.2
	go.etcd.io/etcd v0.5.0-alpha.5.0.20210428180535-15715dcf1ace
	golang.org/x/oauth2 v0.6.0
	golang.org/x/term v0.6.0
	golang.org/x/text v0.8.0
	google.golang.org/api v0.112.0
	google.golang.org/grpc v1.53.0
	google.golang.org/grpc/cmd/protoc-gen-go-grpc v1.1.0
	google.golang.org/protobuf v1.28.1
	k8s.io/api v0.26.3
	k8s.io/apimachinery v0.26.3
	k8s.io/client-go v0.26.3
)

require (
	github.com/Azure/go-autorest/autorest/adal v0.9.17 // indirect
	github.com/Azure/go-ntlmssp v0.0.0-20200615164410-66371956d46c
	github.com/ChrisTrenkamp/goxpath v0.0.0-20190607011252-c5096ec8773d
	github.com/abdullin/seq v0.0.0-20160510034733-d5467c17e7af
	github.com/baiyubin/aliyun-sts-go-sdk v0.0.0-20180326062324-cfa1a18b161f // indirect
	github.com/coreos/go-systemd v0.0.0-20181012123002-c6f51f82210d // indirect
	github.com/dylanmei/iso8601 v0.1.0
	github.com/gofrs/uuid v3.3.0+incompatible
	github.com/golang-jwt/jwt v3.2.2+incompatible // indirect
	github.com/golang-jwt/jwt/v4 v4.1.0 // indirect
	github.com/gopherjs/gopherjs v0.0.0-20181017120253-0766667cb4d1
	github.com/hashicorp/go-msgpack v0.5.4 // indirect
	github.com/hashicorp/yamux v0.0.0-20181012175058-2f1d1f20f75d // indirect
	github.com/imdario/mergo v0.3.12 // indirect
	github.com/jtolds/gls v4.2.1+incompatible
	github.com/kr/pty v1.1.5 // indirect
	github.com/masterzen/simplexml v0.0.0-20190410153822-31eea3082786 // indirect
	github.com/mitchellh/go-testing-interface v1.0.4 // indirect
	github.com/mozillazg/go-httpheader v0.3.0
	github.com/neelance/astrewrite v0.0.0-20160511093645-99348263ae86 // indirect
	github.com/neelance/sourcemap v0.0.0-20200213170602-2833bce08e4c // indirect
	github.com/nu7hatch/gouuid v0.0.0-20131221200532-179d4d0c4d8d
	github.com/sergi/go-diff v1.2.0 // indirect
	github.com/shurcooL/go v0.0.0-20200502201357-93f07166e636 // indirect
	github.com/shurcooL/httpfs v0.0.0-20190707220628-8d4bc4ba7749 // indirect
	github.com/smartystreets/assertions v0.0.0-20180927180507-b2de0cb4f26d
	github.com/smartystreets/goconvey v0.0.0-20180222194500-ef6db91d284a
	google.golang.org/grpc/examples v0.0.0-20230318005552-70c52915099a // indirect
	gopkg.in/ini.v1 v1.66.2
)

replace google.golang.org/grpc v1.36.0 => google.golang.org/grpc v1.27.1

replace github.com/golang/mock v1.5.0 => github.com/golang/mock v1.4.4

// github.com/dgrijalva/jwt-go is no longer maintained but is an indirect
// dependency of the old etcdv2 backend, and so we need to keep this working
// until that backend is removed. github.com/golang-jwt/jwt/v3 is a drop-in
// replacement that includes a fix for CVE-2020-26160.
replace github.com/dgrijalva/jwt-go => github.com/golang-jwt/jwt v3.2.1+incompatible
