/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func isPalindrome(head *ListNode) bool {
    slow := head
    fast := head
    
    // Step 1
    for fast != nil && fast.Next != nil {
        fast = fast.Next.Next
        slow = slow.Next
    }
    
    // Step 2
    var node *ListNode = nil
    for slow != nil {
        temp := slow.Next
        slow.Next = node
        node = slow
        slow = temp
    }
    
    // Step 3
    first := head
    second := node
    for second != nil {
        if first.Val != second.Val {
            return false
        }
        first = first.Next
        second = second.Next
    }
    
    return true
}
