import 'package:ads_app/classes/advertisement.dart';
import 'package:ads_app/mocks/category_mocks.dart';
import 'package:ads_app/mocks/user_mocks.dart';

Advertisement advertisementOMorroDosVentosUivantes = Advertisement.create(
  name: "O Morro dos Ventos Uivantes",
  description:
      "O único romance de Emily Brontë, publicado em 1847 e hoje um clássico da literatura inglesa.",
  category: categoryBook,
  priceInCents: 2000,
  advertiser: userMaria,
);

Advertisement advertisementIphone = Advertisement.create(
  name: "iPhone 13",
  description: "iPhone 13 com 128GB, cor azul, novo na caixa.",
  category: categoryElectronics,
  priceInCents: 70000,
  advertiser: userMaria,
);

Advertisement advertisementCamiseta = Advertisement.create(
  name: "Camiseta Estampada",
  description: "Camiseta 100% algodão com estampa criativa.",
  category: categoryClothing,
  priceInCents: 4999,
  advertiser: userJoao,
);

Advertisement advertisementSofa = Advertisement.create(
  name: "Sofá de Couro",
  description: "Sofá de couro legítimo, confortável e elegante.",
  category: categoryHome,
  priceInCents: 120000,
  advertiser: userAna,
);

Advertisement advertisementBolaFutebol = Advertisement.create(
  name: "Bola de Futebol",
  description: "Bola de futebol oficial, tamanho 5.",
  category: categorySports,
  priceInCents: 2999,
  advertiser: userMaria,
);

Advertisement advertisementBoneca = Advertisement.create(
  name: "Boneca de Pano",
  description: "Boneca de pano artesanal, perfeita para presentear.",
  category: categoryToys,
  priceInCents: 15000,
  advertiser: userJoao,
);

Advertisement advertisementPizza = Advertisement.create(
  name: "Pizza Margherita",
  description: "Deliciosa pizza margherita, feita com ingredientes frescos.",
  category: categoryFood,
  priceInCents: 2500,
  advertiser: userAna,
);

Advertisement advertisementPerfume = Advertisement.create(
  name: "Perfume Floral",
  description: "Perfume floral de alta qualidade, ideal para o dia a dia.",
  category: categoryBeauty,
  priceInCents: 9999,
  advertiser: userMaria,
);

Advertisement advertisementSuplemento = Advertisement.create(
  name: "Suplemento de Proteína",
  description: "Suplemento de proteína sabor chocolate, 1kg.",
  category: categoryHealth,
  priceInCents: 45000,
  advertiser: userJoao,
);

Advertisement advertisementCarro = Advertisement.create(
  name: "Carro Sedan 2018",
  description: "Carro sedan 2018, 30.000 km rodados, em ótimo estado.",
  category: categoryAutomotive,
  priceInCents: 600000,
  advertiser: userAna,
);

Advertisement advertisementLaptop = Advertisement.create(
  name: "Dell XPS 13",
  description:
      "Um laptop de alto desempenho com uma deslumbrante tela de 13 polegadas e design elegante.",
  category: categoryElectronics,
  priceInCents: 120000,
  advertiser: userHigor,
);

Advertisement advertisementCamisetaGrafica = Advertisement.create(
  name: "Camiseta Gráfica",
  description:
      "Uma camiseta confortável com estampa perfeita para saídas casuais.",
  category: categoryClothing,
  priceInCents: 2500,
  advertiser: userJoao,
);

Advertisement advertisementSofaCouro = Advertisement.create(
  name: "Sofá de Couro",
  description:
      "Um sofá de couro estiloso e confortável que complementa qualquer sala de estar.",
  category: categoryHome,
  priceInCents: 50000,
  advertiser: userAna,
);

Advertisement advertisementBolaDeFutebol = Advertisement.create(
  name: "Bola de Futebol Oficial",
  description: "Bola oficial aprovada pela FIFA para os amantes do futebol.",
  category: categorySports,
  priceInCents: 3000,
  advertiser: userHigor,
);

Advertisement advertisementBonecoDeAcao = Advertisement.create(
  name: "Boneco de Ação de Super-Herói",
  description:
      "Um boneco de ação do seu super-herói favorito, perfeito para colecionadores.",
  category: categoryToys,
  priceInCents: 1500,
  advertiser: userMaria,
);

Advertisement advertisementPizzaGourmet = Advertisement.create(
  name: "Pizza Gourmet",
  description:
      "Deliciosa pizza feita com ingredientes frescos e uma variedade de coberturas.",
  category: categoryFood,
  priceInCents: 1200,
  advertiser: userJoao,
);

Advertisement advertisementCremeFacial = Advertisement.create(
  name: "Creme Hidratante para o Rosto",
  description:
      "Um creme hidratante para o rosto adequado para todos os tipos de pele.",
  category: categoryBeauty,
  priceInCents: 3000,
  advertiser: userAna,
);

Advertisement advertisementVitaminas = Advertisement.create(
  name: "Multivitamínicos Diários",
  description: "Vitaminas e minerais essenciais para a saúde do dia a dia.",
  category: categoryHealth,
  priceInCents: 2500,
  advertiser: userHigor,
);

Advertisement advertisementCarroToyota = Advertisement.create(
  name: "Toyota Corolla 2021",
  description:
      "Um carro confiável e econômico, perfeito para deslocamentos diários.",
  category: categoryAutomotive,
  priceInCents: 2000000,
  advertiser: userMaria,
);

List<Advertisement> initialAdvertisements = [
  advertisementOMorroDosVentosUivantes,
  advertisementIphone,
  advertisementCamiseta,
  advertisementSofa,
  advertisementBolaFutebol,
  advertisementBoneca,
  advertisementPizza,
  advertisementPerfume,
  advertisementSuplemento,
  advertisementCarro,
  advertisementLaptop,
  advertisementCamisetaGrafica,
  advertisementSofaCouro,
  advertisementBolaDeFutebol,
  advertisementBonecoDeAcao,
  advertisementPizzaGourmet,
  advertisementCremeFacial,
  advertisementVitaminas,
  advertisementCarroToyota,
];
