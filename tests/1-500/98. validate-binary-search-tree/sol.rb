def is_valid_bst(root)
  validate_bst(root, nil, nil)
end

def validate_bst(node, lower, upper)
  return true if node.nil?
  return false if !lower.nil? && node.val <= lower
  return false if !upper.nil? && node.val >= upper

  validate_bst(node.left, lower, node.val) &&
    validate_bst(node.right, node.val, upper)
end
