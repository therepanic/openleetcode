
func isSymmetric(root *TreeNode) bool {
    var mirror func(*TreeNode, *TreeNode) bool
    mirror = func(left *TreeNode, right *TreeNode) bool {
        if left == nil || right == nil {
            return left == right
        }
        return left.Val == right.Val && mirror(left.Left, right.Right) && mirror(left.Right, right.Left)
    }
    return root == nil || mirror(root.Left, root.Right)
}
