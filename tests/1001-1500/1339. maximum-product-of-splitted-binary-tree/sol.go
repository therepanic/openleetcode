/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func maxProduct(root *TreeNode) int {
    const mod = 1_000_000_007
    var nodes []*TreeNode
    stack := []*TreeNode{root}

    for len(stack) > 0 {
        node := stack[len(stack)-1]
        stack = stack[:len(stack)-1]
        if node != nil {
            nodes = append(nodes, node)
            stack = append(stack, node.Left, node.Right)
        }
    }

    sums := make(map[*TreeNode]int64)
    for i := len(nodes) - 1; i >= 0; i-- {
        node := nodes[i]
        sub := int64(node.Val)
        if node.Left != nil {
            sub += sums[node.Left]
        }
        if node.Right != nil {
            sub += sums[node.Right]
        }
        sums[node] = sub
    }

    total := sums[root]
    var best int64 = 0
    for _, sub := range sums {
        prod := sub * (total - sub)
        if prod > best {
            best = prod
        }
    }
    return int(best % mod)
}
