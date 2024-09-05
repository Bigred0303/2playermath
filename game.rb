class Game
    def initialize(player1, player2)
      @player1 = player1
      @player2 = player2
      @current_player = player1
    end
  
    def switch_turns
      @current_player = @current_player == @player1 ? @player2 : @player1
    end
  
    def ask_question
      question = Question.new
      puts "#{@current_player.name}: #{question.question}"
      print "> "
      player_answer = gets.chomp.to_i
  
      if question.correct_answer?(player_answer)
        puts "Correct!"
      else
        puts "Wrong!"
        @current_player.lose_life
      end
    end
  
    def display_scores
      puts "#{@player1.name}: #{@player1.lives}/3 lives"
      puts "#{@player2.name}: #{@player2.lives}/3 lives"
    end
  
    def game_over?
      !@player1.alive? || !@player2.alive?
    end
  
    def winner
      @player1.alive? ? @player1 : @player2
    end
  
    def play
      until game_over?
        ask_question
        display_scores
        switch_turns
      end
  
      puts "#{winner.name} wins with a score of #{winner.lives}/3"
      puts "Game Over!"
    end
  end