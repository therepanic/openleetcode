/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func subtreeWithAllDeepest(root *TreeNode) *TreeNode {
    if root == nil {
        return nil
    }
    
    parent := make(map[*TreeNode]*TreeNode)
    parent[root] = nil
    q := []*TreeNode{root}
    var lastLevel []*TreeNode
    
    for len(q) > 0 {
        size := len(q)
        lastLevel = nil
        for i := 0; i < size; i++ {
            node := q[0]
            q = q[1:]
            lastLevel = append(lastLevel, node)
            if node.Left != nil {
                parent[node.Left] = node
                q = append(q, node.Left)
            }
            if node.Right != nil {
                parent[node.Right] = node
                q = append(q, node.Right)
            }
        }
    }
    
    deepest := make(map[*TreeNode]bool)
    for _, node := range lastLevel {
        deepest[node] = true
    }
    
    for len(deepest) > 1 {
        next := make(map[*TreeNode]bool)
        for node := range deepest {
            next[parent[node]] = true
        }
        deepest = next
    }
    
    for node := range deepest {
        return node
    }
    return nil
}
