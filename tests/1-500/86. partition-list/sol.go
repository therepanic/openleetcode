func partition(head *ListNode, x int) *ListNode {
	smallDummy := &ListNode{}
	bigDummy := &ListNode{}
	small := smallDummy
	big := bigDummy
	for head != nil {
		next := head.Next
		head.Next = nil
		if head.Val < x {
			small.Next = head
			small = small.Next
		} else {
			big.Next = head
			big = big.Next
		}
		head = next
	}
	small.Next = bigDummy.Next
	return smallDummy.Next
}
