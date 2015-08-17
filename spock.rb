require "./playing_odds"

class ThreeWayGames
attr_accessor :rocky_thing, :papery_thing, :scissory_thing, :opponent_move, :player_move, :tally
	def initialize
		@tally = []
		rocky_thing <=> scissory_thing
		scissory_thing <=> papery_thing
		papery_thing <=> rocky_thing
	end

	def game
		moves = [rocky_thing, papery_thing, scissory_thing]
		puts "Pick a roll selection: #{rocky_thing.capitalize}, #{papery_thing.capitalize}, or #{scissory_thing.capitalize}\n"
		@player_move = gets.chomp.downcase.to_str
		@opponent_move = moves.sample
		puts opponent_move
		logic
	end

	def logic
		outcome = (opponent_move <=> player_move)
		 case outcome
		 when 1
		 	puts "You Won!"
		 	won?(:you)
		 when 0
		 	puts "Draw"
		 when -1
		 	puts "You Lost"
		 	won?(:opp)
		 end
		 game
	end
end

class SPL < ThreeWayGames
	include OneAndDone
	def game
		@rocky_thing = 	"spock"
		@papery_thing = "phaser"
		@scissory_thing = "lizard"
		super
	end
end

class RPS < ThreeWayGames
	include TwoOfThree
	def game
		@rocky_thing = "rock"
		@papery_thing = "paper"
		@scissory_thing = "scissors"
		super
	end
end

gambler = RPS.new()
gambler.game