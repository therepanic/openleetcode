public class Solution {
    public int[] NextLargerNodes(ListNode head) {
        List<int> arr = new List<int>();
        while (head != null) {
            arr.Add(head.val);
            head = head.next;
        }
        int n = arr.Count;
        int[] ans = new int[n];
        List<int> stack = new List<int>();
        for (int i = 0; i < n; i++) {
            while (stack.Count > 0 && arr[i] > arr[stack[stack.Count - 1]]) {
                ans[stack[stack.Count - 1]] = arr[i];
                stack.RemoveAt(stack.Count - 1);
            }
            stack.Add(i);
        }
        return ans;
    }
}
