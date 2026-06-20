
class Solution {
    public TreeNode buildTree(int[] preorder, int[] inorder) {
        java.util.HashMap<Integer, Integer> index = new java.util.HashMap<>();
        for (int i = 0; i < inorder.length; i++) {
            index.put(inorder[i], i);
        }
        int[] preorderIndex = new int[] {0};
        return build(preorder, index, preorderIndex, 0, inorder.length - 1);
    }

    private TreeNode build(int[] preorder, java.util.HashMap<Integer, Integer> index, int[] preorderIndex, int left, int right) {
        if (left > right) return null;
        int rootVal = preorder[preorderIndex[0]++];
        TreeNode root = new TreeNode(rootVal);
        int mid = index.get(rootVal);
        root.left = build(preorder, index, preorderIndex, left, mid - 1);
        root.right = build(preorder, index, preorderIndex, mid + 1, right);
        return root;
    }
}
