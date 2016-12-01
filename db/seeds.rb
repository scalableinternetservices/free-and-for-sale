# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create([{name: 'Furniture'}, {name: 'Electronics'}, {name: 'Books'}, {name: 'Clothes'}, {name: 'Others'}])
# User.create([email: 'a@a.a'], [email: 'b@b.b'], [email: 'c@c.c'], [email: 'd@d.d'], [email: 'e@e.e'])

begin
  Exist.create!(mutex: 1)
rescue ActiveRecord::RecordInvalid
  exit
rescue ActiveRecord::RecordNotUnique
  exit
end


700.times.with_index do |number|
  @user = User.create! :email => "#{number}@gmail.com", :password => 'topsecret'
  @shopping_cart = ShoppingCart.create! :user_id => @user.id
  @store = Store.create! :user_id => @user.id
end

File.open("db/image_list.txt", "r").each_line.with_index do |line, line_number|
  @user = User.where(email: "#{line_number}@gmail.com").first
  @category_id = line_number%5 + 1
  @product = Product.create! :name => "product #{line_number}", :description => 'this is a test image', 
  :price => 100, :image_url => "#{line}", :user_id => @user.id, :category_id => @category_id, :store_id => @user.store.id  
end
