local pizza = import 'pizza.libsonnet';
local lista = [
  { nazwa: 'pizza1', cena: 15 },
  { nazwa: 'pizza2', cena: 16 },
  { nazwa: 'pizza3', cena: 17 },
];

// żeby iterować potrzebujemy słownika i dynamicznych nazw kluczy
{
  [p.nazwa]: pizza.margherita {
    nazwa: p.nazwa,
    cena: p.cena,
  }
  for p in lista
}
