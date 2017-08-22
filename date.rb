=begin
Build a binary search tree which can fulfill each of the interactions below.
start with: tree = BinarySearchTree.new
The insert method adds a new node with the passed-in data.
Each node is comprised of a score and a movie title.
It returns the depth of the new node in the tree.
Verify/reject the presence of a score in the tree.
Reports the depth of the tree where a score appears.
Return nil if the score does not exist.
max method that returns the movie title with highest score and score value
min method that returns the movie title with lowest score and score value
Return an array of all the movies and scores in sorted ascending order.
Return them as an array of hashes.
Assuming we have a file named movies.txt with one score/movie pair per line.
Where the return value is the number of movies inserted into the tree.
If a score is already present in the tree when load is called, ignore it.
Health method the return value is an Array with one nested array per node at that level.
The nested array is:
[score in the node, 1 + number of child nodes, floored percentage of (1+children) over the total number of nodes]
=end
