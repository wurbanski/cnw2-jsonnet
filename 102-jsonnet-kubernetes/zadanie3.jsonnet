local deployment = import 'zadanie1.jsonnet';

local patch = {
  metadata+: {
    labels+: {
      cnw: '2',
    },
  },
};

deployment.deployment + patch {
  spec+: {
    replicas: 5,
  },
}
