/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func sumEvenGrandparent(root *TreeNode) int {
    type item struct {
        node *TreeNode
        parent int
        grandparent int
    }
    queue := []item{{root, -1, -1}}
    res := 0
    for len(queue) > 0 {
        curr := queue[0]
        queue = queue[1:]
        if curr.node == nil {
            continue
        }
        if curr.grandparent % 2 == 0 {
            res += curr.node.Val
        }
        if curr.node.Left != nil {
            queue = append(queue, item{curr.node.Left, curr.node.Val, curr.parent})
        }
        if curr.node.Right != nil {
            queue = append(queue, item{curr.node.Right, curr.node.Val, curr.parent})
        }
    }
    return res
}
