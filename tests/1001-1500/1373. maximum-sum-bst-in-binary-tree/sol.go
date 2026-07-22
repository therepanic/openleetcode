/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func maxSumBST(root *TreeNode) int {
    best := 0
    
    var dfs func(node *TreeNode) (bool, int, int, int)
    dfs = func(node *TreeNode) (bool, int, int, int) {
        if node == nil {
            return true, int(^uint(0) >> 1), -int(^uint(0) >> 1) - 1, 0
        }
        
        lbst, lmin, lmax, lsum := dfs(node.Left)
        rbst, rmin, rmax, rsum := dfs(node.Right)
        
        if lbst && rbst && lmax < node.Val && node.Val < rmin {
            total := lsum + rsum + node.Val
            if total > best {
                best = total
            }
            newMin := lmin
            if node.Val < newMin {
                newMin = node.Val
            }
            newMax := rmax
            if node.Val > newMax {
                newMax = node.Val
            }
            return true, newMin, newMax, total
        }
        
        return false, -int(^uint(0) >> 1) - 1, int(^uint(0) >> 1), 0
    }
    
    dfs(root)
    return best
}
