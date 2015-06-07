#Written by Aumit Leon --
puts
puts "-----------------------------"
puts "|| Welcome to Tic-Tac-Toe! ||"
puts "-----------------------------"
puts puts 

#Primariy class for the Tic-Tac-Toe game. Provides functions that allow player one to play as 'X,' and player two to play as 'O.' 
class TicTacToe 
	# Initializes several instance variables.
	# Params:
	# +player1+::Player one (will play as X).
	# +player2+::Player two (will play as Y). 
	def initialize(playerOne, playerTwo)
		@@player1 = playerOne
		@@player2 = playerTwo
		@ticTacToe_board = Board.new      	#Creates an object of the Board class, which will serve as our playing board.
		@ticTacToe_board.displayBoard		#Instance variable since it is specific to this use of the class. 
	end

	#Generates gameplay events such as turns, announcement of victories and draws.
	#p1 -- The counter for the number of turns that player one has taken.
	#p2 -- The counter for the number of turns that player two has taken.
	def play
		if @ticTacToe_board.isEmpty?
			puts "Board is empty."
		else 
			puts "Board is not empty."
		end

		puts
		p1_counter = 0
		p2_counter = 0

		#Until the board is not empty, continue to provide turns for player one and two. 
		while !@ticTacToe_board.isFull? do  
			print "#{@@player1}, please enter your move (0-8 positions, going from left to right in each row): "		#Print user input on same line as prompt.
			move = gets.chomp
			puts
			#If the position entered us invalid, ask the user to enter a valid position. 
			while !checkIfValidPosition?(move)
				print "Invlid position. Try another position (0-8 positions, going from left to right in each row): "
				move = gets.chomp
				puts
			end
			#Update the board with player one's game element (X) and the position on the board specified by the player. 
			@ticTacToe_board.updateBoard("X", move)
			@ticTacToe_board.displayBoard				#Display the board after updating it. 
			puts
			p1_counter+=1								#Increment player one's turn counter. 
			if p1_counter >= 2 && checkWinner != nil 	#If after three turns there is a winner, break from the loop. 
				break
			elsif @ticTacToe_board.isFull?				#Break if the board is full.
				break
			end

			#Player two operations.
			print "#{@@player2}, please enter your move (0-8 positions, going from left to right in each row): "
			move = gets.chomp
			puts
			#If given position is not valid, allow the user to enter another position.
			while !checkIfValidPosition?(move)
				print "Invalid position. Try another position (0-8, going from left to right in each row): "
				move = gets.chomp
				puts
			end
			#Update te board once the position given by the user is valid. 
			@ticTacToe_board.updateBoard("O", move)
			@ticTacToe_board.displayBoard			#Display the board aftere updating it. 
			p2_counter+=1							#Increment player two's urn counter.
			if p2_counter >= 3 && checkWinner != nil 		#If after three turn there is a winner, break from the loop.
				break
			end
		end

		#If there is a winner, display the winner, if the loop wasn't broken by a break statement, the board is a full-- draw.
		if checkWinner != nil
			@winner = checkWinner
			puts "Congratulations #{@winner}! You have won."
		else
			puts "No body wins. Draw!"
		end
	end

	# Checks if the given position is valid in terms of our given Board. 
	# Params:
	# +position+:: The given position meant to correspond to a blank cell in the Board. 
	# Returns:
	# True if position is valid, false if otherwise. 
	def checkIfValidPosition?(position)
		@@position__ = position.to_i					#Convert the given position into an integer.
		#If the position does not contian an 'X' or 'O,' or is not in the range [0. 8], the given position is invalid. 
		if @ticTacToe_board.getItem(@@position__) != "X" && @ticTacToe_board.getItem(@@position__) != "O" && @@position__ < 9 && @@position__ > -1
			return true
		else 
			return false
		end
	end

	# Checks to see if there is a winner. 
	# Returns:
	# player1 if three X's are adjacent, player2 if three O's are adjacenet. 
	def checkWinner
		#-------------------------Horizontal Cases-------------------------------------------------------------
		#If each element in this column is equal, and is not empty, we have a winner. 
		#Column 1:
		if @ticTacToe_board.getItem(0) == @ticTacToe_board.getItem(1) && @ticTacToe_board.getItem(0) == @ticTacToe_board.getItem(2) && @ticTacToe_board.getItem(0) != "-"
			if @ticTacToe_board.getItem(1) == "X"
				return @@player1
			else 
				return @@player2
			end
		end
		#Column 2:
		if @ticTacToe_board.getItem(3) == @ticTacToe_board.getItem(4) && @ticTacToe_board.getItem(3) == @ticTacToe_board.getItem(5) && @ticTacToe_board.getItem(3) != "-"
			if @ticTacToe_board.getItem(3) == "X"
				return @@player1
			else 
				return @@player2
			end
		end
		#Column 3:
		if @ticTacToe_board.getItem(6) == @ticTacToe_board.getItem(7) && @ticTacToe_board.getItem(6) == @ticTacToe_board.getItem(8) && @ticTacToe_board.getItem(6) != "-"
			if @ticTacToe_board.getItem(6) == "X"
				return @@player1
			else 
				return @@player2
			end
		end

		#----------------------------Vertical cases--------------------------------------------------------
		#If each element is equal, and not empty, then we have a winner.
		#Checking for adjacency and equivalency within each row.
		#Row 1:
		if @ticTacToe_board.getItem(0) == @ticTacToe_board.getItem(3) && @ticTacToe_board.getItem(0) == @ticTacToe_board.getItem(6) && @ticTacToe_board.getItem(0) != "-"
			if @ticTacToe_board.getItem(0) == "X"
				return @@player1
			else 
				return @@player2
			end
		end
		#Row 2:
		if @ticTacToe_board.getItem(1) == @ticTacToe_board.getItem(4) && @ticTacToe_board.getItem(1) == @ticTacToe_board.getItem(7) && @ticTacToe_board.getItem(1) != "-"
			if @ticTacToe_board.getItem(1) == "X"
				return @@player1
			else 
				return @@player2
			end
		end
		#Row 3:
		if @ticTacToe_board.getItem(2) == @ticTacToe_board.getItem(5) && @ticTacToe_board.getItem(2) == @ticTacToe_board.getItem(8) && @ticTacToe_board.getItem(2) != "-"
			if @ticTacToe_board.getItem(2) == "X"
				return @@player1
			else 
				return @@player2
			end
		end

		#-------------------------------Diagonal cases-----------------------------------------------------
		#Check for equivalency in the diagonals.
		#Left corner to right corner.
		if @ticTacToe_board.getItem(0) == @ticTacToe_board.getItem(4) && @ticTacToe_board.getItem(0) == @ticTacToe_board.getItem(8) && @ticTacToe_board.getItem(0) != "-"
			if @ticTacToe_board.getItem(0) == "X"
				return @@player1
			else 
				return @@player2
			end
		end
		#Right corner to left corner.
		if @ticTacToe_board.getItem(2) == @ticTacToe_board.getItem(4) && @ticTacToe_board.getItem(2) == @ticTacToe_board.getItem(6) && @ticTacToe_board.getItem(2) != "-"
			if @ticTacToe_board.getItem(2) == "X"
				return @@player1
			else 
				return @@player2
			end
		end
	end
