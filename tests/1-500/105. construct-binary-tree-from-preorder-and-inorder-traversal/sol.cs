
public class Solution {
    public TreeNode BuildTree(int[] preorder, int[] inorder) {
        var index = new System.Collections.Generic.Dictionary<int, int>();
        for (int i = 0; i < inorder.Length; i++) index[inorder[i]] = i;
        int preorderIndex = 0;
        return Build(preorder, index, ref preorderIndex, 0, inorder.Length - 1);
    }

    private TreeNode Build(int[] preorder, System.Collections.Generic.Dictionary<int, int> index, ref int preorderIndex, int left, int right) {
        if (left > right) return null;
        int rootVal = preorder[preorderIndex++];
        var root = new TreeNode(rootVal);
        int mid = index[rootVal];
        root.left = Build(preorder, index, ref preorderIndex, left, mid - 1);
        root.right = Build(preorder, index, ref preorderIndex, mid + 1, right);
        return root;
    }
}
