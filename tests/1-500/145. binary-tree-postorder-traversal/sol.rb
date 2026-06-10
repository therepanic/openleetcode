def postorder_traversal(root)
  result = []
  return result if root.nil?

  stack = [root]
  until stack.empty?
    node = stack.pop
    result << node.val
    stack << node.left unless node.left.nil?
    stack << node.right unless node.right.nil?
  end
  result.reverse
end
