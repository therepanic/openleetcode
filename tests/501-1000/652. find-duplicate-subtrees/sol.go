/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func findDuplicateSubtrees(root *TreeNode) []*TreeNode {
    seen := make(map[string]int)
    ans := []*TreeNode{}
    
    var solve func(*TreeNode) string
    solve = func(node *TreeNode) string {
        if node == nil {
            return "#"
        }
        left := solve(node.Left)
        right := solve(node.Right)
        currTree := strconv.Itoa(node.Val) + ", " + left + ", " + right
        seen[currTree]++
        if seen[currTree] == 2 {
            ans = append(ans, node)
        }
        return currTree
    }
    
    solve(root)
    return ans
}
