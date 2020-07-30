local deployment = import 'zadanie1.jsonnet';

deployment.deployment {
  spec+: {
    replicas: 5,
  },
}
