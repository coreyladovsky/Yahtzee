require_relative "die"
require_relative "board"
require_relative 'human_player'

class Game

  def initialize(players)
    @dice = { "a" => Die.new,
              "b" => Die.new,
              "c" => Die.new,
              "d" => Die.new,
              "e" => Die.new }
    @players = players
    @current_player = @players[0]
  end

  def switch_players!
    @players.rotate!
    @current_player = @players[0]
  end

  def play
    welcome_message
    while !game_over
      take_turn
      switch_players!
    end

  end

  def show_score_card
    puts "Your score card looks like this"
    @current_player.board.display
  end

  def take_turn
    puts "It's #{@current_player.name} turn"
    show_score_card
    puts "Here are the results of your first die roll"
    roll_die(@dice.values)
    display_all_die
    dice_to_keep = @current_player.get_dice
    show_score_card
    puts "Here are the results of your second roll"
    dice_to_roll = @dice.keys - dice_to_keep
    roll_die(dice_to_roll.map! { |key| @dice[key] })
    display_all_die
    dice_to_keep = @current_player.get_dice
    puts "Your score card looks like this"
    @current_player.board.display
    puts "Here are the results of your third roll"
    dice_to_roll = @dice.keys - dice_to_keep
    roll_die(dice_to_roll.map! { |key| @dice[key] })
    display_all_die
    @current_player.select_move
  end

  def roll_die(dice)
    dice.each(&:roll)
  end

  def display_all_die
    @dice.each do |key, die|
      puts "#{key} | #{die.value}"
    end
  end

  def game_over
    @players.all?(&:game_over?)
  end

  def welcome_message
    puts "Hello and Welcome to Yatzee"
  end


end


if $PROGRAM_NAME == __FILE__
  Game.new([HumanPlayer.new("Corey")]).play
end
