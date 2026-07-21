/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func getAllElements(root1 *TreeNode, root2 *TreeNode) []int {
    stack1 := []*TreeNode{}
    stack2 := []*TreeNode{}
    output := []int{}
    
    for root1 != nil || root2 != nil || len(stack1) > 0 || len(stack2) > 0 {
        for root1 != nil {
            stack1 = append(stack1, root1)
            root1 = root1.Left
        }
        for root2 != nil {
            stack2 = append(stack2, root2)
            root2 = root2.Left
        }

        if len(stack1) > 0 && len(stack2) > 0 {
            if stack1[len(stack1)-1].Val <= stack2[len(stack2)-1].Val {
                root1 = stack1[len(stack1)-1]
                stack1 = stack1[:len(stack1)-1]
                output = append(output, root1.Val)
                root1 = root1.Right
            } else {
                root2 = stack2[len(stack2)-1]
                stack2 = stack2[:len(stack2)-1]
                output = append(output, root2.Val)
                root2 = root2.Right
            }
        } else if len(stack1) == 0 {
            root2 = stack2[len(stack2)-1]
            stack2 = stack2[:len(stack2)-1]
            output = append(output, root2.Val)
            root2 = root2.Right
        } else {
            root1 = stack1[len(stack1)-1]
            stack1 = stack1[:len(stack1)-1]
            output = append(output, root1.Val)
            root1 = root1.Right
        }
    }
    
    return output
}
