local kube = import "kube-libsonnet/kube.libsonnet";

local deployment = kube.Deployment('hello-kubernetes') {
    spec+: {
      template+: {
        spec+: {
          containers_+: {
            default: kube.Container('default-my-app') {
              image: 'paulbower/hello-kubernetes:1.8',
              ports_+: {
                http: {
                  containerPort: 8080
                },
              },
            },
          },
        },
      },
    },
  };
local service = kube.Service('hello-kubernetes') {
  target_pod: deployment.spec.template,
};

[
  deployment,
  service
]