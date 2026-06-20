func insertionSortList(head *ListNode) *ListNode {
    values := make([]int, 0)
    for current := head; current != nil; current = current.Next {
        values = append(values, current.Val)
    }
    values = mergeSort147(values)

    dummy := &ListNode{}
    tail := dummy
    for _, value := range values {
        tail.Next = &ListNode{Val: value}
        tail = tail.Next
    }
    return dummy.Next
}

func mergeSort147(nums []int) []int {
    if len(nums) <= 1 {
        return nums
    }
    mid := len(nums) / 2
    left := mergeSort147(append([]int(nil), nums[:mid]...))
    right := mergeSort147(append([]int(nil), nums[mid:]...))
    merged := make([]int, 0, len(nums))
    i, j := 0, 0
    for i < len(left) && j < len(right) {
        if left[i] <= right[j] {
            merged = append(merged, left[i])
            i++
        } else {
            merged = append(merged, right[j])
            j++
        }
    }
    merged = append(merged, left[i:]...)
    merged = append(merged, right[j:]...)
    return merged
}
