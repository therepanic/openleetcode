import java.util.*;

public class Solution {
    public List<TreeNode> generateTrees(int n) {
        if (n == 0) {
            return new ArrayList<>();
        }
        return build(1, n);
    }

    private List<TreeNode> build(int start, int end) {
        List<TreeNode> trees = new ArrayList<>();
        if (start > end) {
            trees.add(null);
            return trees;
        }

        for (int rootValue = start; rootValue <= end; rootValue++) {
            List<TreeNode> leftTrees = build(start, rootValue - 1);
            List<TreeNode> rightTrees = build(rootValue + 1, end);
            for (TreeNode left : leftTrees) {
                for (TreeNode right : rightTrees) {
                    TreeNode root = new TreeNode(rootValue);
                    root.left = left;
                    root.right = right;
                    trees.add(root);
                }
            }
        }

        return trees;
    }
}
