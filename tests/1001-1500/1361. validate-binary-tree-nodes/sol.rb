# @param {Integer} n
# @param {Integer[]} left_child
# @param {Integer[]} right_child
# @return {Boolean}
def validate_binary_tree_nodes(n, left_child, right_child)
  in_degree = Array.new(n, 0)
  (0...n).each do |i|
    [left_child[i], right_child[i]].each do |child|
      if child != -1
        return false if child < 0 || child >= n
        in_degree[child] += 1
        return false if in_degree[child] > 1
      end
    end
  end

  root = -1
  in_degree.each_with_index do |x, i|
    if x == 0
      return false if root != -1
      root = i
    end
  end
  return false if root == -1

  queue = [root]
  visited = {root => true}

  until queue.empty?
    node = queue.shift
    [left_child[node], right_child[node]].each do |child|
      next if child == -1
      return false if visited[child]
      visited[child] = true
      queue.push(child)
    end
  end
  visited.size == n
end
