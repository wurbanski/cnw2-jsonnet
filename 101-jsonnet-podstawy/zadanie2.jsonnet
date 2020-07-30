local pizza = import 'pizza.libsonnet';
local lista = [
  { nazwa: 'pizza1', cena: 15 },
  { nazwa: 'pizza2', cena: 16 },
  { nazwa: 'pizza3', cena: 17 },
];

// funkcja, która generuje obiekt korzystając z parametrów
local generator_pizzy = function(nazwa, cena) pizza.margherita {
  nazwa: nazwa,
  cena: cena,
};

// żeby iterować potrzebujemy słownika i dynamicznych nazw kluczy
{
  [p.nazwa]: generator_pizzy(p.nazwa, p.cena)
  for p in lista
}
