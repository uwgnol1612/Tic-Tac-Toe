require_relative "game.rb"

tic_tac_toe = Game.new 

until tic_tac_toe.game_over? do
    tic_tac_toe.play_turn
    puts "********************************"
end