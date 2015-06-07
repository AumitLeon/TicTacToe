Aumit Leon ----------- Tic-Tac-Toe Game (Ruby) 

The solution for this Tic-Tac-Toe game was written with Ruby 2.1.6, and the HTML documentation (can be found within the directory in a folder called "doc") was done with RubyDocumentation. 

The solution for this game is broken down into two classes, TicTacToe (which contains the methods for the game itself) and Board (which contians methods specifically for the Board. I seperated these two classes so that the Board class could be more modular-- if I or someone were make another game that required a similar square shaped board, they could use the Board class provided in this source code. The Board utilized for this game is 3x3, and so a single array is used, but for larger square based boards the size of the array need only be a perfect square (a multidimensional array can also be used). 

The TicTacToe class has functions that are specific to its implementation, but one could inherit this class in order to make their own version of the game. Certain variables, such as those indexing player names, are made to be class variables, as the game is meant for two players and should be turn based. Any class that inherits this class should have the same standards. The TicTacToe class has a "has-a" relationship with the Board class, since the Tic-Tac-Toe game has a board. Thus, the form of inheritence used here is known as containment. Classes that may inherit the TicTacToe class would not inherit this Board as well, since I have made it an instance variable-- this allows decendant classes to specify their own game board if they so choose. 

The main challenges were in how to link positions on the board to actual positions in the Array, which I solved using perfect-square logic. Because the size of the board is so small in this case, a single array was all that was necessary. The winning cases are seperated in the code, and account for all the different possible ways one could win the game. 

In order to run this program, one must have the Ruby language installed on their machine. They should navigate to the directory "TicTacToe" from their command line, and type the command "ruby ticTacToe.rb" to run the game. Their is an in-game menu after the initial game that allows you to exit the game, or start another one. 

_____________________________________________________________________________________________________________________________________
********************************************Sample Game******************************************************************************

-----------------------------
|| Welcome to Tic-Tac-Toe! ||
-----------------------------


Player one, please enter your name (X): Aumit

Player two, please enter your name (O): Bill

 - | - | -
 - | - | -
 - | - | -

Board is empty.

Aumit, please enter your move (0-8 positions, going from left to right in each row): 0

 X | - | -
 - | - | -
 - | - | -

Bill, please enter your move (0-8 positions, going from left to right in each row): 2

 X | - | O
 - | - | -
 - | - | -

Aumit, please enter your move (0-8 positions, going from left to right in each row): 1

 X | X | O
 - | - | -
 - | - | -

Bill, please enter your move (0-8 positions, going from left to right in each row): 2

Invalid position. Try another position (0-8, going from left to right in each row): 8

 X | X | O
 - | - | -
 - | - | O

Aumit, please enter your move (0-8 positions, going from left to right in each row): 3

 X | X | O
 X | - | -
 - | - | O

Bill, please enter your move (0-8 positions, going from left to right in each row): 5

 X | X | O
 X | - | O
 - | - | O

Congratulations Bill! You have won.

Would you like to start a new game? Type 'yes' or 'no': NOOOO

Sorry, I couldn't understand that. Would you like to start a new game? Please type 'yes' or 'no': 12345

Sorry, I couldn't understand that. Would you like to start a new game? Please type 'yes' or 'no': YESS

Sorry, I couldn't understand that. Would you like to start a new game? Please type 'yes' or 'no': Yes

 - | - | -
 - | - | -
 - | - | -

Board is empty.

Aumit, please enter your move (0-8 positions, going from left to right in each row): 0

 X | - | -
 - | - | -
 - | - | -

Bill, please enter your move (0-8 positions, going from left to right in each row): 6

 X | - | -
 - | - | -
 O | - | -

Aumit, please enter your move (0-8 positions, going from left to right in each row): 4

 X | - | -
 - | X | -
 O | - | -

Bill, please enter your move (0-8 positions, going from left to right in each row): 2

 X | - | O
 - | X | -
 O | - | -

Aumit, please enter your move (0-8 positions, going from left to right in each row): 8

 X | - | O
 - | X | -
 O | - | X

Congratulations Aumit! You have won.

Would you like to start a new game? Type 'yes' or 'no': YeS

 - | - | -
 - | - | -
 - | - | -

Board is empty.

Aumit, please enter your move (0-8 positions, going from left to right in each row): 4

 - | - | -
 - | X | -
 - | - | -

Bill, please enter your move (0-8 positions, going from left to right in each row): 8

 - | - | -
 - | X | -
 - | - | O

Aumit, please enter your move (0-8 positions, going from left to right in each row): 0

 X | - | -
 - | X | -
 - | - | O

Bill, please enter your move (0-8 positions, going from left to right in each row): 6

 X | - | -
 - | X | -
 O | - | O

Aumit, please enter your move (0-8 positions, going from left to right in each row): 7

 X | - | -
 - | X | -
 O | X | O

Bill, please enter your move (0-8 positions, going from left to right in each row): 1

 X | O | -
 - | X | -
 O | X | O

Aumit, please enter your move (0-8 positions, going from left to right in each row): 4

Invlid position. Try another position (0-8 positions, going from left to right in each row): 3

 X | O | -
 X | X | -
 O | X | O

Bill, please enter your move (0-8 positions, going from left to right in each row): 5

 X | O | -
 X | X | O
 O | X | O

Aumit, please enter your move (0-8 positions, going from left to right in each row): 2

 X | O | X
 X | X | O
 O | X | O

No body wins. Draw!

Would you like to start a new game? Type 'yes' or 'no': no


