local pizza = import './pizza.libsonnet';

[
  pizza.margherita {
    nazwa: 'hawajska',
    cena: '21',
  },
  pizza.margherita {
    nazwa: 'hawajska',
    cena: '21',
    ananas: true,
  } + pizza.dla_purystow,
  pizza.margherita {
    nazwa: 'czort',
    cena: '66,6',
  } + pizza.ostra_w_ch,
]
