require 'pry'
require './lib/node'

class BinarySearchTree

  attr_accessor :root, :depth_node

  def initialize
    @root = nil
    @depth_node = 0
  end

  def insert_node(score, movie)
  #given score and node should create a node in the tree
    new_node = Node.new(score, movie)
    if root == nil
      @root = new_node
      new_node.depth
    else
      position_node(new_node)
      new_node.depth
    end
  end

  def position_node(passed_new_node, current_node = @root)
  #given new node should position the node into the tree
    if passed_new_node.score == current_node.score
      return
    elsif current_node.score < passed_new_node.score
      passed_new_node.depth += 1
      create_right_node(passed_new_node, current_node)
    else
      passed_new_node.depth += 1
      create_left_node(passed_new_node, current_node)
    end
  end

  def create_right_node(given_new_node, current_right_node)
  #given that new node is greater than previous node should position node right
    if current_right_node.right_node == nil
      current_right_node.right_node = given_new_node
    else
      # Decide whether to go right or left of the current right node
      position_node(given_new_node, current_right_node.right_node)
    end
  end

  def create_left_node(received_new_node, current_left_node)
  #given that new node is less than previous node should position node left
    if current_left_node.left_node == nil
      current_left_node.left_node = received_new_node
    else
      # Decide whether to go right or left of the current left node
      position_node(received_new_node, current_left_node.left_node)
    end
  end

  def depth_of(score)
    if 

    else
      nil
    end
  end


end
