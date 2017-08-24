require './lib/node'

class BinarySearchTree

  attr_reader :root

  def initialize
    @root = nil
    @sorted_tree = []
    @insert_count = 0
  end

  def insert_node(score, movie)
  #given score and node should create a node in the tree
    new_node = Node.new(score, movie)
    if root == nil
      @insert_count += 1
      @root = new_node
    else
      position_node(new_node)
    end
    new_node.depth
  end

  def position_node(passed_new_node, current_node = @root)
  #given new node should position the node into the tree
  #require'pry';binding.pry
    if passed_new_node.score == current_node.score
      return
    elsif current_node.score < passed_new_node.score
      create_right_node(passed_new_node, current_node)
    else
      create_left_node(passed_new_node, current_node)
    end
    passed_new_node.depth += 1
    current_node.child_count += passed_new_node.child_count
  end

  def create_right_node(given_new_node, current_right_node)
  #given that new node is greater than previous node should position node right
    if current_right_node.right_node == nil
      @insert_count += 1
      current_right_node.child_count += 1
      current_right_node.right_node = given_new_node
    else
      # Decide whether to go right or left of the current right node
      position_node(given_new_node, current_right_node.right_node)
    end
  end

  def create_left_node(received_new_node, current_left_node)
  #given that new node is less than previous node should position node left
    if current_left_node.left_node == nil
      @insert_count += 1
      current_left_node.child_count += 1
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

  def min(current_node = @root)
    if current_node == nil
      nil
    elsif current_node.left_node == nil
      {current_node.movie => current_node.score}
    else
      min(current_node.left_node)
    end
  end

  def sort(current_node = @root)
    if @root == nil
      return @sorted_tree
    end

    if current_node.left_node != nil
      sort(current_node.left_node)
    end

    @sorted_tree << {current_node.movie => current_node.score}

    if current_node.right_node != nil
      sort_right(current_node.right_node)
    end
    @sorted_tree
  end

  def sort_right(current_node = @root.right_node)
    if current_node.left_node != nil
      sort(current_node.left_node)
    end
    @sorted_tree << {current_node.movie => current_node.score}

    if current_node.right_node != nil
      sort_right(current_node.right_node)
    end
    @sorted_tree
  end

  def load_file(file)
    File.open(file).each do |pair|
      pair_array = pair.split(", ")
      score = pair_array[0].to_i
      insert_node(score, pair_array[1])
    end
    @insert_count
  end

  def health(depth, current_node = @root)
    health_array = []
    current_children = current_node.child_count + 1
    if depth == current_node.depth
      health_array << [current_node.score, current_children,
      (current_children/@insert_count*100).floor]
      return health_array
    elsif current_node.left_node != nil
      health(depth, current_node.left_node)
    end
    if current_node.right_node != nil
      health(depth, current_node.right_node)
    end
    health_array
  end

end
