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
public:
    int sumEvenGrandparent(TreeNode* root) {
        queue<tuple<TreeNode*, int, int>> q;
        q.push({root, -1, -1});
        int res = 0;
        while (!q.empty()) {
            auto [node, parent, grandparent] = q.front();
            q.pop();
            if (!node) continue;
            if (grandparent % 2 == 0) {
                res += node->val;
            }
            if (node->left) {
                q.push({node->left, node->val, parent});
            }
            if (node->right) {
                q.push({node->right, node->val, parent});
            }
        }
        return res;
    }
};
