def generate_trees(n)
  return [] if n == 0
  build_trees(1, n)
end

def build_trees(start_idx, end_idx)
  return [nil] if start_idx > end_idx

  trees = []
  (start_idx..end_idx).each do |root_value|
    left_trees = build_trees(start_idx, root_value - 1)
    right_trees = build_trees(root_value + 1, end_idx)
    left_trees.each do |left|
      right_trees.each do |right|
        root = TreeNode.new(root_value)
        root.left = left
        root.right = right
        trees << root
      end
    end
  end

  trees
end
