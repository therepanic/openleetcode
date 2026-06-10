
public class Solution {
    public TreeNode BuildTree(int[] inorder, int[] postorder) {
        var index = new System.Collections.Generic.Dictionary<int, int>();
        for (int i = 0; i < inorder.Length; i++) index[inorder[i]] = i;
        int postIndex = postorder.Length - 1;
        return Build(postorder, index, ref postIndex, 0, inorder.Length - 1);
    }

    private TreeNode Build(int[] postorder, System.Collections.Generic.Dictionary<int, int> index, ref int postIndex, int left, int right) {
        if (left > right) return null;
        int rootVal = postorder[postIndex--];
        var root = new TreeNode(rootVal);
        int mid = index[rootVal];
        root.right = Build(postorder, index, ref postIndex, mid + 1, right);
        root.left = Build(postorder, index, ref postIndex, left, mid - 1);
        return root;
    }
}
