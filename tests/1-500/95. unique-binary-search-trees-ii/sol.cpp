class Solution {
public:
    vector<TreeNode*> generateTrees(int n) {
        if (n == 0) {
            return {};
        }
        return build(1, n);
    }

private:
    vector<TreeNode*> build(int start, int end) {
        if (start > end) {
            return {nullptr};
        }

        vector<TreeNode*> trees;
        for (int rootValue = start; rootValue <= end; ++rootValue) {
            vector<TreeNode*> leftTrees = build(start, rootValue - 1);
            vector<TreeNode*> rightTrees = build(rootValue + 1, end);
            for (TreeNode* left : leftTrees) {
                for (TreeNode* right : rightTrees) {
                    TreeNode* root = new TreeNode(rootValue);
                    root->left = left;
                    root->right = right;
                    trees.push_back(root);
                }
            }
        }

        return trees;
    }
};
