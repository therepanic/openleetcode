
def min_depth(root)
  return 0 if root.nil?
  queue = [[root, 1]]
  index = 0
  while index < queue.length
    node, depth = queue[index]
    index += 1
    return depth if node.left.nil? && node.right.nil?
    queue << [node.left, depth + 1] unless node.left.nil?
    queue << [node.right, depth + 1] unless node.right.nil?
  end
  0
end
