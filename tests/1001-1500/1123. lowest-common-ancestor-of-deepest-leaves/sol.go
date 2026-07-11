/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func lcaDeepestLeaves(root *TreeNode) *TreeNode {
    var dfs func(node *TreeNode, depth int) (*TreeNode, int)
    dfs = func(node *TreeNode, depth int) (*TreeNode, int) {
        if node == nil {
            return nil, depth
        }
        
        leftLca, leftDepth := dfs(node.Left, depth+1)
        rightLca, rightDepth := dfs(node.Right, depth+1)
        
        if leftDepth > rightDepth {
            return leftLca, leftDepth
        } else if rightDepth > leftDepth {
            return rightLca, rightDepth
        } else {
            return node, leftDepth
        }
    }
    
    lca, _ := dfs(root, 0)
    return lca
}
