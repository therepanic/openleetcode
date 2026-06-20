
def is_balanced(root)
  height = lambda do |node|
    return 0 if node.nil?
    left = height.call(node.left)
    return -1 if left == -1
    right = height.call(node.right)
    return -1 if right == -1
    return -1 if (left - right).abs > 1
    1 + [left, right].max
  end
  height.call(root) != -1
end
