deck = Deck.create(name: "deck1")
user = User.create(username: 'ryan1', email: 'testasdf@tasdfest.com', password_hash: 'blah')
game = Game.create(user_id: user.id, deck_id: deck.id)
card = Card.create(question: 'what time is it?', answer: 'lunch time')
guess = Guess.create(game_id: game.id, card_id: card.id)


