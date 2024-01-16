import '../../../utils/constants/image_strings.dart';
import '../models/category_model.dart';
import '../models/product_review_model.dart';

class TDummyData {
  static final List<CategoryModel> categories = [
    //   CategoryModel(id: '0080', nameRU: 'Музыкальные инструменты', nameKZ: 'Музыкалық аспаптар', image: '', isFeatured: false, parentId: '0006'),
    //   CategoryModel(id: '0081', nameRU: 'Оборудование и расходные материалы для лаборатории', nameKZ: 'Зертханаға арналған жабдықтар мен керек-жарақтар', image: '', isFeatured: false,parentId: '0006'),
    //   CategoryModel(id: '0082', nameRU: 'Оптические приборы', nameKZ: 'Оптикалық аспаптар', image: '', isFeatured: false,parentId: '0006'),
    //   CategoryModel(id: '0083', nameRU: 'Хобби и творчество', nameKZ: 'Хобби және шығармашылық', image: '', isFeatured: false,parentId: '0006'),
    //   CategoryModel(id: '0084', nameRU: 'Бумага и бумажная продукция', nameKZ: 'Қағаз және қағаз өнімдері', image: '', isFeatured: false,parentId: '0007'),
    //   CategoryModel(id: '0085', nameRU: 'Демонстрационные доски', nameKZ: 'Демонстрациялық тақталар', image: '', isFeatured: false,parentId: '0007'),
    //   CategoryModel(id: '0086', nameRU: 'Мелкоофисные принадлежности', nameKZ: 'Шағын кеңсе керек-жарақтары', image: '', isFeatured: false,parentId: '0007'),
    //   CategoryModel(id: '0087', nameRU: 'Офисные принадлежности', nameKZ: 'Кеңсе керек-жарақтары', image: '', isFeatured: false,parentId: '0007'),
    //   CategoryModel(id: '0088', nameRU: 'Письменные принадлежности', nameKZ: 'Жазу құралдары', image: '', isFeatured: false,parentId: '0007'),
    //   CategoryModel(id: '0089', nameRU: 'Постпечатное оборудование', nameKZ: 'Басып шығарудан кейінгі жабдық', image: '', isFeatured: false,parentId: '0007'),
    //   CategoryModel(id: '0090', nameRU: 'Торговые и рекламные принадлежности', nameKZ: 'Сауда және жарнама құралдары', image: '', isFeatured: false,parentId: '0007'),
    //   CategoryModel(id: '0091', nameRU: 'Учебное оборудование и приборы', nameKZ: 'Оқу жабдықтары мен аспаптары', image: '', isFeatured: false,parentId: '0007'),
    //   CategoryModel(id: '0092', nameRU: 'Чертежные принадлежности', nameKZ: 'Сурет салу керек-жарақтары', image: '', isFeatured: false,parentId: '0007'),
    //   CategoryModel(id: '0093', nameRU: 'Школьные принадлежности', nameKZ: 'Оқу құралдары', image: '', isFeatured: false,parentId: '0007'),
    //   CategoryModel(id: '0094', nameRU: 'Штемпельные принадлежности', nameKZ: 'Мөрге арналған керек-жарақтары', image: '', isFeatured: false,parentId: '0007'),
    //   CategoryModel(id: '0095', nameRU: 'IP-телефония и конференц-оборудование', nameKZ: 'IP телефония және конференция жабдығы', image: '', isFeatured: false,parentId: '0008'),
    //   CategoryModel(id: '0096', nameRU: 'Комплектующие', nameKZ: 'Құрамдас бөліктер', image: '', isFeatured: false,parentId: '0008'),
    //   CategoryModel(id: '0097', nameRU: 'Настольные компьютеры', nameKZ: 'Жұмыс үстелі компьютерлері', image: '', isFeatured: false,parentId: '0008'),
    //   CategoryModel(id: '0098', nameRU: 'Ноутбуки и аксессуары', nameKZ: 'Ноутбуктер мен аксессуарлар', image: '', isFeatured: false,parentId: '0008'),
    //   CategoryModel(id: '0099', nameRU: 'Оргтехника и расходные материалы', nameKZ: 'Ұйымдастыру техникасы және шығын материалдары', image: '', isFeatured: false,parentId: '0008'),
    //   CategoryModel(id: '0100', nameRU: 'Периферия', nameKZ: 'Периферия', image: '', isFeatured: false,parentId: '0008'),
    //   CategoryModel(id: '0101', nameRU: 'Планшеты и аксессуары', nameKZ: 'Планшеттер мен аксессуарлар', image: '', isFeatured: false,parentId: '0008'),
    //   CategoryModel(id: '0102', nameRU: 'Программное обеспечение', nameKZ: 'Бағдарламалық қамтамасыз ету', image: '', isFeatured: false,parentId: '0008'),
    //   CategoryModel(id: '0103', nameRU: 'Сетевое оборудование', nameKZ: 'Желілік жабдық', image: '', isFeatured: false,parentId: '0008'),
    //   CategoryModel(id: '0104', nameRU: 'Электронное оборудование для торговли', nameKZ: 'Электрондық сауда жабдықтары', image: '', isFeatured: false,parentId: '0008'),
    //   CategoryModel(id: '0105', nameRU: 'Аксессуары для красоты', nameKZ: 'Сұлулық аксессуарлары', image: '', isFeatured: false,parentId: '0009'),
    //   CategoryModel(id: '0106', nameRU: 'Декоративная косметика', nameKZ: 'Сәндік косметика', image: '', isFeatured: false,parentId: '0009'),
    //   CategoryModel(id: '0107', nameRU: 'Депиляция и эпиляция', nameKZ: 'Депиляция және эпиляция', image: '', isFeatured: false,parentId: '0009'),
    //   CategoryModel(id: '0108', nameRU: 'Для маникюра и педикюра', nameKZ: 'Маникюр және педикюр үшін', image: '', isFeatured: false,parentId: '0009'),
    //   CategoryModel(id: '0109', nameRU: 'Защита от солнца', nameKZ: 'Күннен қорғау', image: '', isFeatured: false,parentId: '0009'),
    //   CategoryModel(id: '0110', nameRU: 'Инструменты для укладки, ухода и наращивания волос', nameKZ: 'Шашты сәндеуге, күтуге және ұзартуға арналған құралдар', image: '', isFeatured: false,parentId: '0009'),
    //   CategoryModel(id: '0111', nameRU: 'Косметика и аксессуары для бровей и ресниц', nameKZ: 'Қасқа және кірпікке арналған Косметика мен аксессуарлар', image: '', isFeatured: false,parentId: '0009'),
    //   CategoryModel(id: '0112', nameRU: 'Массажеры, массажные кресла, миостимуляторы', nameKZ: 'Массажерлер, массаж креслолары, миостимуляторлар', image: '', isFeatured: false,parentId: '0009'),
    //   CategoryModel(id: '0113', nameRU: 'Мебель и оборудование для салонов красоты', nameKZ: 'Сұлулық салондарына арналған жиһаздар мен жабдықтар', image: '', isFeatured: false,parentId: '0009'),
    //   CategoryModel(id: '0114', nameRU: 'Наборы косметики', nameKZ: 'Косметика жиынтығы', image: '', isFeatured: false,parentId: '0009'),
    //   CategoryModel(id: '0115', nameRU: 'Техника и оборудование для красоты', nameKZ: 'Сұлулық техникасы мен жабдықтары', image: '', isFeatured: false,parentId: '0009'),
    //   CategoryModel(id: '0116', nameRU: 'Товары для ароматерапии', nameKZ: 'Ароматерапияға арналған өнімдер', image: '', isFeatured: false,parentId: '0009'),
    //   CategoryModel(id: '0117', nameRU: 'Товары для бритья', nameKZ: 'Қырыну өнімдері', image: '', isFeatured: false,parentId: '0009'),
    //   CategoryModel(id: '0118', nameRU: 'Товары для тату и перманентного макияжа', nameKZ: 'Татуировка және тұрақты макияж өнімдері', image: '', isFeatured: false,parentId: '0009'),
    //   CategoryModel(id: '0119', nameRU: 'Уход за волосами', nameKZ: 'Шаш күтімі', image: '', isFeatured: false,parentId: '0009'),
    //   CategoryModel(id: '0120', nameRU: 'Уход за лицом', nameKZ: 'Бет күтімі', image: '', isFeatured: false,parentId: '0009'),
    //   CategoryModel(id: '0121', nameRU: 'Уход за полостью рта', nameKZ: 'Ауыз қуысына күтім жасау', image: '', isFeatured: false,parentId: '0009'),
    //   CategoryModel(id: '0122', nameRU: 'Уход за телом', nameKZ: 'Дене күтімі', image: '', isFeatured: false,parentId: '0009'),
    //   CategoryModel(id: '0123', nameRU: 'Парфюмерия', nameKZ: 'Парфюмерия', image: '', isFeatured: false,parentId: '0009'),
    //   CategoryModel(id: '0124', nameRU: 'Ванная комната', nameKZ: 'Жуынатын бөлме', image: '', isFeatured: false,parentId: '0010'),
    //   CategoryModel(id: '0125', nameRU: 'Гостиная', nameKZ: 'Қонақ бөлмесі', image: '', isFeatured: false,parentId: '0010'),
    //   CategoryModel(id: '0126', nameRU: 'Детская комната', nameKZ: 'Балалар бөлмесі', image: '', isFeatured: false,parentId: '0010'),
    //   CategoryModel(id: '0127', nameRU: 'Кухня', nameKZ: 'Ас үй', image: '', isFeatured: false,parentId: '0010'),
    //   CategoryModel(id: '0128', nameRU: 'Офис и кабинет', nameKZ: 'Кеңсе және кеңсе', image: '', isFeatured: false,parentId: '0010'),
    //   CategoryModel(id: '0129', nameRU: 'Прихожая', nameKZ: 'Дәліз', image: '', isFeatured: false,parentId: '0010'),
    //   CategoryModel(id: '0130', nameRU: 'Системы хранения, полки, этажерки', nameKZ: 'Сақтау жүйелері, сөрелер, кітап сөрелері', image: '', isFeatured: false,parentId: '0010'),
    //   CategoryModel(id: '0131', nameRU: 'Спальня', nameKZ: 'Жатын бөлме', image: '', isFeatured: false,parentId: '0010'),
    //   CategoryModel(id: '0132', nameRU: 'Торговое оборудование', nameKZ: 'Сауда жабдықтары', image: '', isFeatured: false,parentId: '0010'),
    //   CategoryModel(id: '0133', nameRU: 'Фурнитура и комплектующие для мебели', nameKZ: 'Жиһазға арналған керек-жарақтар мен керек-жарақтар', image: '', isFeatured: false,parentId: '0010'),
    //   CategoryModel(id: '0134', nameRU: 'Женская обувь', nameKZ: 'Әйелдер аяқ киімі', image: '', isFeatured: false,parentId: '0011'),
    //   CategoryModel(id: '0135', nameRU: 'Мужская обувь', nameKZ: 'Ерлер аяқ киімі', image: '', isFeatured: false,parentId: '0011'),
    //   CategoryModel(id: '0136', nameRU: 'Обувь для девочек', nameKZ: 'Қыздарға арналған аяқ киім', image: '', isFeatured: false,parentId: '0011'),
    //   CategoryModel(id: '0137', nameRU: 'Обувь для мальчиков', nameKZ: 'Ұлдарға арналған аяқ киім', image: '', isFeatured: false,parentId: '0011'),
    //   CategoryModel(id: '0138', nameRU: 'Девочкам', nameKZ: 'Қыздарға', image: '', isFeatured: false,parentId: '0012'),
    //   CategoryModel(id: '0139', nameRU: 'Женщинам', nameKZ: 'Әйелдер', image: '', isFeatured: false,parentId: '0012'),
    //   CategoryModel(id: '0140', nameRU: 'Мальчикам', nameKZ: 'Ұлдарға', image: '', isFeatured: false,parentId: '0012'),
    //   CategoryModel(id: '0141', nameRU: 'Мужчинам', nameKZ: 'Ерлер', image: '', isFeatured: false,parentId: '0012'),
    //   CategoryModel(id: '0142', nameRU: 'Одежда для новорожденных', nameKZ: 'Жаңа туған нәрестелерге арналған киім', image: '', isFeatured: false,parentId: '0012'),
    //   CategoryModel(id: '0143', nameRU: 'Карнавальные костюмы, аксессуары для вечеринок', nameKZ: 'Карнавал костюмдері, мерекелік аксессуарлар', image: '', isFeatured: false,parentId: '0013'),
    //   CategoryModel(id: '0144', nameRU: 'Новогодние товары', nameKZ: 'Жаңа жылдық тауарлар', image: '', isFeatured: false,parentId: '0013'),
    //   CategoryModel(id: '0145', nameRU: 'Подарки', nameKZ: 'Сыйлықтар', image: '', isFeatured: false,parentId: '0013'),
    //   CategoryModel(id: '0146', nameRU: 'Подарочная упаковка', nameKZ: 'Сыйлық орамасы', image: '', isFeatured: false,parentId: '0013'),
    //   CategoryModel(id: '0147', nameRU: 'Сувенирная продукция', nameKZ: 'Кәдесый өнімдері', image: '', isFeatured: false,parentId: '0013'),
    //   CategoryModel(id: '0148', nameRU: 'Украшения для праздников', nameKZ: 'Мерекеге арналған әшекейлер', image: '', isFeatured: false,parentId: '0013'),
    //   CategoryModel(id: '0149', nameRU: 'Цветы и букеты', nameKZ: 'Гүлдер мен гүл шоқтары', image: '', isFeatured: false,parentId: '0013'),
    //   CategoryModel(id: '0150', nameRU: 'Все для выпечки', nameKZ: 'Барлығы пісіруге арналған', image: '', isFeatured: false,parentId: '0014'),
    //   CategoryModel(id: '0151', nameRU: 'Готовая еда', nameKZ: 'Дайын тамақ', image: '', isFeatured: false,parentId: '0014'),
    //   CategoryModel(id: '0152', nameRU: 'Замороженные продукты, мороженое', nameKZ: 'Мұздатылған тағамдар, балмұздақ', image: '', isFeatured: false,parentId: '0014'),
    //   CategoryModel(id: '0153', nameRU: 'Колбасы, сосиски, деликатесы', nameKZ: 'Шұжықтар, шұжықтар, дәмді тағамдар', image: '', isFeatured: false,parentId: '0014'),
    //   CategoryModel(id: '0154', nameRU: 'Консервация', nameKZ: 'Консервация', image: '', isFeatured: false,parentId: '0014'),
    //   CategoryModel(id: '0155', nameRU: 'Крупы, хлопья, макароны', nameKZ: 'Жарма, үлпек, макарон өнімдері', image: '', isFeatured: false,parentId: '0014'),
    //   CategoryModel(id: '0156', nameRU: 'Масла, соусы', nameKZ: 'Майлар, соустар', image: '', isFeatured: false,parentId: '0014'),
    //   CategoryModel(id: '0157', nameRU: 'Молочные продукты, яйца', nameKZ: 'Сүт өнімдері, жұмыртқа', image: '', isFeatured: false,parentId: '0014'),
    //   CategoryModel(id: '0158', nameRU: 'Мясо и птица', nameKZ: 'Ет және құс еті', image: '', isFeatured: false,parentId: '0014'),
    //   CategoryModel(id: '0159', nameRU: 'Овощи, фрукты, ягоды, грибы', nameKZ: 'Көкөністер, жемістер, жидектер, саңырауқұлақтар', image: '', isFeatured: false,parentId: '0014'),
    //   CategoryModel(id: '0160', nameRU: 'Рыба, морепродукты', nameKZ: 'Балық, теңіз өнімдері', image: '', isFeatured: false,parentId: '0014'),
    //   CategoryModel(id: '0161', nameRU: 'Сахар и заменители, соль, специи', nameKZ: 'Қант және алмастырғыштар, тұз, дәмдеуіштер', image: '', isFeatured: false,parentId: '0014'),
    //   CategoryModel(id: '0162', nameRU: 'Сладости и выпечка', nameKZ: 'Кәмпиттер мен нан өнімдері', image: '', isFeatured: false,parentId: '0014'),
    //   CategoryModel(id: '0163', nameRU: 'Соки, вода, напитки', nameKZ: 'Шырындар, су, сусындар', image: '', isFeatured: false,parentId: '0014'),
    //   CategoryModel(id: '0164', nameRU: 'Сублимированная туристическая еда', nameKZ: 'Мұздатылған кептірілген саяхат тағамы', image: '', isFeatured: false,parentId: '0014'),
    //   CategoryModel(id: '0165', nameRU: 'Хлебные изделия', nameKZ: 'Нан өнімдері', image: '', isFeatured: false,parentId: '0014'),
    //   CategoryModel(id: '0166', nameRU: 'Чай, кофе, какао', nameKZ: 'Шай, кофе, какао', image: '', isFeatured: false,parentId: '0014'),
    //   CategoryModel(id: '0167', nameRU: 'Чипсы, орехи, снэки', nameKZ: 'Чипсы, жаңғақтар, жеңіл тағамдар', image: '', isFeatured: false,parentId: '0014'),
    //   CategoryModel(id: '0168', nameRU: 'Соевые и растительные продукты', nameKZ: 'Соя және өсімдік өнімдері', image: '', isFeatured: false,parentId: '0014'),
    //   CategoryModel(id: '0169', nameRU: 'Альпинизм и скалолазание', nameKZ: 'Альпинизм және жартасқа өрмелеу', image: '', isFeatured: false,parentId: '0015'),
    //   CategoryModel(id: '0170', nameRU: 'Бокс и единоборства', nameKZ: 'Бокс және жекпе-жек', image: '', isFeatured: false,parentId: '0015'),
    //   CategoryModel(id: '0171', nameRU: 'Велоспорт', nameKZ: 'Велоспорт', image: '', isFeatured: false,parentId: '0015'),
    //   CategoryModel(id: '0172', nameRU: 'Водный спорт', nameKZ: 'Су спорты', image: '', isFeatured: false,parentId: '0015'),
    //   CategoryModel(id: '0173', nameRU: 'Зимний спорт', nameKZ: 'Қысқы спорт', image: '', isFeatured: false,parentId: '0015'),
    //   CategoryModel(id: '0174', nameRU: 'Конный спорт', nameKZ: 'Ат спорты', image: '', isFeatured: false,parentId: '0015'),
    //   CategoryModel(id: '0175', nameRU: 'Легкая атлетика', nameKZ: 'Жеңіл атлетика', image: '', isFeatured: false,parentId: '0015'),
    //   CategoryModel(id: '0176', nameRU: 'Пауэрлифтинг', nameKZ: 'Пауэрлифтинг', image: '', isFeatured: false,parentId: '0015'),
    //   CategoryModel(id: '0177', nameRU: 'Роликовые коньки и лыжероллеры', nameKZ: 'Роликті конькилер мен шаңғылар', image: '', isFeatured: false,parentId: '0015'),
    //   CategoryModel(id: '0178', nameRU: 'Самокаты, гироскутеры, моноколеса', nameKZ: 'Скутерлер, ховербордтар, велосипедтер', image: '', isFeatured: false,parentId: '0015'),
    //   CategoryModel(id: '0179', nameRU: 'Спортивная защита и экипировка', nameKZ: 'Спорттық қорғаныс және жабдықтар', image: '', isFeatured: false,parentId: '0015'),
    //   CategoryModel(id: '0180', nameRU: 'Спортивная одежда и обувь', nameKZ: 'Спорттық киім және аяқ киім', image: '', isFeatured: false,parentId: '0015'),
    //   CategoryModel(id: '0181', nameRU: 'Спортивное питание', nameKZ: 'Спорттық тағам', image: '', isFeatured: false,parentId: '0015'),
    //   CategoryModel(id: '0182', nameRU: 'Спортивные игры', nameKZ: 'Спорттық ойындар', image: '', isFeatured: false,parentId: '0015'),
    //   CategoryModel(id: '0183', nameRU: 'Товары для йоги', nameKZ: 'Йога өнімдері', image: '', isFeatured: false,parentId: '0015'),
    //   CategoryModel(id: '0184', nameRU: 'Товары для охоты и стрельбы', nameKZ: 'Аңшылық пен атуға арналған өнімдер', image: '', isFeatured: false,parentId: '0015'),
    //   CategoryModel(id: '0185', nameRU: 'Товары для рыбалки', nameKZ: 'Балық аулауға арналған тауарлар', image: '', isFeatured: false,parentId: '0015'),
    //   CategoryModel(id: '0186', nameRU: 'Товары для самообороны', nameKZ: 'Өзін-өзі қорғау өнімдері', image: '', isFeatured: false,parentId: '0015'),
    //   CategoryModel(id: '0187', nameRU: 'Товары для фитнеса', nameKZ: 'Фитнес өнімдері', image: '', isFeatured: false,parentId: '0015'),
    //   CategoryModel(id: '0188', nameRU: 'Тренажеры', nameKZ: 'Жаттығу жабдықтары', image: '', isFeatured: false,parentId: '0015'),
    //   CategoryModel(id: '0189', nameRU: 'Туризм и отдых на природе', nameKZ: 'Туризм және табиғатта демалу', image: '', isFeatured: false,parentId: '0015'),
    //   CategoryModel(id: '0190', nameRU: 'Художественная гимнастика и танцы', nameKZ: 'Көркем гимнастика және би', image: '', isFeatured: false,parentId: '0015'),
    //   CategoryModel(id: '0191', nameRU: 'Баня и сауна', nameKZ: 'Монша мен сауна', image: '', isFeatured: false,parentId: '0016'),
    //   CategoryModel(id: '0192', nameRU: 'Водоснабжение', nameKZ: 'Сумен жабдықтау', image: '', isFeatured: false,parentId: '0016'),
    //   CategoryModel(id: '0193', nameRU: 'Ворота и ограждения', nameKZ: 'Қақпалар мен қоршаулар', image: '', isFeatured: false,parentId: '0016'),
    //   CategoryModel(id: '0194', nameRU: 'Двери, окна, лестницы', nameKZ: 'Есіктер, терезелер, баспалдақтар', image: '', isFeatured: false,parentId: '0016'),
    //   CategoryModel(id: '0195', nameRU: 'Инструменты', nameKZ: 'Құралдар', image: '', isFeatured: false,parentId: '0016'),
    //   CategoryModel(id: '0196', nameRU: 'Лакокрасочные материалы', nameKZ: 'Бояу материалдары', image: '', isFeatured: false,parentId: '0016'),
    //   CategoryModel(id: '0197', nameRU: 'Напольные покрытия', nameKZ: 'Еден жабындары', image: '', isFeatured: false,parentId: '0016'),
    //   CategoryModel(id: '0198', nameRU: 'Отделочные материалы', nameKZ: 'Әрлеу материалдары', image: '', isFeatured: false,parentId: '0016'),
    //   CategoryModel(id: '0199', nameRU: 'Плитка', nameKZ: 'Плитка', image: '', isFeatured: false,parentId: '0016'),
    //   CategoryModel(id: '0200', nameRU: 'Сантехника', nameKZ: 'Сантехника', image: '', isFeatured: false,parentId: '0016'),
    //   CategoryModel(id: '0201', nameRU: 'Системы безопасности', nameKZ: 'Қауіпсіздік жүйелері', image: '', isFeatured: false,parentId: '0016'),
    //   CategoryModel(id: '0202', nameRU: 'Системы отопления и вентиляции', nameKZ: 'Жылыту және желдету жүйелері', image: '', isFeatured: false,parentId: '0016'),
    //   CategoryModel(id: '0203', nameRU: 'Средства индивидуальной защиты', nameKZ: 'Жеке қорғаныс құралдары', image: '', isFeatured: false,parentId: '0016'),
    //   CategoryModel(id: '0204', nameRU: 'Строительное оборудование', nameKZ: 'Құрылыс жабдықтары', image: '', isFeatured: false,parentId: '0016'),
    //   CategoryModel(id: '0205', nameRU: 'Строительные материалы', nameKZ: 'Құрылыс материалдары', image: '', isFeatured: false,parentId: '0016'),
    //   CategoryModel(id: '0206', nameRU: 'Электрика', nameKZ: 'Электрик', image: '', isFeatured: false,parentId: '0016'),
    //   CategoryModel(id: '0207', nameRU: 'Аудиотехника', nameKZ: 'Аудиотехника', image: '', isFeatured: false,parentId: '0017'),
    //   CategoryModel(id: '0208', nameRU: 'Видеотехника', nameKZ: 'Бейне техникасы', image: '', isFeatured: false,parentId: '0017'),
    //   CategoryModel(id: '0209', nameRU: 'Развлечения', nameKZ: 'Ойын-сауық', image: '', isFeatured: false,parentId: '0017'),
    //   CategoryModel(id: '0210', nameRU: 'Сценическое оборудование', nameKZ: 'Сахналық жабдықтар', image: '', isFeatured: false,parentId: '0017'),
    //   CategoryModel(id: '0211', nameRU: 'Фото и видеокамеры', nameKZ: 'Фото және бейнекамералар', image: '', isFeatured: false,parentId: '0017'),
    //   CategoryModel(id: '0212', nameRU: 'Наушники и гарнитуры', nameKZ: 'Құлаққаптар мен гарнитуралар', image: '', isFeatured: false,parentId: '0017'),
    //   CategoryModel(id: '0213', nameRU: 'Телевизоры', nameKZ: 'Телевизорлар', image: '', isFeatured: false,parentId: '0017'),
    //   CategoryModel(id: '0214', nameRU: 'Аксессуары для телефонов', nameKZ: 'Телефон аксессуарлары', image: '', isFeatured: false,parentId: '0018'),
    //   CategoryModel(id: '0215', nameRU: 'Гаджеты', nameKZ: 'Гаджеттер', image: '', isFeatured: false,parentId: '0018'),
    //   CategoryModel(id: '0216', nameRU: 'Мобильные телефоны', nameKZ: 'Ұялы телефондар', image: '', isFeatured: false,parentId: '0018'),
    //   CategoryModel(id: '0217', nameRU: 'Радиотелефоны', nameKZ: 'Радиотелефондар', image: '', isFeatured: false,parentId: '0018'),
    //   CategoryModel(id: '0218', nameRU: 'Смартфоны', nameKZ: 'Смартфондар', image: '', isFeatured: false,parentId: '0018'),
    //   CategoryModel(id: '0219', nameRU: 'Спутниковые телефоны и коммуникаторы', nameKZ: 'Спутниктік телефондар мен коммуникаторлар', image: '', isFeatured: false,parentId: '0018'),
    //   CategoryModel(id: '0220', nameRU: 'Дача, сад и огород', nameKZ: 'Коттедж, бақша және көкөніс бағы', image: '', isFeatured: false,parentId: '0019'),
    //   CategoryModel(id: '0221', nameRU: 'Домашний текстиль', nameKZ: 'Үй тоқыма бұйымдары', image: '', isFeatured: false,parentId: '0019'),
    //   CategoryModel(id: '0222', nameRU: 'Интерьер', nameKZ: 'Интерьер', image: '', isFeatured: false,parentId: '0019'),
    //   CategoryModel(id: '0223', nameRU: 'Освещение', nameKZ: 'Жарықтандыру', image: '', isFeatured: false,parentId: '0019'),
    //   CategoryModel(id: '0224', nameRU: 'Посуда и принадлежности', nameKZ: 'Ыдыс-аяқ пен керек-жарақтар', image: '', isFeatured: false,parentId: '0019'),
    //   CategoryModel(id: '0225', nameRU: 'Умный дом', nameKZ: 'Ақылды үй', image: '', isFeatured: false,parentId: '0019'),
    //   CategoryModel(id: '0226', nameRU: 'Хозяйственные товары', nameKZ: 'Шаруашылық тауарлар', image: '', isFeatured: false,parentId: '0019'),
    //   CategoryModel(id: '0227', nameRU: 'Аксессуары для животных', nameKZ: 'Жануарларға арналған аксессуарлар', image: '', isFeatured: false,parentId: '0020'),
    //   CategoryModel(id: '0228', nameRU: 'Ветаптека', nameKZ: 'Ветеринарлық дәріхана', image: '', isFeatured: false,parentId: '0020'),
    //   CategoryModel(id: '0229', nameRU: 'Гигиена и уход за животными', nameKZ: 'Жануарлардың гигиенасы және күтімі', image: '', isFeatured: false,parentId: '0020'),
    //   CategoryModel(id: '0230', nameRU: 'Груминг', nameKZ: 'Груминг', image: '', isFeatured: false,parentId: '0020'),
    //   CategoryModel(id: '0231', nameRU: 'Для грызунов', nameKZ: 'Кеміргіштер үшін', image: '', isFeatured: false,parentId: '0020'),
    //   CategoryModel(id: '0232', nameRU: 'Для кошек', nameKZ: 'Мысықтар үшін', image: '', isFeatured: false,parentId: '0020'),
    //   CategoryModel(id: '0233', nameRU: 'Для птиц', nameKZ: 'Құстар үшін', image: '', isFeatured: false,parentId: '0020'),
    //   CategoryModel(id: '0234', nameRU: 'Для рыб и рептилий', nameKZ: 'Балықтар мен бауырымен жорғалаушылар үшін', image: '', isFeatured: false,parentId: '0020'),
    //   CategoryModel(id: '0235', nameRU: 'Для сельскохозяйственных животных', nameKZ: 'Ауыл шаруашылығы жануарлары үшін', image: '', isFeatured: false,parentId: '0020'),
    //   CategoryModel(id: '0236', nameRU: 'Для собак', nameKZ: 'Иттер үшін', image: '', isFeatured: false,parentId: '0020'),
    //   CategoryModel(id: '0237', nameRU: 'Бижутерия', nameKZ: 'Бижутерия', image: '', isFeatured: false,parentId: '0021'),
    //   CategoryModel(id: '0238', nameRU: 'Ювелирное оборудование, подставки и фурнитура', nameKZ: 'Зергерлік бұйымдар, стендтер және аксессуарлар', image: '', isFeatured: false,parentId: '0021'),
    //   CategoryModel(id: '0239', nameRU: 'Ювелирные украшения', nameKZ: 'Зергерлік бұйымдар', image: '', isFeatured: false,parentId: '0021'),
    //   CategoryModel(id: '0240', nameRU: 'Ювелирные ремешки и браслеты для часов', nameKZ: 'Зергерлік бұйымдар сағат баулары мен білезіктер', image: '', isFeatured: false,parentId: '0021'),
  ];

