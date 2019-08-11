#!/usr/bin/env ruby
# frozen_string_literal: true

root = File.expand_path(__dir__)
require "#{root}/lib/tic_tac_toe.rb"

puts 'Welcome to tic tac toe'
puts "Please enter player 1's name"
p1 = TicTacToe::Player.new(color: 'X', name: $stdin.gets.chomp)
puts "Please enter player 2's name"
p2 = TicTacToe::Player.new(color: 'O', name: $stdin.gets.chomp)
players = [p1, p2]
TicTacToe::Game.new(players).play
