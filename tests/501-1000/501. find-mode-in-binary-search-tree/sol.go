/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func findMode(root *TreeNode) []int {
    lst := []int{}
    var traverse func(curr *TreeNode)
    traverse = func(curr *TreeNode) {
        if curr != nil {
            lst = append(lst, curr.Val)
            traverse(curr.Left)
            traverse(curr.Right)
        }
    }
    traverse(root)
    d := make(map[int]int)
    for _, v := range lst {
        d[v]++
    }
    m := 0
    for _, v := range lst {
        if d[v] > m {
            m = d[v]
        }
    }
    solSet := make(map[int]bool)
    for _, v := range lst {
        if d[v] == m {
            solSet[v] = true
        }
    }
    sol := []int{}
    for k := range solSet {
        sol = append(sol, k)
    }
    return sol
}
