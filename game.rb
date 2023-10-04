require './player'
require './question'

class Game
  attr_accessor :player1, :player2, :question
  
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @question = Question.new
    @players = [@player1, @player2]
    @player_turn = 0
  end

  def start_game
    while @player1.lives > 0 && @player2.lives > 0
      turn
      if @player1.lives == 0
        break
      end
      turn
      if @player2.lives == 0
        break
      end
    end
    end_game
  end

  def turn
    puts "----- NEW TURN -----"
    question = Question.new
    puts "#{@players[@player_turn].name}: #{question.prompt}"
    question.player_answer = gets.chomp.to_i
    if question.check_answer
      puts "#{@players[@player_turn].name}: YES! You are correct."
      puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
    else
      @players[@player_turn].lose_life
      puts "#{@players[@player_turn].name}: Seriously? No!"
      puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
    end
    if @player_turn == 0
      @player_turn = 1
    else
      @player_turn = 0
    end
  end

  def winner
    if @player1.lives > @player2.lives
      puts "#{@player1.name} wins with a score of #{@player1.lives}/3"
    else
      puts "#{@player2.name} wins with a score of #{@player2.lives}/3"
    end
  end

  def end_game
    winner
    puts "----- GAME OVER -----"
    puts "Goodbye!"
  end
end