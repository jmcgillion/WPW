# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the
# db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(email: 'admin@gmail.com',
                   password: '123456789',
                   password_confirmation: '123456789',
                   confirmation_token: nil,
                   confirmed_at: Time.now)

work = Category.create(name: 'Work')
play = Category.create(name: 'Play')
well = Category.create(name: 'Well-Being')
user.categories.create(name: 'Personal', ancestry: work.id)
user.categories.create(name: 'Team', ancestry: work.id)
user.categories.create(name: 'To do', ancestry: work.id)
user.categories.create(name: 'Literature', ancestry: play.id)
user.categories.create(name: 'Media', ancestry: play.id)
user.categories.create(name: 'Sports', ancestry: play.id)
user.categories.create(name: 'Education', ancestry: well.id)
user.categories.create(name: 'Fitness', ancestry: well.id)
user.categories.create(name: 'Nutrition', ancestry: well.id)
user.notes.create(name: 'note1 name', body: 'note 1 body', category_id: work.id)
user.notes.create(name: 'note2 name', body: 'note 2 body', category_id: play.id)
user.notes.create(name: 'note3 name', body: 'note 3 body', category_id: well.id)
user.notes.create(name: 'note4 name', body: 'note 4 body')
user.notes.create(name: 'note5 name', body: 'note 5 body')
user.notes.create(name: 'note6 name', body: 'note 6 body')
user.notes.create(name: 'note7 name', body: 'note 7 body')
user.notes.create(name: 'note8 name', body: 'note 8 body')
user.notes.create(name: 'note9 name', body: 'note 9 body')
