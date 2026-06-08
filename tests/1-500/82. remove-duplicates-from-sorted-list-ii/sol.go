func deleteDuplicates(head *ListNode) *ListNode {
	dummy := &ListNode{Val: 0, Next: head}
	prev := dummy
	cur := head
	for cur != nil {
		dup := false
		for cur.Next != nil && cur.Val == cur.Next.Val {
			dup = true
			cur = cur.Next
		}
		if dup {
			prev.Next = cur.Next
		} else {
			prev = prev.Next
		}
		cur = cur.Next
	}
	return dummy.Next
}
