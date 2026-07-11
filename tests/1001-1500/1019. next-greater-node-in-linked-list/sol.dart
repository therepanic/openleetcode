class Solution {
  List<int> nextLargerNodes(ListNode? head) {
    List<int> arr = [];
    while (head != null) {
      arr.add(head.val);
      head = head.next;
    }
    int n = arr.length;
    List<int> ans = List.filled(n, 0);
    List<int> stack = [];
    for (int i = 0; i < n; i++) {
      while (stack.isNotEmpty && arr[i] > arr[stack.last]) {
        ans[stack.removeLast()] = arr[i];
      }
      stack.add(i);
    }
    return ans;
  }
}
