class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { Array.new }
    @name1 = name1 
    @name2 = name2
    place_stones
  end

  def place_stones
    (0...6).each do |ind| 
      @cups[ind] = [:stone, :stone, :stone, :stone]
    end 
    (7...13).each do |ind|
      @cups[ind] = [:stone, :stone, :stone, :stone]
    end 
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos >= 13
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    current = @cups[start_pos] 
    @cups[start_pos] = []
    
   while !current.empty?
      start_pos += 1 
      start_pos%14 if start_pos > 13 
      if start_pos == 6 
        @cups[6] << current.pop if current_player_name == @name1 
      elsif start_pos == 13 
        @cups[13] << current.pop if current_player_name == @name2 
      else 
        @cups[start_pos] << current.pop
      end 
    end 
    render 
    next_turn(start_pos)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt 
    elsif @cups[ending_cup_idx].length == 1
      :switch 
    end 
    
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}"      
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0...6].all? { |cup| cup.length == 0} || @cups[7...13].all? { |cup| cup.length == 0}
  end

  def winner
    if @cups[6].length > @cups[13].length 
      return @name1 
    end 
    if @cups[6].length < @cups[13].length 
      return @name2 
    end 
    if @cups[6].length == @cups[13].length
      :draw 
    end 
  end
end
