/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func sufficientSubset(root *TreeNode, limit int) *TreeNode {
    var dfs func(*TreeNode, int) bool
    dfs = func(node *TreeNode, pathSum int) bool {
        if node == nil {
            return false
        }
        
        curr := pathSum + node.Val
        
        if node.Left == nil && node.Right == nil {
            return curr >= limit
        }
        
        leftGood := dfs(node.Left, curr)
        rightGood := dfs(node.Right, curr)
        
        if !leftGood {
            node.Left = nil
        }
        if !rightGood {
            node.Right = nil
        }
        
        return leftGood || rightGood
    }
    
    if dfs(root, 0) {
        return root
    }
    return nil
}
