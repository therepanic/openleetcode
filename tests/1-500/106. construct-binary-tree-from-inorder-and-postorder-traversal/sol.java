
class Solution {
    public TreeNode buildTree(int[] inorder, int[] postorder) {
        java.util.HashMap<Integer, Integer> index = new java.util.HashMap<>();
        for (int i = 0; i < inorder.length; i++) {
            index.put(inorder[i], i);
        }
        int[] postIndex = new int[] {postorder.length - 1};
        return build(postorder, index, postIndex, 0, inorder.length - 1);
    }

    private TreeNode build(int[] postorder, java.util.HashMap<Integer, Integer> index, int[] postIndex, int left, int right) {
        if (left > right) return null;
        int rootVal = postorder[postIndex[0]--];
        TreeNode root = new TreeNode(rootVal);
        int mid = index.get(rootVal);
        root.right = build(postorder, index, postIndex, mid + 1, right);
        root.left = build(postorder, index, postIndex, left, mid - 1);
        return root;
    }
}
