func rotateRight(head *ListNode, k int) *ListNode {
	if head == nil || head.Next == nil || k == 0 {
		return head
	}

	length := 1
	tail := head
	for tail.Next != nil {
		tail = tail.Next
		length++
	}

	k %= length
	if k == 0 {
		return head
	}

	tail.Next = head
	steps := length - k
	newTail := head
	for i := 1; i < steps; i++ {
		newTail = newTail.Next
	}

	newHead := newTail.Next
	newTail.Next = nil
	return newHead
}
