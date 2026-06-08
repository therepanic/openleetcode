func swapPairs(head *ListNode) *ListNode {
	if head == nil || head.Next == nil {
		return head
	}
	second := head.Next
	head.Next = swapPairs(second.Next)
	second.Next = head
	return second
}
