class Solution {
    fun nextLargerNodes(head: ListNode?): IntArray {
        val arr = mutableListOf<Int>()
        var curr = head
        while (curr != null) {
            arr.add(curr.`val`)
            curr = curr.next
        }
        val n = arr.size
        val ans = IntArray(n)
        val stack = mutableListOf<Int>()
        for (i in 0 until n) {
            while (stack.isNotEmpty() && arr[i] > arr[stack.last()]) {
                ans[stack.removeAt(stack.size - 1)] = arr[i]
            }
            stack.add(i)
        }
        return ans
    }
}
