/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func maxLevelSum(root *TreeNode) int {
    idx := 0
    maxSum := -1 << 31
    q := []*TreeNode{root}
    level := 1
    for len(q) > 0 {
        qz := len(q)
        curSum := 0
        for i := 0; i < qz; i++ {
            node := q[0]
            q = q[1:]
            curSum += node.Val
            if node.Left != nil {
                q = append(q, node.Left)
            }
            if node.Right != nil {
                q = append(q, node.Right)
            }
        }
        if curSum > maxSum {
            idx = level
            maxSum = curSum
        }
        level++
    }
    return idx
}
