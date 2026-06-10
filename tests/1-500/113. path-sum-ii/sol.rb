
def path_sum(root, target_sum)
  result = []

  dfs = lambda do |node, remaining, path|
    return if node.nil?
    path << node.val
    remaining -= node.val
    if node.left.nil? && node.right.nil? && remaining == 0
      result << path.dup
    else
      dfs.call(node.left, remaining, path)
      dfs.call(node.right, remaining, path)
    end
    path.pop
  end

  dfs.call(root, target_sum, [])
  result
end
