/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func countPairs(root *TreeNode, distance int) int {
    graph := make(map[*TreeNode][]*TreeNode)
    
    var dfs func(node, parent *TreeNode)
    dfs = func(node, parent *TreeNode) {
        if node == nil {
            return
        }
        if parent != nil {
            graph[parent] = append(graph[parent], node)
            graph[node] = append(graph[node], parent)
        }
        dfs(node.Left, node)
        dfs(node.Right, node)
    }
    dfs(root, nil)

    var leaves []*TreeNode
    for node := range graph {
        if node.Left == nil && node.Right == nil {
            leaves = append(leaves, node)
        }
    }

    ans := 0
    for i, leaf := range leaves {
        type Pair struct {
            node *TreeNode
            dist int
        }
        q := []Pair{{leaf, 0}}
        visited := map[*TreeNode]bool{leaf: true}

        for len(q) > 0 {
            curr := q[0]
            q = q[1:]
            node, dist := curr.node, curr.dist
            if dist >= distance {
                continue
            }
            for _, nei := range graph[node] {
                if !visited[nei] {
                    visited[nei] = true
                    q = append(q, Pair{nei, dist + 1})
                    // check if nei is leaf and index > i
                    isLeaf := nei.Left == nil && nei.Right == nil
                    if isLeaf {
                        // find index in leaves
                        idx := -1
                        for j, l := range leaves {
                            if l == nei {
                                idx = j
                                break
                            }
                        }
                        if idx > i {
                            ans++
                        }
                    }
                }
            }
        }
    }
    return ans
}