  /// -- Product Reviews
  static final List<ProductReviewModel> productReviews = [
    ProductReviewModel(
      id: '01',
      userId: '001',
      userName: 'John Doe',
      rating: 4.5,
      timestamp: DateTime.now(),
      companyTimestamp: DateTime.now(),
      userImageUrl: TImages.userProfileImage2,
      comment: 'The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Great job!',
      companyComment:
          'Thank you for your kind words, John! We are delighted to hear about your smooth experience with the app. We always strive to offer an intuitive interface for our users. Stay tuned for more updates!',
    ),
    ProductReviewModel(
      id: '02',
      userId: '002',
      userName: 'Sophia Wilson',
      rating: 3.5,
      timestamp: DateTime.now(),
      companyTimestamp: DateTime.now(),
      userImageUrl: TImages.userProfileImage1,
      comment: 'I am genuinely impressed with the app design and the variety of products available. The filter and sort features have made shopping so much easier for me!',
      companyComment:
          'Thank you so much, Sophia! We are thrilled to hear you are enjoying the app and finding the features useful. Our goal is to make your shopping experience as efficient and pleasant as possible. Keep exploring, and happy shopping!',
    ),
    ProductReviewModel(
      id: '03',
      userId: '003',
      userName: 'Alex Brown',
      rating: 5,
      timestamp: DateTime.now(),
      companyTimestamp: DateTime.now(),
      userImageUrl: TImages.userProfileImage3,
      comment: 'The app is pretty fast, and the product recommendations are on point! I would love to see more features in the future.',
      companyComment:
          'Thanks for the feedback, Alex! We are thrilled to hear you enjoyed the speed and recommendations. We are constantly working on introducing new features, so keep an eye out for the next update!',
    ),
  ];
}
