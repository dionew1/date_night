class Node

attr_accessor :right_node, :left_node, :depth, :child_count
attr_reader :score, :movie

  def initialize(score, movie_title, depth = 0)
    @right_node = nil
    @left_node = nil
    @movie = movie_title
    @score = score
    @depth = 0
    @child_count = 0
  end



end
