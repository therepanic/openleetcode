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
    bool isCousins(TreeNode* root, int x, int y) {
        vector<pair<TreeNode*, int>> res;
        vector<tuple<TreeNode*, TreeNode*, int>> stack;
        stack.push_back({root, nullptr, 0});
        while (!stack.empty()) {
            auto [curr, parent, depth] = stack.back();
            stack.pop_back();
            if (curr->val == x || curr->val == y) {
                res.push_back({parent, depth});
            }
            if (curr->left) {
                stack.push_back({curr->left, curr, depth + 1});
            }
            if (curr->right) {
                stack.push_back({curr->right, curr, depth + 1});
            }
        }
        return res.size() == 2 && res[0].second == res[1].second && res[0].first != res[1].first;
    }
};
