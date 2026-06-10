
class Solution {
    public TreeNode sortedListToBST(ListNode head) {
        java.util.ArrayList<Integer> values = new java.util.ArrayList<>();
        while (head != null) {
            values.add(head.val);
            head = head.next;
        }
        return build(values, 0, values.size() - 1);
    }

    private TreeNode build(java.util.ArrayList<Integer> values, int left, int right) {
        if (left > right) return null;
        int mid = left + (right - left) / 2;
        TreeNode root = new TreeNode(values.get(mid));
        root.left = build(values, left, mid - 1);
        root.right = build(values, mid + 1, right);
        return root;
    }
}
