def average_of_levels(root)
  return [] if root.nil?
  res = []
  queue = [root]

  while !queue.empty?
    level_sum = 0
    count = queue.length

    count.times do
      node = queue.shift
      level_sum += node.val
      queue.push(node.left) if node.left
      queue.push(node.right) if node.right
    end

    res.push(level_sum.to_f / count)
  end

  res
end
