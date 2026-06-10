
public class Solution {
    public TreeNode SortedListToBST(ListNode head) {
        var values = new System.Collections.Generic.List<int>();
        while (head != null) {
            values.Add(head.val);
            head = head.next;
        }
        return Build(values, 0, values.Count - 1);
    }

    private TreeNode Build(System.Collections.Generic.List<int> values, int left, int right) {
        if (left > right) return null;
        int mid = left + (right - left) / 2;
        var root = new TreeNode(values[mid]);
        root.left = Build(values, left, mid - 1);
        root.right = Build(values, mid + 1, right);
        return root;
    }
}
