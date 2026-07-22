/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func btreeGameWinningMove(root *TreeNode, n int, x int) bool {
    var subtreeCount func(*TreeNode) int
    subtreeCount = func(node *TreeNode) int {
        if node == nil {
            return 0
        }
        leftCount := subtreeCount(node.Left)
        rightCount := subtreeCount(node.Right)
        return leftCount + rightCount + 1
    }

    queue := []*TreeNode{root}
    var node *TreeNode
    for len(queue) > 0 {
        front := queue[0]
        queue = queue[1:]
        if front.Val == x {
            node = front
            break
        }
        if front.Left != nil {
            queue = append(queue, front.Left)
        }
        if front.Right != nil {
            queue = append(queue, front.Right)
        }
    }

    leftCount := subtreeCount(node.Left)
    rightCount := subtreeCount(node.Right)
    parentCount := n - leftCount - rightCount - 1
    if parentCount > leftCount+rightCount {
        return true
    } else if leftCount > parentCount+rightCount {
        return true
    } else if rightCount > parentCount+leftCount {
        return true
    }
    return false
}
