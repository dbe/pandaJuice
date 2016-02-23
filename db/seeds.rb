# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#


### Create Properties ###
nic3 = Property.create(name: 'nicotine', value: '3 mg')
nic6 = Property.create(name: 'nicotine', value: '6 mg')
size10 = Property.create(name: 'volume', value: '10 mL')
size30 = Property.create(name: 'volume', value: '30 mL')

### Create S+C^2 Item and Variants###
item = Item.create(name: 'Vape Wild (S+C)^2', description: 'A smooth strawberries and cream flavor from Vape Wild')

sc_3_10 = item.variants.create(sku: "#{item.name}-#{nic3.value}-#{size10.value}")
sc_3_10.properties << nic3
sc_3_10.properties << size10

sc_3_30 = item.variants.create(sku: "#{item.name}-#{nic3.value}-#{size30.value}")
sc_3_30.properties << nic3
sc_3_30.properties << size30

sc_6_30 = item.variants.create(sku: "#{item.name}-#{nic6.value}-#{size30.value}")
sc_6_30.properties << nic6
sc_6_30.properties << size30


### Create Smurf Cake Item and Variants ###
item = Item.create(name: 'Vape Wild Smurf Cake', description: 'A great creamy blueberry flavor from Vape Wild')

sm_3_10 = item.variants.create(sku: "#{item.name}-#{nic3.value}-#{size10.value}")
sm_3_10.properties << nic3
sm_3_10.properties << size10

sm_3_30 = item.variants.create(sku: "#{item.name}-#{nic3.value}-#{size30.value}")
sm_3_30.properties << nic3
sm_3_30.properties << size30

sm_6_30 = item.variants.create(sku: "#{item.name}-#{nic6.value}-#{size30.value}")
sm_6_30.properties << nic6
sm_6_30.properties << size30


### Create Sale ###
Sale.create(start: DateTime.now() - 2.days, finish: DateTime.now() - 1.day, :name => "Old Sale", :current => false)
sale = Sale.create(start: DateTime.now(), finish: DateTime.now() + 1.day, :name => "Vape Wild Pre-Steeped Collection", :current => true)

sv1 = sale.sale_variants.create(:total_quantity => 30, :quantity_left => 25, :cost => 12.99, :variant => sc_3_10)
sv2 = sale.sale_variants.create(:total_quantity => 5, :quantity_left => 0, :cost => 7.00, :variant => sc_3_30)
sv3 = sale.sale_variants.create(:total_quantity => 25, :quantity_left => 25, :cost => 13.00, :variant => sc_6_30)

sv4 = sale.sale_variants.create(:total_quantity => 31, :quantity_left => 26, :cost => 12.99, :variant => sm_3_10)
sv5 = sale.sale_variants.create(:total_quantity => 6, :quantity_left => 0, :cost => 7.00, :variant => sm_3_30)
sv6 = sale.sale_variants.create(:total_quantity => 26, :quantity_left => 26, :cost => 13.00, :variant => sm_6_30)

user = User.create(email: "admin@test.com", password: "password")
user.cart.line_items.create(:sale_variant => sv1, :quantity => 1, :actual_unit_price => 12.50)
