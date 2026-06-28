/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func widthOfBinaryTree(root *TreeNode) int {
    q := []*TreeNode{root}
    ind := []int{0}
    res := [][]int{}
    for len(q) > 0 {
        var l []int
        size := len(q)
        for k := 0; k < size; k++ {
            node := q[0]
            q = q[1:]
            i := ind[0]
            ind = ind[1:]
            if node != nil {
                l = append(l, i)
                if node.Left != nil {
                    q = append(q, node.Left)
                    ind = append(ind, 2*i+1)
                }
                if node.Right != nil {
                    q = append(q, node.Right)
                    ind = append(ind, 2*i+2)
                }
            }
        }
        res = append(res, l)
    }
    maxWidth := 0
    for _, r := range res {
        if len(r) >= 1 {
            width := r[len(r)-1] - r[0] + 1
            if width > maxWidth {
                maxWidth = width
            }
        }
    }
    return maxWidth
}
