func reverseBetween(head *ListNode, left int, right int) *ListNode {
	dummy := &ListNode{Val: 0, Next: head}
	prev := dummy

	for i := 1; i < left; i++ {
		prev = prev.Next
	}

	curr := prev.Next
	for i := 0; i < right-left; i++ {
		node := curr.Next
		curr.Next = node.Next
		node.Next = prev.Next
		prev.Next = node
	}

	return dummy.Next
}
