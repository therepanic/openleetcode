/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func verticalTraversal(root *TreeNode) [][]int {
    type Node struct {
        col, row, val int
    }
    nodes := []Node{}
    
    var dfs func(*TreeNode, int, int)
    dfs = func(node *TreeNode, row, col int) {
        if node == nil {
            return
        }
        nodes = append(nodes, Node{col, row, node.Val})
        dfs(node.Left, row+1, col-1)
        dfs(node.Right, row+1, col+1)
    }
    
    dfs(root, 0, 0)
    
    sort.Slice(nodes, func(i, j int) bool {
        if nodes[i].col != nodes[j].col {
            return nodes[i].col < nodes[j].col
        }
        if nodes[i].row != nodes[j].row {
            return nodes[i].row < nodes[j].row
        }
        return nodes[i].val < nodes[j].val
    })
    
    res := [][]int{}
    prevCol := -10000
    
    for _, node := range nodes {
        if node.col != prevCol {
            res = append(res, []int{})
            prevCol = node.col
        }
        res[len(res)-1] = append(res[len(res)-1], node.val)
    }
    
    return res
}
