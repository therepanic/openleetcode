
def level_order(root)
  return [] if root.nil?
  result = []
  queue = [root]
  index = 0
  while index < queue.length
    level_size = queue.length - index
    level = []
    level_size.times do
      node = queue[index]
      index += 1
      level << node.val
      queue << node.left unless node.left.nil?
      queue << node.right unless node.right.nil?
    end
    result << level
  end
  result
end
