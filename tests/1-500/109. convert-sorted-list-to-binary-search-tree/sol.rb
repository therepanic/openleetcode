
def sorted_list_to_bst(head)
  values = []
  while head
    values << head.val
    head = head.next
  end

  build = lambda do |left, right|
    return nil if left > right
    mid = (left + right) / 2
    root = TreeNode.new(values[mid])
    root.left = build.call(left, mid - 1)
    root.right = build.call(mid + 1, right)
    root
  end

  build.call(0, values.length - 1)
end
