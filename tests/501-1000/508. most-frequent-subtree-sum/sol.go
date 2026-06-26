/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func findFrequentTreeSum(root *TreeNode) []int {
    c := make(map[int]int)
    maxCnt := 0
    var s func(*TreeNode) int
    s = func(n *TreeNode) int {
        if n == nil {
            return 0
        }
        r := n.Val + s(n.Left) + s(n.Right)
        c[r]++
        if c[r] > maxCnt {
            maxCnt = c[r]
        }
        return r
    }
    s(root)
    var res []int
    for k, v := range c {
        if v == maxCnt {
            res = append(res, k)
        }
    }
    return res
}
