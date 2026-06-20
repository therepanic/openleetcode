
def build_tree(preorder, inorder)
  index = {}
  inorder.each_with_index { |value, i| index[value] = i }
  preorder_index = 0

  build = lambda do |left, right|
    return nil if left > right
    root_val = preorder[preorder_index]
    preorder_index += 1
    root = TreeNode.new(root_val)
    mid = index[root_val]
    root.left = build.call(left, mid - 1)
    root.right = build.call(mid + 1, right)
    root
  end

  build.call(0, inorder.length - 1)
end
