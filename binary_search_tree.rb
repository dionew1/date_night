require 'pry'
require './node'

class BinarySearchTree

  attr_accessor :root

  def initialize
    @root = nil
    @depth = 0
  end

  def insert_node(score, movie)
    new_node = Node.new(score, movie)
    if root == nil
      @root = new_node
    else
      position_node(new_node)
    end
  end

  def position_node(passed_new_node, current_node = @root)
    if passed_new_node == current_node
    elsif current_node.score < passed_new_node.score
      create_right_node(passed_new_node, current_node)
    else
      create_left_node(passed_new_node, current_node)
    end
  end

  def create_right_node(given_new_node, current_right_node)
    if current_right_node.right_node == nil
      current_right_node.right_node = given_new_node
    else
      # Decide whether to go right or left of the current right node
      position_node(given_new_node, current_right_node)
    end
  end

  def create_left_node(received_new_node, current_left_node)
    if current_left_node.left_node == nil
      current_left_node.left_node = received_new_node
    else
      # Decide whether to go right or left of the current left node
      position_node(received_new_node, current_left_node)
    end
  end

end
