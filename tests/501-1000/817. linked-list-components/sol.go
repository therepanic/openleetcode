/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func numComponents(head *ListNode, nums []int) int {
    nodeSet := make(map[int]bool)
    for _, num := range nums {
        nodeSet[num] = true
    }
    count := 0
    inComponent := false
    for head != nil {
        if nodeSet[head.Val] {
            if !inComponent {
                count++
                inComponent = true
            }
        } else {
            inComponent = false
        }
        head = head.Next
    }
    return count
}
