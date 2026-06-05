# encoding: utf-8

puts "Создаём тестового пользователя..."
admin = User.find_or_create_by!(email: 'admin@shaurma.ru') do |u|
  u.password = '123456'
  u.role = 1
end

puts "Очищаем старые данные..."
Place.destroy_all

puts "Создаём шаурмечные Ростова..."

Place.create!([
  {
    name: "Шаурма Маркет",
    address: "Ворошиловский просп., 105А, Ростов-на-Дону",
    location_url: "https://yandex.ru/maps/-/CPXp62Nq",
    user: admin
  },
  {
    name: "Шаурма Хаус",
    address: "Большая Садовая ул., 20/38, Ростов-на-Дону",
    location_url: "https://yandex.ru/maps/-/CPXpbNKD",
    user: admin
  },
  {
    name: "Шеф-Шаурма",
    address: "ул. Жданова, 14, Ростов-на-Дону",
    location_url: "https://yandex.ru/maps/-/CPXpbLmM",
    user: admin
  },
  {
    name: "Шаурма Кикчак",
    address: "Большая Садовая ул., 114, Ростов-на-Дону",
    location_url: "https://yandex.ru/maps/-/CPXpfM1i",
    user: admin
  },
  {
    name: "Экспресс Шаурма",
    address: "просп. Сиверса, 14/2, Ростов-на-Дону",
    location_url: "https://yandex.ru/maps/-/CPXpfS-9",
    user: admin
  },
  {
    name: "От Души",
    address: "Ворошиловский просп., 105А, Ростов-на-Дону",
    location_url: "https://yandex.ru/maps/-/CPXpjEzK",
    user: admin
  },
  {
    name: "Шаурма по-Дубайски",
    address: "Красноармейская ул., 178А, Ростов-на-Дону",
    location_url: "https://yandex.ru/maps/-/CPXpjWz9",
    user: admin
  },
  {
    name: "ФУД Стори",
    address: "Пушкинская ул., 143, Ростов-на-Дону",
    location_url: "https://yandex.ru/maps/-/CPXpnE4c",
    user: admin
  },
  {
    name: "Шаурма Душевная",
    address: "Ворошиловский просп., 105А, Ростов-на-Дону",
    location_url: "https://yandex.ru/maps/-/CPXpnHlG",
    user: admin
  },
  {
    name: "Шаурма 24",
    address: "Коммунистический просп., 10А/2, Западный, Ростов-на-Дону",
    location_url: "https://yandex.ru/maps/-/CPXpr4mM",
    user: admin
  },
  {
    name: "Шаурма Shop",
    address: "2-я Краснодарская ул., 145/9, Ростов-на-Дону",
    location_url: "https://yandex.ru/maps/-/CPXprJkJ",
    user: admin
  },
  {
    name: "Итака Гирос (парк Сказка)",
    address: "парк Сказка, Ростов-на-Дону",
    location_url: "https://yandex.ru/maps/-/CPXprSPW",
    user: admin
  },
  {
    name: "Gyros Club",
    address: "ул. Зорге, 19/162, Ростов-на-Дону",
    location_url: "https://yandex.ru/maps/-/CPXpvNyI",
    user: admin
  },
  {
    name: "Шаурма Маркет (Набережная)",
    address: "Береговая ул., 25Б, Ростов-на-Дону",
    location_url: "https://yandex.ru/maps/-/CPXpv81l",
    user: admin
  },
  {
    name: "Итака Гирос (Береговая)",
    address: "Береговая ул., 12, стр. 1, Ростов-на-Дону",
    location_url: "https://yandex.ru/maps/-/CPXpzY4E",
    user: admin
  },
  {
    name: "Душевная Шаурма",
    address: "Красноармейская ул., 65А, Ростов-на-Дону",
    location_url: "https://yandex.ru/maps/-/CPXpzP6l",
    user: admin
  },
  {
    name: "Стамбул Шаурма",
    address: "ул. Мечникова, 150, Ростов-на-Дону",
    location_url: "https://yandex.ru/maps/-/CPXp748J",
    user: admin
  },
  {
    name: "Хабанеро",
    address: "просп. Соколова, 46, Ростов-на-Дону",
    location_url: "https://yandex.ru/maps/-/CPXp704J",
    user: admin
  },
  {
    name: "Шаурма 24/7",
    address: "просп. 40-летия Победы, 178, Ростов-на-Дону",
    location_url: "https://yandex.ru/maps/-/CPXp7LYy",
    user: admin
  },
  {
    name: "VIP Food Шаурма Свиная",
    address: "Днепропетровская ул., 1/77, Ростов-на-Дону",
    location_url: "https://yandex.ru/maps/-/CPXtAEI5",
    user: admin
  },
  {
    name: "Шаурма-Мангал у Сани",
    address: "Горсоветская ул., 42, микрорайон Берберовка, Ростов-на-Дону",
    location_url: "https://yandex.ru/maps/-/CPXtAZjU",
    user: admin
  },
  {
    name: "Итака Гирос (Нахичевань)",
    address: "площадь Карла Маркса, 9, Нахичевань, Ростов-на-Дону",
    location_url: "https://yandex.ru/maps/-/CPXtACpJ",
    user: admin
  },
  {
    name: "Maestro Шаурма",
    address: "просп. Шолохова, 126, Ростов-на-Дону",
    location_url: "https://yandex.ru/maps/-/CPXtA8kG",
    user: admin
  },
  {
    name: "Царская Шаурма",
    address: "площадь Карла Маркса, 17/1, Нахичевань, Ростов-на-Дону",
    location_url: "https://yandex.ru/maps/-/CPXtEQ5J",
    user: admin
  }
])

puts "Готово! В базе #{Place.count} точек."