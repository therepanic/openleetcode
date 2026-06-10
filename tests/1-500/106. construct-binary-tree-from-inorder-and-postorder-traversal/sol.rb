
def build_tree(inorder, postorder)
  index = {}
  inorder.each_with_index { |value, i| index[value] = i }
  post_index = postorder.length - 1

  build = lambda do |left, right|
    return nil if left > right
    root_val = postorder[post_index]
    post_index -= 1
    root = TreeNode.new(root_val)
    mid = index[root_val]
    root.right = build.call(mid + 1, right)
    root.left = build.call(left, mid - 1)
    root
  end

  build.call(0, inorder.length - 1)
end
