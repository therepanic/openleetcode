def preorder_traversal(root)
  result = []
  return result if root.nil?

  stack = [root]
  until stack.empty?
    node = stack.pop
    result << node.val
    stack << node.right unless node.right.nil?
    stack << node.left unless node.left.nil?
  end
  result
end
