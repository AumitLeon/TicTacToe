puts "-----------------------------"
puts "|| Welcome to Tic-Tac-Toe! ||"
puts "-----------------------------"
puts puts 

#Horizntal win case, 3-4-5 does not declare player one winner. 
class TicTacToe 
	def initialize(playerOne, playerTwo)
		@player1 = playerOne
		@player2 = playerTwo
		@ticTacToe_board = Board.new
		@ticTacToe_board.displayBoard
	end

	def play
		if @ticTacToe_board.isEmpty
			puts "Board is empty."
		else 
			puts "Board is not empty."
		end
		p1=0
		p2=0
		while !@ticTacToe_board.isFull do  
			print "#{@player1} please enter your move (0-8, going from left to right in each row): "
			puts
			move = gets.chomp
			while !checkIfValidPosition(move)
				print "Invlid position. Try another position (0-8, going from left to right in each row): "
				move = gets.chomp
				puts
			end
			@ticTacToe_board.updateBoard("X", move)
			@ticTacToe_board.displayBoard
			puts
			p1+=1
			if p1 >= 2 && checkWinner != nil 				
				break
			end

			#Player two operations
			print "#{@player2} please enter your first move (0-8, going from left to right in each row): "
			puts
			move = gets.chomp
			while !checkIfValidPosition(move)
				print "Invlid position. Try another position (0-8, going from left to right in each row): "
				move = gets.chomp
				puts
			end
			@ticTacToe_board.updateBoard("O", move)
			@ticTacToe_board.displayBoard
			p2+=1
			if p2 >= 3 && checkWinner != nil 
				break
			end
		end
		if checkWinner != nil
			@winner = checkWinner
			puts "Congratulations #{@winner}! You have won."
		else 
			"No body wins. Draw!"
		end
	end

	def checkIfValidPosition(position)
		@position__ = position.to_i
		if @ticTacToe_board.getItem(@position__) != "X" && @ticTacToe_board.getItem(@position__) != "O" && @position__ < 9 && @position__ > -1
			return true
		else 
			return false
		end
	end

	def checkWinner
		#-------------------------Horizontal Cases-------------------------------------------------------------
		if @ticTacToe_board.getItem(0) == @ticTacToe_board.getItem(1) && @ticTacToe_board.getItem(0) == @ticTacToe_board.getItem(2) && @ticTacToe_board.getItem(0) != "-"
			if @ticTacToe_board.getItem(1) == "X"
				return @player1
			else 
				return @player2
			end
		end
		if @ticTacToe_board.getItem(3) == @ticTacToe_board.getItem(4) && @ticTacToe_board.getItem(3) == @ticTacToe_board.getItem(5) && @ticTacToe_board.getItem(3) != "-"
			if @ticTacToe_board.getItem(3) == "X"
				return @player1
			else 
				return @player2
			end
		end
		if @ticTacToe_board.getItem(6) == @ticTacToe_board.getItem(7) && @ticTacToe_board.getItem(6) == @ticTacToe_board.getItem(8) && @ticTacToe_board.getItem(6) != "-"
			if @ticTacToe_board.getItem(6) == "X"
				return @player1
			else 
				return @player2
			end
		end

		#----------------------------Vertical cases--------------------------------------------------------
		if @ticTacToe_board.getItem(0) == @ticTacToe_board.getItem(3) && @ticTacToe_board.getItem(0) == @ticTacToe_board.getItem(6) && @ticTacToe_board.getItem(0) != "-"
			if @ticTacToe_board.getItem(0) == "X"
				return @player1
			else 
				return @player2
			end
		end
		if @ticTacToe_board.getItem(1) == @ticTacToe_board.getItem(4) && @ticTacToe_board.getItem(1) == @ticTacToe_board.getItem(7) && @ticTacToe_board.getItem(1) != "-"
			if @ticTacToe_board.getItem(1) == "X"
				return @player1
			else 
				return @player2
			end
		end
		if @ticTacToe_board.getItem(2) == @ticTacToe_board.getItem(5) && @ticTacToe_board.getItem(2) == @ticTacToe_board.getItem(8) && @ticTacToe_board.getItem(2) != "-"
			if @ticTacToe_board.getItem(2) == "X"
				return @player1
			else 
				return @player2
			end
		end

		#-------------------------------Diagonal cases-----------------------------------------------------
		if @ticTacToe_board.getItem(0) == @ticTacToe_board.getItem(4) && @ticTacToe_board.getItem(0) == @ticTacToe_board.getItem(8) && @ticTacToe_board.getItem(0) != "-"
			if @ticTacToe_board.getItem(0) == "X"
				return @player1
			else 
				return @player2
			end
		end
		if @ticTacToe_board.getItem(2) == @ticTacToe_board.getItem(4) && @ticTacToe_board.getItem(2) == @ticTacToe_board.getItem(6) && @ticTacToe_board.getItem(2) != "-"
			if @ticTacToe_board.getItem(2) == "X"
				return @player1
			else 
				return @player2
			end
		end
	end
end

#Creation of the matrix. The Board is a seperate class so that it is 
#more modular. This board can be modified to fit the needs of 
class Board
	def initialize
		@board_ = ["-","-","-","-","-","-","-","-","-"]
	end
	def displayBoard 
		puts "#{@board_[0]} | #{@board_[1]} | #{@board_[2]}"
		puts "#{@board_[3]} | #{@board_[4]} | #{@board_[5]}"
		puts "#{@board_[6]} | #{@board_[7]} | #{@board_[8]}"
	end

	def isEmpty
		i = 0
		while @board_[i] == "-"
			i +=1
		end
		if i < 8
			return false
		else
			return true
		end
	end

	def isFull
		m = 0
		while @board_[m] != "-"
			m +=1
		end
		if m <= 9
			return false
		else
			return true
		end
	end

	def updateBoard(element, position)
		f=0
		if f < 9
			@xOrY = element
			@position_ = position
			@board_[@position_.to_i] = @xOrY
			f+=1
		else
			puts "Board is full."
		end
	end

	def getItem (position)
		return @board_[position.to_i]
	end
end

print "Player one, please enter your name (X): "
	player_one = gets.chomp
puts
print "Player two, please enter your name (O): "
	player_two = gets.chomp
puts
newGame = TicTacToe.new(player_one, player_two)
newGame.play