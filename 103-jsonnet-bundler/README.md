# 103: Jsonnet-bundler (biblioteki)

## Podstawowe informacje

1. [jsonnet-bundler](https://github.com/jsonnet-bundler/jsonnet-bundler) to projekt mający na celu ułatwienie zarządzania zależnościami Jsonnet
    > NOTE: This project is alpha stage. Flags, configuration, behavior and design may change significantly in following releases.

    Czad.
2. Przykładowe rozpoczęcie pracy:
    ```
    jb init
    jb install https://github.com/bitnami-labs/kube-libsonnet.git
    ```

    Uwaga: My mamy już zainicjowane środowisko, wystarczy zawołać `jb install` i pobrać pakiety!

3. Aktualizacja pakietów:
    ```
    jb update
    # aktualizacja pojedynczego pakietu
    jb update <url do pakietu>
    ```

## Zadania

Korzystając z biblioteki `kube-libsonnet` stwórz równoważny do poprzedniego `deployment` i `service`.
* Uwaga: w obiektach z biblioteki `kube-libsonnet` stosowana jest sztuczka z polami oznaczonymi "podłogą" (np. `containers_`)
