/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func deleteNode(root *TreeNode, key int) *TreeNode {
    if root == nil {
        return nil
    }
    if root.Val == key {
        return helper(root)
    }
    
    dummy := root
    for root != nil {
        if root.Val > key {
            if root.Left != nil && root.Left.Val == key {
                root.Left = helper(root.Left)
                break
            } else {
                root = root.Left
            }
        } else {
            if root.Right != nil && root.Right.Val == key {
                root.Right = helper(root.Right)
                break
            } else {
                root = root.Right
            }
        }
    }
    return dummy
}

func helper(root *TreeNode) *TreeNode {
    if root.Left == nil {
        return root.Right
    }
    if root.Right == nil {
        return root.Left
    }
    
    rightChild := root.Right
    lastRight := flr(root.Left)
    lastRight.Right = rightChild
    return root.Left
}

func flr(root *TreeNode) *TreeNode {
    if root.Right == nil {
        return root
    }
    return flr(root.Right)
}
