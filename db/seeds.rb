# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# account = Account.create! username:'admin',password:'a123456'
account = Account.create! username:'gubei',password:'gubei123'
if account
	p "账号建立成功"
end