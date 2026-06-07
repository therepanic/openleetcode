func reverseKGroup(head *ListNode, k int) *ListNode {
	dummy := &ListNode{Next: head}
	groupPrev := dummy
	for {
		kth := getKthNode(groupPrev, k)
		if kth == nil {
			break
		}
		groupNext := kth.Next
		prev := groupNext
		cur := groupPrev.Next
		for cur != groupNext {
			tmp := cur.Next
			cur.Next = prev
			prev = cur
			cur = tmp
		}
		tmp := groupPrev.Next
		groupPrev.Next = kth
		groupPrev = tmp
	}
	return dummy.Next
}

func getKthNode(start *ListNode, k int) *ListNode {
	for start != nil && k > 0 {
		start = start.Next
		k--
	}
	return start
}
