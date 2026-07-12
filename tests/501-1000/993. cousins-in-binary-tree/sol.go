/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func isCousins(root *TreeNode, x int, y int) bool {
    type nodeInfo struct {
        node   *TreeNode
        parent *TreeNode
        depth  int
    }
    var res []nodeInfo
    stack := []nodeInfo{{root, nil, 0}}
    for len(stack) > 0 {
        curr := stack[len(stack)-1]
        stack = stack[:len(stack)-1]
        if curr.node.Val == x || curr.node.Val == y {
            res = append(res, curr)
        }
        if curr.node.Left != nil {
            stack = append(stack, nodeInfo{curr.node.Left, curr.node, curr.depth + 1})
        }
        if curr.node.Right != nil {
            stack = append(stack, nodeInfo{curr.node.Right, curr.node, curr.depth + 1})
        }
    }
    return len(res) == 2 && res[0].depth == res[1].depth && res[0].parent != res[1].parent
}
