/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode() : val(0), left(nullptr), right(nullptr) {}
 *     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
 *     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
 * };
 */
class Solution {
private:
    int findHeight(TreeNode* node) {
        if (node == nullptr) return 0;
        int height = 0;
        if (node->left != nullptr) {
            height = max(height, 1 + findHeight(node->left));
        }
        if (node->right != nullptr) {
            height = max(height, 1 + findHeight(node->right));
        }
        return height;
    }

public:
    vector<vector<string>> printTree(TreeNode* root) {
        int height = findHeight(root);
        int m = height + 1;
        int n = (1 << (height + 1)) - 1;
        vector<vector<string>> matrix(m, vector<string>(n, ""));
        queue<tuple<TreeNode*, int, int>> q;
        q.push({root, 0, (n - 1) / 2});
        while (!q.empty()) {
            int levelSize = q.size();
            for (int i = 0; i < levelSize; i++) {
                auto [frontNode, x, y] = q.front();
                q.pop();
                matrix[x][y] = to_string(frontNode->val);
                if (frontNode->left != nullptr) {
                    q.push({frontNode->left, x + 1, y - (1 << (height - x - 1))});
                }
                if (frontNode->right != nullptr) {
                    q.push({frontNode->right, x + 1, y + (1 << (height - x - 1))});
                }
            }
        }
        return matrix;
    }
};
