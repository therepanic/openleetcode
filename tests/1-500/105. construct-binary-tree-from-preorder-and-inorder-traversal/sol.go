
func buildTree(preorder []int, inorder []int) *TreeNode {
    index := make(map[int]int, len(inorder))
    for i, value := range inorder {
        index[value] = i
    }
    preorderIndex := 0
    var build func(int, int) *TreeNode
    build = func(left int, right int) *TreeNode {
        if left > right {
            return nil
        }
        rootVal := preorder[preorderIndex]
        preorderIndex++
        root := &TreeNode{Val: rootVal}
        mid := index[rootVal]
        root.Left = build(left, mid-1)
        root.Right = build(mid+1, right)
        return root
    }
    return build(0, len(inorder)-1)
}
