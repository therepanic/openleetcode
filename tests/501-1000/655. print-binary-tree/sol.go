/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func printTree(root *TreeNode) [][]string {
    var findHeight func(*TreeNode) int
    findHeight = func(node *TreeNode) int {
        if node == nil {
            return 0
        }
        height := 0
        if node.Left != nil {
            height = max(height, 1 + findHeight(node.Left))
        }
        if node.Right != nil {
            height = max(height, 1 + findHeight(node.Right))
        }
        return height
    }
    
    height := findHeight(root)
    m := height + 1
    n := (1 << (height + 1)) - 1
    matrix := make([][]string, m)
    for i := range matrix {
        matrix[i] = make([]string, n)
        for j := range matrix[i] {
            matrix[i][j] = ""
        }
    }
    
    type item struct {
        node *TreeNode
        x, y int
    }
    queue := []item{{root, 0, (n - 1) / 2}}
    for len(queue) > 0 {
        levelSize := len(queue)
        for i := 0; i < levelSize; i++ {
            front := queue[0]
            queue = queue[1:]
            matrix[front.x][front.y] = strconv.Itoa(front.node.Val)
            if front.node.Left != nil {
                queue = append(queue, item{front.node.Left, front.x + 1, front.y - (1 << (height - front.x - 1))})
            }
            if front.node.Right != nil {
                queue = append(queue, item{front.node.Right, front.x + 1, front.y + (1 << (height - front.x - 1))})
            }
        }
    }
    return matrix
}
