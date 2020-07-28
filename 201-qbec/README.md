# 201: Qbec

## Podstawowe informacje

[splunk/qbec](https://github.com/splunk/qbec) | [dokumentacja](https://qbec.io/)

## Pierwsze kroki

1. Stworzenie aplikacji: `qbec init`
2. **aplikacja** składa się z **komponentów** i ma zdefiniowane **środowiska**
3. Podstawowe operacje:
  * podgląd konfiguracji: `qbec show <środowisko>`
  * różnica względem wybranego środowiska: `qbec diff <środowisko>`
  * zastosowanie zmian: `qbec apply <środowisko>`

## Zadania

1. Zintegruj bibliotekę pobraną używając jsonnet-bundlera z systemem `qbec` (podpowiedź: `libPaths`)
2. Przenieś zdefiniowany wcześniej komponent do aplikacji qbec i wykorzystaj go.
3. Zaaplikuj swój kod i zobacz czy działa!