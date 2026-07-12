/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func bstToGst(root *TreeNode) *TreeNode {
    sum := 0
    var traversal func(*TreeNode)
    traversal = func(node *TreeNode) {
        if node.Right != nil {
            traversal(node.Right)
        }
        sum += node.Val
        node.Val = sum
        if node.Left != nil {
            traversal(node.Left)
        }
    }
    traversal(root)
    return root
}
