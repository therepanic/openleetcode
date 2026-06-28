/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func binaryTreePaths(root *TreeNode) []string {
    res := []string{}
    if root == nil {
        return res
    }
    type pair struct {
        node *TreeNode
        path string
    }
    stack := []pair{{root, strconv.Itoa(root.Val)}}
    for len(stack) > 0 {
        p := stack[len(stack)-1]
        stack = stack[:len(stack)-1]
        node, path := p.node, p.path
        if node.Left == nil && node.Right == nil {
            res = append(res, path)
        }
        if node.Right != nil {
            stack = append(stack, pair{node.Right, path + "->" + strconv.Itoa(node.Right.Val)})
        }
        if node.Left != nil {
            stack = append(stack, pair{node.Left, path + "->" + strconv.Itoa(node.Left.Val)})
        }
    }
    return res
}
