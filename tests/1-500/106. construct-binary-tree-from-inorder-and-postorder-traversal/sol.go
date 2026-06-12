
func buildTree(inorder []int, postorder []int) *TreeNode {
    index := make(map[int]int, len(inorder))
    for i, value := range inorder {
        index[value] = i
    }
    postIndex := len(postorder) - 1
    var build func(int, int) *TreeNode
    build = func(left int, right int) *TreeNode {
        if left > right {
            return nil
        }
        rootVal := postorder[postIndex]
        postIndex--
        root := &TreeNode{Val: rootVal}
        mid := index[rootVal]
        root.Right = build(mid+1, right)
        root.Left = build(left, mid-1)
        return root
    }
    return build(0, len(inorder)-1)
}
