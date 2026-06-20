
def zigzag_level_order(root)
  return [] if root.nil?
  result = []
  queue = [root]
  index = 0
  left_to_right = true
  while index < queue.length
    level_size = queue.length - index
    level = Array.new(level_size)
    level_size.times do |i|
      node = queue[index]
      index += 1
      pos = left_to_right ? i : level_size - 1 - i
      level[pos] = node.val
      queue << node.left unless node.left.nil?
      queue << node.right unless node.right.nil?
    end
    result << level
    left_to_right = !left_to_right
  end
  result
end
