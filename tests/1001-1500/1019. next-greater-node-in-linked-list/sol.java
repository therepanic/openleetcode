class Solution {
    public int[] nextLargerNodes(ListNode head) {
        java.util.ArrayList<Integer> arrList = new java.util.ArrayList<>();
        while (head != null) {
            arrList.add(head.val);
            head = head.next;
        }
        int n = arrList.size();
        int[] ans = new int[n];
        int[] stack = new int[n];
        int top = -1;
        for (int i = 0; i < n; i++) {
            while (top >= 0 && arrList.get(i) > arrList.get(stack[top])) {
                ans[stack[top--]] = arrList.get(i);
            }
            stack[++top] = i;
        }
        return ans;
    }
}
