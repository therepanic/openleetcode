/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func swapNodes(head *ListNode, k int) *ListNode {
    if head == nil || head.Next == nil {
        return head
    }

    temp := head
    var firstPrev *ListNode

    n := 1
    for n < k {
        firstPrev = temp
        temp = temp.Next
        n++
    }

    first := temp

    second := head
    var secondPrev *ListNode
    temp = first
    for temp.Next != nil {
        secondPrev = second
        temp = temp.Next
        second = second.Next
    }

    if firstPrev != nil {
        firstPrev.Next = second
    }
    if secondPrev != nil {
        secondPrev.Next = first
    }

    tempNext := first.Next
    first.Next = second.Next
    second.Next = tempNext

    if k == 1 {
        return second
    }
    if second == head {
        return first
    }

    return head
}
