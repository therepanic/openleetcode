/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func pathSum(root *TreeNode, targetSum int) int {
    prefixSums := map[int64]int{0: 1}
    var dfs func(*TreeNode, int64) int
    dfs = func(node *TreeNode, currentSum int64) int {
        if node == nil {
            return 0
        }
        currentSum += int64(node.Val)
        count := prefixSums[currentSum - int64(targetSum)]
        prefixSums[currentSum]++
        count += dfs(node.Left, currentSum)
        count += dfs(node.Right, currentSum)
        prefixSums[currentSum]--
        return count
    }
    return dfs(root, 0)
}
