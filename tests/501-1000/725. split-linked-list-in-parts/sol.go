/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func splitListToParts(head *ListNode, k int) []*ListNode {
    // Step 1: Calculate the length of the linked list
    length := 0
    current := head
    for current != nil {
        length++
        current = current.Next
    }
    
    // Step 2: Determine the size of each part
    partSize := length / k
    largerParts := length % k
    
    // Initialize a slice to store the results
    result := make([]*ListNode, k)
    
    // Step 3: Split the linked list into parts
    current = head
    for i := 0; i < k; i++ {
        sublistSize := partSize
        if i < largerParts {
            sublistSize++
        }
        if sublistSize == 0 {
            result[i] = nil
        } else {
            sublistHead := current
            for j := 0; j < sublistSize-1; j++ {
                current = current.Next
            }
            nextNode := current.Next
            current.Next = nil
            result[i] = sublistHead
            current = nextNode
        }
    }
    
    return result
}
