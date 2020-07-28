{
  margherita: {
    nazwa: error "Pizza musi mieć nazwę!",
    cena: error "Pizza musi mieć cenę!",
    wielkosc: "mała",
    sos_pomidorowy: true,
    dodatkowy_sos: [],
    ostre_papryczki: false,
    plastry: {
      salami: false,
      ostre_salami: false,
      szynka: false,
    },
    ser: true,
    ostrosc: std.count([self.ostre_papryczki, self.plastry.ostre_salami], true),
  },
  ostra_w_ch: {
    ostre_papryczki: true,
    ostrosc: 5,
    plastry+: {
      salami: true
    },
  },
  dla_purystow: {
    assert ! std.objectHas(self, "ananas") || self.ananas == false : "Pizza z ananasem? tak nie wolno!",
  },
}