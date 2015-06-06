puts "Welcome to Tic-Tac-Toe!"
puts "------------------------"

class TicTacToe 
	#@@winningCombos = 
	def initialize(playerOne, playerTwo)
		@player1 = playerOne
		@player2 = playerTwo
	end

	def play
		3.times {puts "-- | -- | --"}
		counter = 0
		puts " " 
		moves
	end


	def moves
		puts "#{@player1}, please enter your first move: (1-9, left to right): "
			move = gets.chomp
			move.to_i
		puts "#{@player2}, please enter your first move: (1-9, left to right): "
			move = gets.chomp
			move.to_i
		while counter < 8
			puts "#{@player1} Enter your next move: "
			move = gets.chomp
			move.to_i
			if move == 0
				board_[0][0] = X
			elsif move == 1
				board_[1][0] = X
			end
			counter +=1
		end
	end

	private 
		@@board_ = [[0,1,2], [0, 1, 2], [0, 1, 2]]			#matrix
end

puts "Player one, please enter your name (X): "
	player_one = gets.chomp
puts "Player two, please enter your name (O): "
	player_two = gets.chomp
newGame = TicTacToe.new(player_one, player_two)
newGame.play

