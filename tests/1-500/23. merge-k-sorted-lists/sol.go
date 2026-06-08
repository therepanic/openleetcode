func mergeKLists(lists []*ListNode) *ListNode {
	if len(lists) == 0 {
		return nil
	}
	return mergeRange(lists, 0, len(lists)-1)
}

func mergeRange(lists []*ListNode, left, right int) *ListNode {
	if left == right {
		return lists[left]
	}
	mid := left + (right-left)/2
	return mergeTwoLists(mergeRange(lists, left, mid), mergeRange(lists, mid+1, right))
}

func mergeTwoLists(list1 *ListNode, list2 *ListNode) *ListNode {
	if list1 == nil || list2 == nil {
		if list1 != nil {
			return list1
		}
		return list2
	}
	if list1.Val > list2.Val {
		list1, list2 = list2, list1
	}
	list1.Next = mergeTwoLists(list1.Next, list2)
	return list1
}
