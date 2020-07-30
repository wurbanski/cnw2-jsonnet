local name = 'hello-kubernetes';
local port = 8080;

{
  deployment: {
    kind: 'Deployment',
    apiVersion: 'apps/v1',
    metadata: {
      name: name,
      creationTimestamp: null,
    },
    spec: {
      replicas: 3,
      selector: {
        matchLabels: {
          app: name,
        },
      },
      template: {
        metadata: {
          creationTimestamp: null,
          labels: {
            app: name,
          },
        },
        spec: {
          containers: [
            {
              name: name,
              image: 'paulbouwer/hello-kubernetes:1.8',
              ports: [
                {
                  containerPort: port,
                  protocol: 'TCP',
                },
              ],
            },
          ],
        },
      },
    },
    service: {
      kind: 'Service',
      apiVersion: 'v1',
      metadata: {
        name: name,
      },
      spec: {
        ports: [
          {
            protocol: 'TCP',
            port: 80,
            targetPort: port,
          },
        ],
        selector: {
          app: name,
        },
        type: 'LoadBalancer',
        sessionAffinity: 'None',
        externalTrafficPolicy: 'Cluster',
      },
    },

  },
}
