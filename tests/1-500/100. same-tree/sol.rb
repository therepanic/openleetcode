def is_same_tree(p, q)
  return p == q if p.nil? || q.nil?

  p.val == q.val &&
    is_same_tree(p.left, q.left) &&
    is_same_tree(p.right, q.right)
end
