require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'
require './lib/binary_search_tree'

class BinarySearchTreeTest < Minitest::Test

=begin

  def test_binary_search_tree_class_exists
    tree = BinarySearchTree.new

    assert_instance_of BinarySearchTree, tree
  end

  def test_node_class_exists
    node = Node.new(61, "Cars")

    assert_instance_of Node, node
  end

  def test_insert_root_exists
   tree = BinarySearchTree.new

   assert_nil tree.root

   tree.insert_node(50, "The Rescuers")

   assert_instance_of Node, tree.root
   assert_equal 50, tree.root.score
   assert_equal "The Rescuers", tree.root.movie
  end

  def test_create_left_node_exists
    tree = BinarySearchTree.new
    tree.insert_node(50, 'The Rescuers')

    assert_nil tree.root.left_node

    tree.insert_node(25, 'Anastasia')

    assert_instance_of Node, tree.root.left_node
    assert_equal 25, tree.root.left_node.score
    assert_equal  'Anastasia', tree.root.left_node.movie
  end

  def test_create_right_node_exists
    tree = BinarySearchTree.new
    tree.insert_node(50, 'The Rescuers')

    assert_nil tree.root.right_node

    tree.insert_node(76, 'Aladdin')

    assert_instance_of Node, tree.root.right_node
    assert_equal 76, tree.root.right_node.score
    assert_equal 'Aladdin', tree.root.right_node.movie
  end

  def test_depth
    tree = BinarySearchTree.new
    depth = tree.insert_node(50, 'The Rescuers')
    depth1 = tree.insert_node(76, 'Aladdin')
    depth2 = tree.insert_node(25, 'Anastasia')
    depth3 = tree.insert_node(33, 'Cars')
    depth4 = tree.insert_node(88, "Fantasia")

    assert_equal 0, depth
    assert_equal 1, depth1
    assert_equal 1, depth2
    assert_equal 2, depth3
    assert_equal 2, depth4
  end

  def test_include?
    tree = BinarySearchTree.new

    refute tree.include?(50)

    tree.insert_node(50, 'The Rescuers')
    tree.insert_node(76, 'Aladdin')
    tree.insert_node(25, 'Anastasia')
    tree.insert_node(33, 'Cars')
    tree.insert_node(88, "Fantasia")

    assert tree.include?(50)
    assert tree.include?(76)
    assert tree.include?(25)
    assert tree.include?(33)
    assert tree.include?(88)
    refute tree.include?(7)
  end


  def test_depth_of
    tree = BinarySearchTree.new
    tree.insert_node(50, 'The Rescuers')
    tree.insert_node(76, 'Aladdin')
    tree.insert_node(88, 'Fantasia')

    assert_equal 0, tree.depth_of(50)
    assert_equal 1, tree.depth_of(76)
    assert_equal 2, tree.depth_of(88)
    assert_nil tree.depth_of(90)
  end


  def test_max_return
    #returns the highest value as a Hash
    tree = BinarySearchTree.new

    assert_nil tree.max

    tree.insert_node(50, 'The Rescuers')
    expected_node = {'The Rescuers' => 50}

    assert_equal expected_node, tree.max

    tree.insert_node(76, 'Aladdin')
    tree.insert_node(88, 'Fantasia')
    expected_node = {'Fantasia' => 88}

    assert_equal expected_node, tree.max
  end

  def test_min_return
    #returns the lowest value as a Hash
    tree = BinarySearchTree.new

    assert_nil tree.min

    tree.insert_node(50, 'The Rescuers')
    expected_node = {'The Rescuers' => 50}

    assert_equal expected_node, tree.min

    tree.insert_node(33, 'Cars')
    tree.insert_node(25, 'Anastasia')
    expected_node = {'Anastasia' => 25}

    assert_equal expected_node, tree.min
  end
=end

  def test_sort
  tree = BinarySearchTree.new
  tree.insert_node(50, 'The Rescuers')
  tree.insert_node(76, 'Aladdin')
  tree.insert_node(25, 'Anastasia')
  tree.insert_node(33, 'Cars')
  tree.insert_node(88, "Fantasia")
  sorted_array = [ {'Anastasia' => 25}, {'Cars' => 33}{'The Rescuers' => 50},
  {'Aladdin' => 76}, {'Fantasia' => 88} ]

  assert_equal sorted_array, tree.sort


  end

end
