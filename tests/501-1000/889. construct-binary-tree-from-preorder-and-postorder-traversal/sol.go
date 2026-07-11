/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func constructFromPrePost(preorder []int, postorder []int) *TreeNode {
    index := 0
    return construct(preorder, postorder, &index, 0, len(preorder)-1)
}

func construct(pre []int, post []int, index *int, l int, h int) *TreeNode {
    if *index >= len(pre) || l > h {
        return nil
    }
    
    root := &TreeNode{Val: pre[*index]}
    *index++
    if l == h {
        return root
    }
    
    i := l
    for i <= h && post[i] != pre[*index] {
        i++
    }
    
    if i <= h {
        root.Left = construct(pre, post, index, l, i)
        root.Right = construct(pre, post, index, i+1, h-1)
    }
    
    return root
}
