module OneAndDone
	def won?(winner)
		winner == :you ? abort("You are the winner! Huzzah and Godspeed!!!\n") : abort("Damn. Life's short. Esp when you lose.\n")
	end
end

module TwoOfThree
	def won?(winner)
		tally << winner
		abort("You are the winner! Huzzah and Godspeed!!!\n") if tally.count(:you) >= 2
		abort("Damn. Life's short. Esp when you lose.\n") if tally.count(:opp) >= 2
	end
end