/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func deepestLeavesSum(root *TreeNode) int {
    depthMap := make(map[int]int)
    
    var dfs func(*TreeNode, int)
    dfs = func(node *TreeNode, depth int) {
        if node == nil {
            return
        }
        if node.Left == nil && node.Right == nil {
            depthMap[depth] += node.Val
        }
        dfs(node.Left, depth+1)
        dfs(node.Right, depth+1)
    }
    
    dfs(root, 0)
    
    maxDepth := 0
    for depth := range depthMap {
        if depth > maxDepth {
            maxDepth = depth
        }
    }
    
    return depthMap[maxDepth]
}
