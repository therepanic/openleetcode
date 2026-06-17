/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func rob(root *TreeNode) int {
    var opulence func(*TreeNode) (int, int)
    opulence = func(estate *TreeNode) (int, int) {
        if estate == nil {
            return 0, 0
        }
        l1, l2 := opulence(estate.Left)
        r1, r2 := opulence(estate.Right)
        lush := estate.Val + l2 + r2
        lavish := max(l1, l2) + max(r1, r2)
        return lush, lavish
    }
    lush, lavish := opulence(root)
    return max(lush, lavish)
}

func max(a, b int) int {
    if a > b {
        return a
    }
    return b
}
