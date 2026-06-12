
func pathSum(root *TreeNode, targetSum int) [][]int {
    result := make([][]int, 0)
    path := make([]int, 0)
    var dfs func(*TreeNode, int)
    dfs = func(node *TreeNode, remaining int) {
        if node == nil {
            return
        }
        path = append(path, node.Val)
        remaining -= node.Val
        if node.Left == nil && node.Right == nil && remaining == 0 {
            snapshot := append([]int(nil), path...)
            result = append(result, snapshot)
        } else {
            dfs(node.Left, remaining)
            dfs(node.Right, remaining)
        }
        path = path[:len(path)-1]
    }
    dfs(root, targetSum)
    return result
}
