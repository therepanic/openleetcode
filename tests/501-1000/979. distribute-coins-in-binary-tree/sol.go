/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func distributeCoins(root *TreeNode) int {
    moves := 0
    
    var solve func(*TreeNode) int
    solve = func(node *TreeNode) int {
        if node == nil {
            return 0
        }
        leftCandie := solve(node.Left)
        rightCandie := solve(node.Right)
        moves += abs(leftCandie) + abs(rightCandie)
        return (leftCandie + rightCandie + node.Val) - 1
    }
    
    solve(root)
    return moves
}

func abs(x int) int {
    if x < 0 {
        return -x
    }
    return x
}
