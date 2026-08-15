/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func mergeInBetween(list1 *ListNode, a int, b int, list2 *ListNode) *ListNode {
    curr := list1
    for i := 0; i < a-1; i++ {
        curr = curr.Next
    }
    prev := curr
    for i := 0; i < b-a+2; i++ {
        curr = curr.Next
    }
    prev.Next = list2
    prev = prev.Next
    for prev.Next != nil {
        prev = prev.Next
    }
    prev.Next = curr
    return list1
}
