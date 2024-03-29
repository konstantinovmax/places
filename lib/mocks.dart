import 'package:places/domain/models/sight_model.dart';

final List<SightModel> mocks = [
  const SightModel(
    name: 'Дудергофские высоты',
    lat: 59.6973805,
    lon: 30.1291935,
    url: 'http://oopt.spb.ru/wp-content/uploads/2015/12/Duderhof1.jpg',
    details:
        'Памятник природы, группа холмов ледникового происхождения, одна часть которых расположена в Ломоносовском районе Ленинградской области, а другая на юго-западе Санкт-Петербурга.',
    type: 'Парк',
  ),
  const SightModel(
    name: 'Линдуловская роща',
    lat: 60.2302584,
    lon: 29.5068099,
    url:
        'http://www.petersburg-bridges.ru/files/2019/06/IMG_20190611_122317.jpg',
    details:
        'Государственный природный ботанический заказник. Расположен на территории Выборгского района Ленинградской области вблизи посёлка Рощино.',
    type: 'Парк',
  ),
  const SightModel(
    name: 'Пулковская обсерватория',
    lat: 59.7722654,
    lon: 30.3239842,
    url: 'https://s0.rbk.ru/v6_top_pics/media/img/2/89/755439153591892.jpg',
    details:
        'Основная астрономическая обсерватория Российской академии наук. Открыта 7 августа 1839 года. Располагается в 19 км к югу от центра Санкт-Петербурга на местности Пулково на Пулковских высотах.',
    type: 'Музей',
  ),
  const SightModel(
    name: 'Нарвские триумфальные ворота',
    lat: 59.900942,
    lon: 30.2716213,
    url: 'https://www.fiesta.ru/uploads/slider_image/image/154956/v880_11.jpg',
    details:
        'На́рвские триумфа́льные воро́та — памятник архитектуры стиля ампир в Санкт-Петербурге. Расположен на площади Стачек вблизи станции метро «Нарвская».',
    type: 'Памятник',
  ),
  const SightModel(
    name: 'Эрмитаж',
    lat: 59.9398479,
    lon: 30.3132962,
    url:
        'https://dorognoe.ru/thumb/news_870/news/01/2019/a6/8d/5cd193b678f76_352.jpg',
    details:
        'Музей изобразительного и декоративно-прикладного искусства, расположенный в городе Санкт-Петербурге Российской Федерации. Основан 7 декабря 1764 года. Является одним из крупнейших художественных музеев в мире.',
    type: 'Музей',
  ),
  const SightModel(
    name: 'Московский парк Победы',
    lat: 59.8684463,
    lon: 30.3265808,
    url:
        'https://kudago.com/media/images/place/99/d6/99d65d52d8dd966418b647eb162ed5b8.jpg',
    details:
        'Парк в Московском районе Санкт-Петербурга. Впервые заложен в 1939—1941 годах в соответствии с Генеральным планом развития Ленинграда как Парк культуры и отдыха.',
    type: 'Парк',
  ),
  const SightModel(
    name: 'Площадь Победы',
    lat: 59.8430874,
    lon: 30.3181712,
    url:
        'https://www.gov.spb.ru/static/writable/mediact/photo/2020/05/05/ploschad-pobedy.jpg',
    details: 'Площадь в Московском районе Санкт-Петербурга.',
    type: 'Памятник',
  ),
];

final List<String> sightCategories = [
  'Отель',
  'Ресторан',
  'Особое место',
  'Парк',
  'Музей',
  'Кафе',
];

final List<String> sightCategoriesSelected = [];

final List<SightModel> filteredPlaces = [];
