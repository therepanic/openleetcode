/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func insertIntoMaxTree(root *TreeNode, val int) *TreeNode {
    var dfs func(*TreeNode) *TreeNode
    dfs = func(node *TreeNode) *TreeNode {
        if node == nil {
            return &TreeNode{Val: val}
        }
        if node.Val > val {
            node.Right = dfs(node.Right)
            return node
        }
        temp := &TreeNode{Val: val}
        temp.Left = node
        return temp
    }
    return dfs(root)
}
