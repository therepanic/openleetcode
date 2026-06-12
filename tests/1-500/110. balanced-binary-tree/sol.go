
func isBalanced(root *TreeNode) bool {
    var height func(*TreeNode) int
    height = func(node *TreeNode) int {
        if node == nil {
            return 0
        }
        left := height(node.Left)
        if left == -1 {
            return -1
        }
        right := height(node.Right)
        if right == -1 {
            return -1
        }
        if left-right > 1 || right-left > 1 {
            return -1
        }
        if left > right {
            return left + 1
        }
        return right + 1
    }
    return height(root) != -1
}
