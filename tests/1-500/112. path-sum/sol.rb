
def has_path_sum(root, target_sum)
  return false if root.nil?
  return root.val == target_sum if root.left.nil? && root.right.nil?
  remaining = target_sum - root.val
  has_path_sum(root.left, remaining) || has_path_sum(root.right, remaining)
end
