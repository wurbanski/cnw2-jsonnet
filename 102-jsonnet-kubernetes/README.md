# 102: Jsonnet && Kubernetes

Uwaga: Od teraz przyda się choć minimalna znajomość Kubernetesa, ale nie jest ona niezbędna do dalszego programowania!

## Zadania

1. Zdefiniuj obiekt Kubernetesowy typu deployment (`deployment.yaml`) przy użyciu jsonneta.
2. Wykorzystaj ten obiekt do stworzenia analogicznego deploymentu z inną liczbą replik.
3. Stwórz patch, dodający etykiety (`.metadata.labels`) do obiektu, wykorzystaj go do zmiany wcześniej stworzonych wdrożeń.
4. Stwórz obiekt typu service (`service.yaml`) - zlokalizuj wspólne elementy i spróbuj je zdeduplikować przez wykorzystanie zmiennych.

## Biblioteki Jsonnet-Kubernetes:

1. [ksonnet](https://github.com/ksonnet/ksonnet) (_aktualnie_ brak wsparcia, ale nadal działa!)
2. [bitnami/kube-libsonnet](https://github.com/bitnami-labs/kube-libsonnet.git)
