/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func invertTree(root *TreeNode) *TreeNode {
    if root == nil {
        return nil
    }
    l := invertTree(root.Left)
    r := invertTree(root.Right)
    root.Left = r
    root.Right = l
    return root
}
