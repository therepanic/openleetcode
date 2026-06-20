def right_side_view(root)
  return [] if root.nil?

  result = []
  queue = [root]
  index = 0
  while index < queue.length
    level_end = queue.length
    rightmost = nil
    while index < level_end
      node = queue[index]
      index += 1
      rightmost = node.val
      queue << node.left unless node.left.nil?
      queue << node.right unless node.right.nil?
    end
    result << rightmost
  end
  result
end
