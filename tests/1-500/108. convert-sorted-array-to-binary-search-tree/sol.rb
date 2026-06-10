
def sorted_array_to_bst(nums)
  build = lambda do |left, right|
    return nil if left > right
    mid = (left + right + 1) / 2
    root = TreeNode.new(nums[mid])
    root.left = build.call(left, mid - 1)
    root.right = build.call(mid + 1, right)
    root
  end
  build.call(0, nums.length - 1)
end
