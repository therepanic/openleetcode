/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func pruneTree(root *TreeNode) *TreeNode {
    var traverseAndRemove func(temp *TreeNode) bool
    traverseAndRemove = func(temp *TreeNode) bool {
        if temp == nil {
            return false
        }
        if temp.Left == nil && temp.Right == nil {
            return temp.Val == 1
        }
        left := traverseAndRemove(temp.Left)
        right := traverseAndRemove(temp.Right)
        if !left {
            temp.Left = nil
        }
        if !right {
            temp.Right = nil
        }
        return left || right || temp.Val == 1
    }
    
    traverseAndRemove(root)
    if root.Left == nil && root.Right == nil && root.Val == 0 {
        return nil
    }
    return root
}
