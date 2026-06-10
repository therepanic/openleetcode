
def is_symmetric(root)
  mirror = lambda do |left, right|
    return left == right if left.nil? || right.nil?
    left.val == right.val && mirror.call(left.left, right.right) && mirror.call(left.right, right.left)
  end
  root.nil? || mirror.call(root.left, root.right)
end
