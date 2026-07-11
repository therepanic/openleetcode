/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func smallestFromLeaf(root *TreeNode) string {
    smallestString := ""
    nodeQueue := [][]interface{}{}
    
    nodeQueue = append(nodeQueue, []interface{}{root, string(rune(root.Val + 'a'))})
    
    for len(nodeQueue) > 0 {
        curr := nodeQueue[0]
        nodeQueue = nodeQueue[1:]
        node := curr[0].(*TreeNode)
        currentString := curr[1].(string)
        
        if node.Left == nil && node.Right == nil {
            if smallestString == "" || currentString < smallestString {
                smallestString = currentString
            }
        }
        
        if node.Left != nil {
            nodeQueue = append(nodeQueue, []interface{}{node.Left, string(rune(node.Left.Val + 'a')) + currentString})
        }
        
        if node.Right != nil {
            nodeQueue = append(nodeQueue, []interface{}{node.Right, string(rune(node.Right.Val + 'a')) + currentString})
        }
    }
    
    return smallestString
}
