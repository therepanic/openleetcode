def sum_numbers(root)
  dfs = lambda do |node, current|
    return 0 if node.nil?
    current = current * 10 + node.val
    if node.left.nil? && node.right.nil?
      current
    else
      dfs.call(node.left, current) + dfs.call(node.right, current)
    end
  end
  dfs.call(root, 0)
end
