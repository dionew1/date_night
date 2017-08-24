require './lib/node'

class BinarySearchTree

  attr_accessor :root,

  def initialize
    @root = nil
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


  def include?(score, current_node = @root)
    #compare score to current_node
    if current_node == nil
      false
    elsif score == current_node.score
      true
    elsif score > current_node.score
      include?(score, current_node.right_node)
    else
      include?(score, current_node.left_node)
    end
  end



  def depth_of(score, current_node = @root)
    #compare score to current_node
    if current_node == nil
      nil
    elsif score == current_node.score
      current_node.depth
    elsif score > current_node.score
      depth_of(score, current_node.right_node)
    else
      depth_of(score, current_node.left_node)
    end
  end


  def max(current_node = @root)
    if current_node == nil
      nil
    elsif current_node.right_node == nil
      {current_node.movie => current_node.score}
    else
      max(current_node.right_node)
    end
  end
#
  def min(current_node = @root)
    if current_node == nil
      nil
    elsif current_node.left_node == nil
      {current_node.movie => current_node.score}
    else
      min(current_node.left_node)
    end
  end

  def sort(current_node)

  end
#
  #def load
#
  #end
#
  #def health
#
  #end

end
