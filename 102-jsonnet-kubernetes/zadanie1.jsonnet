// kubectl convert --local -f deployment.yaml -o json | jsonnetfmt -

{
  deployment: {
    kind: 'Deployment',
    apiVersion: 'apps/v1',
    metadata: {
      name: 'hello-kubernetes',
      creationTimestamp: null,
    },
    spec: {
      replicas: 3,
      selector: {
        matchLabels: {
          app: 'hello-kubernetes',
        },
      },
      template: {
        metadata: {
          creationTimestamp: null,
          labels: {
            app: 'hello-kubernetes',
          },
        },
        spec: {
          containers: [
            {
              name: 'hello-kubernetes',
              image: 'paulbouwer/hello-kubernetes:1.8',
              ports: [
                {
                  containerPort: 8080,
                  protocol: 'TCP',
                },
              ],
              resources: {},
              terminationMessagePath: '/dev/termination-log',
              terminationMessagePolicy: 'File',
              imagePullPolicy: 'IfNotPresent',
            },
          ],
          restartPolicy: 'Always',
          terminationGracePeriodSeconds: 30,
          dnsPolicy: 'ClusterFirst',
          securityContext: {},
          schedulerName: 'default-scheduler',
        },
      },
      strategy: {
        type: 'RollingUpdate',
        rollingUpdate: {
          maxUnavailable: '25%',
          maxSurge: '25%',
        },
      },
      revisionHistoryLimit: 10,
      progressDeadlineSeconds: 600,
    },
    status: {},
  },
}
