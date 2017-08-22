require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'
require './lib/binary_search_tree'

class BinarySearchTreeTest < Minitest::Test

  def test_binary_search_tree_class_exists
    tree = BinarySearchTree.new
    assert_instance_of BinarySearchTree, tree
  end

  def test_node_class_exists
    node = Node.new(61, "Cars")
    assert_instance_of Node, node
  end

  def test_insert_root
    tree = BinarySearchTree.new
    assert_nil tree.root
    tree.insert_node(50, "The Rescuers")
    assert_instance_of Node, tree.root
    assert_equal tree.root.score, 50
    assert_equal tree.root.movie, "The Rescuers"
  end

  def test_create_left_node
    tree = BinarySearchTree.new
    tree.insert_node(50, 'The Rescuers')
    assert_nil tree.root.left_node
    tree.insert_node(25, 'Anastasia')
    assert_instance_of Node, tree.root.left_node
    assert_equal tree.root.left_node.score, 25
    assert_equal tree.root.left_node.movie, 'Anastasia'
  end

  def test_create_right_node
    tree = BinarySearchTree.new
    tree.insert_node(50, 'The Rescuers')
    assert_nil tree.root.right_node
    tree.insert_node(76, 'Aladdin')
    assert_instance_of Node, tree.root.right_node
    assert_equal tree.root.right_node.score, 76
    assert_equal tree.root.right_node.movie, 'Aladdin'
  end

  def test_depth
    #test depth afert inserting node
    tree = BinarySearchTree.new
    depth = tree.insert_node(50, 'The Rescuers')
    assert_equal depth, 0

    depth1 = tree.insert_node(76, 'Aladdin')
    assert_equal depth1, 1

    depth2 = tree.insert_node(25, 'Anastasia')
    assert_equal depth2, 1

    depth3 = tree.insert_node(33, 'Cars')
    assert_equal depth3, 2

    depth4 = tree.insert_node(88, "Fantasia")
    assert_equal depth4, 2
  end


  def test_depth_of
    tree = BinarySearchTree.new
    tree.insert_node(50, 'The Rescuers')
    depth = tree.depth_of(50)
    assert_equal depth, 0
  end

end
