# 101 Jsonnet - Podstawy

## Podstawowe informacje

1. [Tutorial Online](https://jsonnet.org/learning/tutorial.html)
2. [Biblioteka Standardowa](https://jsonnet.org/ref/stdlib.html)

## Funkcje języka w praktyce

1. Plik `aio.jsonnet` w szybki sposób przedstawia większość funkcji języka Jsonnet.

2. Zapraszamy na pizzę! Plik `menu.jsonnet` wykorzystuje import bibliotek (`pizza.libsonnet`) dla ułatwienia tworzenia nowych obiektów.

    Zadanie 1: Dodaj kilka "generycznych wersji pizzy", korzystając z pętli.

    Zadanie 2: Wykorzystaj pizzę margheritę i stwórz funkcję (fabrykę) dla innych typów pizzy.
    
    Zadanie 3: Wypisz zestawy danych ("nazwa pizzy", "cena pizzy") dla całego stworzonego przez siebie menu. 

    Zadanie 4: Zapisz stworzone menu w formie pliku YAML.
      * **Uwaga:** `jsonnet -S` może się przydać. Co robi?
      * **Uwaga 2:** W jednym pliku YAML może być wiele dokumentów (obiektów)!