end

#Creation of the matrix. The Board is a seperate class so that it is more modular. This board can be modified to fit the needs of users for other projects, and can be expanded or made smaller from its standard 3x3 size. To remain a box, the overall size must remain a perfect square (4. 9. 16. 25...).
class Board 
	#Initialize the class and array that will serve as our matrix/game Board. More elements can be added, and elements an be taken away. 
	# +board_+:: Create the array that will serve as our Tic-Tac-Toe Board. 
	def initialize
		@@board_ = ["-","-","-","-","-","-","-","-","-"]
		@@element_counter = 0
	end

	#Display the board and the game element within each cell. 
	def displayBoard 
		puts " #{@@board_[0]} | #{@@board_[1]} | #{@@board_[2]}"		#Indices of the array correspond to positions in the cell. 
		puts " #{@@board_[3]} | #{@@board_[4]} | #{@@board_[5]}"		#3x3, begins at 0, ends at 8, total of 9 cells. 
		puts " #{@@board_[6]} | #{@@board_[7]} | #{@@board_[8]}"
	end

	#Check if the Board is empty.
	# +i+:: The iterator that will increment as we iterate through the cells of the game Board.
	# Return:
	# True if empty, false if otherwise. 
	def isEmpty?
		i = 0
		#If element at position i is empty (signified by '-'), continue iteration.
		while @@board_[i] == "-"			
			i +=1
		end
		if i < 8 					#If the iterator doesn't make it to 8, then the board was not fully empty.
			return false
		else
			return true
		end
	end

	# Check if the Board is full. 
	# Params:
	# Returns:
	# true if Board is full, false if otherwise. 
	def isFull?
		if @@element_counter == 9
			return true
		else
			return false
		end
	end

	# Update the Board with the given game element and the position. 
	# Params:
	# +element+::The element to be added to the given cell.
	# +position+::The position (cell) on the Board where the given element should be added.  
	def updateBoard(element, position)
		@@xOrY = element
		@@position_ = position
		@@board_[@@position_.to_i] = @@xOrY						#Update the board at the given cell. 
		@@element_counter+=1									#Increment the element counter. 
	end

	# Get the item at the given position. 
	# Params: 
	# +position+::The position within the Board we should visit in order to get that item. 
	# Returns
	# The item in the given cell.
	def getItem (position)
		return @@board_[position.to_i]
	end
end

#Allow users to enter their name and assign them their respective game elements. 
print "Player one, please enter your name (X): "
	player_one = gets.chomp
puts
print "Player two, please enter your name (O): "
	player_two = gets.chomp
puts

#Create an object of the game. 
newGame = TicTacToe.new(player_one, player_two)
#Play the game. 
newGame.play