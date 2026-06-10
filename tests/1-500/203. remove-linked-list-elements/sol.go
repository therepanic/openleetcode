func removeElements(head *ListNode, val int) *ListNode {
    dummy := &ListNode{Val: 0, Next: head}
    cur := dummy
    for cur.Next != nil {
        if cur.Next.Val == val {
            cur.Next = cur.Next.Next
        } else {
            cur = cur.Next
        }
    }
    return dummy.Next
}
