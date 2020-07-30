local kube = import './vendor/kube-libsonnet/kube.libsonnet';

local ns = kube.Namespace('my-namespace');

local ns_patch = {
  metadata+: {
    namespace: ns.metadata.name,
  },
};

local deployment = kube.Deployment('my-app') + ns_patch {
  spec+: {
    template+: {
      spec+: {
        containers_+: {
          default: kube.Container('default-my-app') {
            image: 'paulbower/hello-kubernetes:1.8',
            ports_+: {
              http: {
                containerPort: 8080,
              },
            },
          },
        },
      },
    },
  },
};
local service = kube.Service('my-app') + ns_patch {
  target_pod: deployment.spec.template,
};

// użyj jsonnet -S do wykonania tego programu
std.manifestYamlStream([
  ns,
  deployment,
  service,
], true, false)
