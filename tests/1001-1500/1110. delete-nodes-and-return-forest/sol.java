import java.util.*;

class Solution {
    public List<TreeNode> delNodes(TreeNode root, int[] to_delete) {
        List<TreeNode> ans = new ArrayList<>();
        if (root == null) return ans;

        Set<Integer> st = new HashSet<>();
        for (int val : to_delete) st.add(val);

        TreeNode ref = new TreeNode(-1);
        ref.left = root;

        Deque<TreeNode> q1 = new ArrayDeque<>();
        Deque<TreeNode> toProcess = new ArrayDeque<>();
        toProcess.add(ref);

        while (!toProcess.isEmpty()) {
            TreeNode newTree = toProcess.poll();

            if (newTree.left != null) {
                if (st.contains(newTree.left.val)) {
                    toProcess.add(newTree.left);
                } else {
                    ans.add(newTree.left);
                    q1.add(newTree.left);
                }
                newTree.left = null;
            }

            if (newTree.right != null) {
                if (st.contains(newTree.right.val)) {
                    toProcess.add(newTree.right);
                } else {
                    ans.add(newTree.right);
                    q1.add(newTree.right);
                }
                newTree.right = null;
            }

            while (!q1.isEmpty()) {
                TreeNode temp = q1.poll();

                if (temp.left != null) {
                    if (st.contains(temp.left.val)) {
                        toProcess.add(temp.left);
                        temp.left = null;
                    } else {
                        q1.add(temp.left);
                    }
                }

                if (temp.right != null) {
                    if (st.contains(temp.right.val)) {
                        toProcess.add(temp.right);
                        temp.right = null;
                    } else {
                        q1.add(temp.right);
                    }
                }
            }
        }

        return ans;
    }
}
