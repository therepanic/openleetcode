def inorderTraversal(root)
  result = []

  traverse = lambda do |node|
    return if node.nil?

    traverse.call(node.left)
    result << node.val
    traverse.call(node.right)
  end

  traverse.call(root)
  result
end

def inorder_traversal(root)
  inorderTraversal(root)
end
