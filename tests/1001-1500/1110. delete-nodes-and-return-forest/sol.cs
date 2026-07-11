using System.Collections.Generic;

public class Solution {
    public IList<TreeNode> DelNodes(TreeNode root, int[] to_delete) {
        List<TreeNode> ans = new List<TreeNode>();
        if (root == null) return ans;

        HashSet<int> st = new HashSet<int>(to_delete);
        TreeNode refNode = new TreeNode(-1);
        refNode.left = root;

        Queue<TreeNode> q1 = new Queue<TreeNode>();
        Queue<TreeNode> toProcess = new Queue<TreeNode>();
        toProcess.Enqueue(refNode);

        while (toProcess.Count > 0) {
            TreeNode newTree = toProcess.Dequeue();

            if (newTree.left != null) {
                if (st.Contains(newTree.left.val)) {
                    toProcess.Enqueue(newTree.left);
                } else {
                    ans.Add(newTree.left);
                    q1.Enqueue(newTree.left);
                }
                newTree.left = null;
            }

            if (newTree.right != null) {
                if (st.Contains(newTree.right.val)) {
                    toProcess.Enqueue(newTree.right);
                } else {
                    ans.Add(newTree.right);
                    q1.Enqueue(newTree.right);
                }
                newTree.right = null;
            }

            while (q1.Count > 0) {
                TreeNode temp = q1.Dequeue();

                if (temp.left != null) {
                    if (st.Contains(temp.left.val)) {
                        toProcess.Enqueue(temp.left);
                        temp.left = null;
                    } else {
                        q1.Enqueue(temp.left);
                    }
                }

                if (temp.right != null) {
                    if (st.Contains(temp.right.val)) {
                        toProcess.Enqueue(temp.right);
                        temp.right = null;
                    } else {
                        q1.Enqueue(temp.right);
                    }
                }
            }
        }

        return ans;
    }
}
