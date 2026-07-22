/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func removeLeafNodes(root *TreeNode, target int) *TreeNode {
    var traverseAndRemove func(temp *TreeNode) bool
    traverseAndRemove = func(temp *TreeNode) bool {
        if temp == nil {
            return false
        }
        if temp.Left == nil && temp.Right == nil {
            return temp.Val != target
        }
        left := traverseAndRemove(temp.Left)
        right := traverseAndRemove(temp.Right)
        if !left {
            temp.Left = nil
        }
        if !right {
            temp.Right = nil
        }
        return left || right || temp.Val != target
    }
    
    if !traverseAndRemove(root) {
        return nil
    }
    return root
}
