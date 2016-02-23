# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

Sale.create(start: DateTime.now() - 2.days, finish: DateTime.now() - 1.day, :name => "Old Sale", :current => false)
sale = Sale.create(start: DateTime.now(), finish: DateTime.now() + 1.day, :name => "Vape Wild Pre-Steeped Collection", :current => true)

item = Item.create(name: 'Vape Wild (S+C)^2', description: 'A smooth strawberries and cream flavor from Vape Wild')

####Item.create(name: 'Vape Wild Smurf Cake', description: 'A great creamy blueberry flavor from Vape Wild')

nic3 = item.item_options.create(name: 'nicotine', value: '3 mg')
nic6 = item.item_options.create(name: 'nicotine', value: '6 mg')
size10 = item.item_options.create(name: 'volume', value: '10 mL')
size30 = item.item_options.create(name: 'volume', value: '30 mL')

sc_3_10 = item.variants.create(sku: "#{item.name}-#{nic3.value}-#{size10.value}")
sc_3_10.item_options << nic3
sc_3_10.item_options << size10

sc_3_30 = item.variants.create(sku: "#{item.name}-#{nic3.value}-#{size30.value}")
sc_3_30.item_options << nic3
sc_3_30.item_options << size30

sc_6_30 = item.variants.create(sku: "#{item.name}-#{nic6.value}-#{size30.value}")
sc_6_30.item_options << nic6
sc_6_30.item_options << size30


sv1 = sale.sale_variants.create(:total_quantity => 30, :quantity_left => 25, :cost => 12.99, :variant => sc_3_10)
sv2 = sale.sale_variants.create(:total_quantity => 5, :quantity_left => 0, :cost => 7.00, :variant => sc_3_30)
sv3 = sale.sale_variants.create(:total_quantity => 25, :quantity_left => 25, :cost => 13.00, :variant => sc_6_30)

user = User.create(email: "admin@test.com", password: "password")
user.cart.line_items.create(:sale_variant => sv1, :quantity => 1, :actual_unit_price => 12.50)
