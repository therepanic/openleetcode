def max_path_sum(root)
  best = root.val
  dfs = lambda do |node|
    return 0 if node.nil?
    left = [dfs.call(node.left), 0].max
    right = [dfs.call(node.right), 0].max
    best = [best, node.val + left + right].max
    node.val + [left, right].max
  end
  dfs.call(root)
  best
end
