// Komentarz w linii
/* 
  Komentarz blokowy 
*/

// Zmienna lokalna (niepubliczna)
local greeting = "hello world!";

local patch = {
  dict +: {
    patch: "tak",
  },
  bar: 6,
};

// ostatnia deklaracja obiektu jest zwracana przez program
{
  foo: "bar", // string
  bar: 5, // int
  baz: false, // bool
  list: [1,2,3], // array
  // object
  dict: {
    wewnatrz: greeting, // wykorzystanie zmiennej lokalnej
  },
  ukryty:: "smok", // "prywatne" pole
} + patch // kolejność ma znaczenie?