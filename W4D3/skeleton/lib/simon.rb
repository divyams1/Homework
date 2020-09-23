class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false 
    @seq = []

  end

  def play
    until @game_over
      take_turn
    end 
    game_over_message if @game_over
    reset_game if @game_over
  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message if !@game_over
    @sequence_length += 1 if !@game_over
  end

  def show_sequence
    add_random_color
    @seq.each do |color| 
      puts color 
      sleep(1)
      system("clear")
      sleep(.5)
    end 
  end

  def require_sequence
    p "Add a color that matches the first letter of the color shown"
    @seq.each do |color| 
      guess = gets.chomp
      if guess[0] != color[0] 
        @game_over = true 
        break 
      end
    end 

  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
     p "Round Success"
  end

  def game_over_message
    p "Game Over!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false 
    @seq = []
  end
end
a = Simon.new 
a.play