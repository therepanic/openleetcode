/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func longestZigZag(root *TreeNode) int {
    if root == nil {
        return 0
    }
    best := 0
    type item struct {
        node *TreeNode
        endedLeft int
        endedRight int
    }
    stack := []item{{root, 0, 0}}
    for len(stack) > 0 {
        cur := stack[len(stack)-1]
        stack = stack[:len(stack)-1]
        if cur.endedLeft > best {
            best = cur.endedLeft
        }
        if cur.endedRight > best {
            best = cur.endedRight
        }
        if cur.node.Left != nil {
            stack = append(stack, item{cur.node.Left, cur.endedRight + 1, 0})
        }
        if cur.node.Right != nil {
            stack = append(stack, item{cur.node.Right, 0, cur.endedLeft + 1})
        }
    }
    return best
}
