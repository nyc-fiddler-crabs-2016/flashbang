# deck = Deck.create(name: "deck1")
# user = User.create(username: 'ryan1', email: 'testasdf@tasdfest.com', password_hash: 'blah')
# game = Game.create(user_id: user.id, deck_id: deck.id)
# card = Card.create(question: 'what time is it?', answer: 'lunch time')
# guess = Guess.create(game_id: game.id, card_id: card.id)


# user_amount = 4
deck_names = ['HTML FUN', 'Web word']


# user_amount.times do
#   user = User.new(username: Faker::Internet.user_name, email: Faker::Internet.free_email, password_hash: Faker::Internet.password )
#   user.password = Faker::Internet.password
#   user.save
# end


deck_names.each do |name|
  Deck.create(name: name)
end

# users = User.all
# user_ids = users.map {|user| user.id}

decks = Deck.all
deck_ids = decks.map {|deck| deck.id}

#Game.create(user_id: user_ids.sample, deck_id: deck_ids.sample)



Card.create(question:'To create a second name for the variable or method.
', answer:'alias')
Card.create(question:'A command that appends two or more objects together.
', answer:'and')

Card.create(question:'Designates code that must be run unconditionally at the beginning of the program before any other.
', answer:'BEGIN')
Card.create(question:'Gives an unconditional termination to a code block, and is usually placed with an argument.
', answer:'break')
Card.create(question:'Opens a class definition block, which can later be reopened and added to with variables and even functions.
', answer:'class')
Card.create(question:'Used to define a function.
', answer:'def')
Card.create(question:'A boolean logic function that asks whether or not a targeted expression refers to anything recognizable in Ruby; i.e. literal object, local variable that has been initialized, method name visible from the current scope, etc.
', answer:'defined?')
Card.create(question:'Gives an "otherwise" within a function, if-statement, or for-loop, i.e. if cats = cute, puts "Yay!" else puts "Oh, a cat."
', answer:'else')
Card.create(question:'Much like else, but has a higher precedence, and is usually paired with terms.
', answer:'elsif')
Card.create(question:'A loop constructor; used in for-loops.
', answer:'for')


cards1_5 = Card.all[0..4]
cards6_10 = Card.all[5..9]
Deck.first.cards << cards1_5
Deck.last.cards << cards6_10


