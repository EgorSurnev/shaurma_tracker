# Создаем тестового пользователя
admin = User.find_or_create_by!(email: 'admin@shaurma.ru') do |u|
  u.password = '123456'
end

puts "Создаю шаурмечные Ростова..."

Place.create!([
                {
                  name: "Шаурма на ЦГБ",
                  address: "ул. Фурмановская / Ворошиловский",
                  location_url: "https://yandex.ru/maps/-/CDu6Y-Y3",
                  user: admin
                },
                {
                  name: "Ялла (Шаурма)",
                  address: "пл. Театральная, 3",
                  location_url: "https://yandex.ru/maps/-/CDu6YCnS",
                  user: admin
                },
                {
                  name: "Вкус Востока",
                  address: "пр. Буденновский, 12",
                  location_url: "https://yandex.ru/maps/-/CDu6YH~K",
                  user: admin
                }
              ])

puts "Готово! Теперь в базе #{Place.count} точек."