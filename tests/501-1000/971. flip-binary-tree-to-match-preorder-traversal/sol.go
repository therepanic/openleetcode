/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func flipMatchVoyage(root *TreeNode, voyage []int) []int {
    flippedNodes := []int{}
    idx := 0
    
    var dfs func(*TreeNode) bool
    dfs = func(node *TreeNode) bool {
        if node == nil {
            return true
        }
        if node.Val != voyage[idx] {
            return false
        }
        
        idx++
        if node.Left != nil && node.Right != nil {
            if voyage[idx] == node.Right.Val {
                flippedNodes = append(flippedNodes, node.Val)
                if !dfs(node.Right) {
                    return false
                }
                if !dfs(node.Left) {
                    return false
                }
            } else if voyage[idx] == node.Left.Val {
                if !dfs(node.Left) {
                    return false
                }
                if !dfs(node.Right) {
                    return false
                }
            } else {
                return false
            }
        } else {
            if node.Left != nil {
                if !dfs(node.Left) {
                    return false
                }
            } else if node.Right != nil {
                if !dfs(node.Right) {
                    return false
                }
            }
        }
        return true
    }
    
    if !dfs(root) {
        return []int{-1}
    }
    return flippedNodes
}
