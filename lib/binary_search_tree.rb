require 'pry'
require './lib/node'

class BinarySearchTree

  attr_accessor :root

  def initialize
    @root = nil
    @depth_counter = 0
  end

  def insert_node(score, movie)
  #given score and node should create a node in the tree
    new_node = Node.new(score, movie)
    if root == nil
      @root = new_node
    else
      position_node(new_node)
    end
  end

  def position_node(passed_new_node, current_node = @root)
  #given new node should position the node into the tree
    if passed_new_node == current_node
      return
    elsif current_node.score < passed_new_node.score
      @depth_counter += 1
      create_right_node(passed_new_node, current_node)
    else
      @depth_counter += 1
      create_left_node(passed_new_node, current_node)
    end
  end

  def create_right_node(given_new_node, current_right_node)
  #given that new node is greater than previous node should position node right
  track_depth = given_new_node.depth = @depth_counter
  @depth_counter = 0 #resets depth_counter
    if current_right_node.right_node == nil
      current_right_node.right_node = given_new_node
      track_depth
    else
      # Decide whether to go right or left of the current right node
      position_node(given_new_node, current_right_node)
      track_depth
    end
  end

  def create_left_node(received_new_node, current_left_node)
  #given that new node is less than previous node should position node left
    if current_left_node.left_node == nil
      current_left_node.left_node = received_new_node
    else
      # Decide whether to go right or left of the current left node
      position_node(received_new_node, current_left_node)
    end
  end

  def depth_of(score)

  end


end
