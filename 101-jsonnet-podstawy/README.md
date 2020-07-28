# 101 Jsonnet - Podstawy

## Podstawowe informacje

1. [Tutorial Online](https://jsonnet.org/learning/tutorial.html)
2. [Biblioteka Standardowa](https://jsonnet.org/ref/stdlib.html)

## Funkcje języka w praktyce

1. Plik `aio.jsonnet` w szybki sposób przedstawia większość funkcji języka Jsonnet.

2. Zapraszamy na pizzę! Plik `menu.jsonnet` wykorzystuje import bibliotek (`pizza.libsonnet`) dla ułatwienia tworzenia nowych obiektów.

    Zadanie: Dodaj kilka "generycznych wersji pizzy", korzystając z pętli.

    Zadanie: Wykorzystaj pizzę margheritę i stwórz funkcję (fabrykę) dla innych typów pizzy.
    
    Zadanie: Wypisz pary ("nazwa pizzy", "cena pizzy") dla całego stworzonego przez siebie menu. 

    Zadanie: Zapisz stworzone menu w formie pliku YAML.
      * **Uwaga:** `jsonnet -S` może się przydać. Co robi?
      * **Uwaga 2:** W jednym pliku YAML może być wiele dokumentów (obiektów)!

    Zadanie: Zapisz stworzone menu w formie pliku INI.
    * Sprawdź funkcję: `std.manifestIni`