
func sortedListToBST(head *ListNode) *TreeNode {
    values := make([]int, 0)
    for head != nil {
        values = append(values, head.Val)
        head = head.Next
    }
    var build func(int, int) *TreeNode
    build = func(left int, right int) *TreeNode {
        if left > right {
            return nil
        }
        mid := left + (right-left)/2
        root := &TreeNode{Val: values[mid]}
        root.Left = build(left, mid-1)
        root.Right = build(mid+1, right)
        return root
    }
    return build(0, len(values)-1)
}
