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
    int maxProduct(TreeNode* root) {
        const int MOD = 1'000'000'007;
        vector<TreeNode*> nodes;
        stack<TreeNode*> st;
        st.push(root);

        while (!st.empty()) {
            TreeNode* node = st.top();
            st.pop();
            if (node) {
                nodes.push_back(node);
                st.push(node->left);
                st.push(node->right);
            }
        }

        unordered_map<TreeNode*, long long> sums;
        for (auto it = nodes.rbegin(); it != nodes.rend(); ++it) {
            TreeNode* node = *it;
            long long sub = node->val;
            if (node->left) sub += sums[node->left];
            if (node->right) sub += sums[node->right];
            sums[node] = sub;
        }

        long long total = sums[root];
        long long best = 0;
        for (auto& p : sums) {
            best = max(best, p.second * (total - p.second));
        }
        return best % MOD;
    }
};
