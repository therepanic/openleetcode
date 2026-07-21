/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func removeZeroSumSublists(head *ListNode) *ListNode {
    dummy := &ListNode{Val: 0, Next: head}
    prefixSum := 0
    seen := make(map[int]*ListNode)

    curr := dummy
    for curr != nil {
        prefixSum += curr.Val
        seen[prefixSum] = curr
        curr = curr.Next
    }

    prefixSum = 0
    curr = dummy
    for curr != nil {
        prefixSum += curr.Val
        curr.Next = seen[prefixSum].Next
        curr = curr.Next
    }

    return dummy.Next
}
