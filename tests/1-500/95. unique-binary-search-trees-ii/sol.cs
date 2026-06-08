using System.Collections.Generic;

public class Solution {
    public IList<TreeNode> GenerateTrees(int n) {
        if (n == 0) {
            return new List<TreeNode>();
        }
        return Build(1, n);
    }

    private List<TreeNode> Build(int start, int end) {
        var trees = new List<TreeNode>();
        if (start > end) {
            trees.Add(null);
            return trees;
        }

        for (int rootValue = start; rootValue <= end; rootValue++) {
            var leftTrees = Build(start, rootValue - 1);
            var rightTrees = Build(rootValue + 1, end);
            foreach (var left in leftTrees) {
                foreach (var right in rightTrees) {
                    var root = new TreeNode(rootValue);
                    root.left = left;
                    root.right = right;
                    trees.Add(root);
                }
            }
        }

        return trees;
    }
}
