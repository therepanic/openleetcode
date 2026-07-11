func nextLargerNodes(head *ListNode) []int {
    arr := []int{}
    for head != nil {
        arr = append(arr, head.Val)
        head = head.Next
    }
    n := len(arr)
    ans := make([]int, n)
    stack := []int{}
    for i := 0; i < n; i++ {
        for len(stack) > 0 && arr[i] > arr[stack[len(stack)-1]] {
            ans[stack[len(stack)-1]] = arr[i]
            stack = stack[:len(stack)-1]
        }
        stack = append(stack, i)
    }
    return ans
}
