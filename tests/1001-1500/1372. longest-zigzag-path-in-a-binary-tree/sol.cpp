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
    int longestZigZag(TreeNode* root) {
        if (!root) return 0;
        int best = 0;
        stack<tuple<TreeNode*, int, int>> st;
        st.push({root, 0, 0});
        while (!st.empty()) {
            auto [node, endedLeft, endedRight] = st.top();
            st.pop();
            best = max({best, endedLeft, endedRight});
            if (node->left) {
                st.push({node->left, endedRight + 1, 0});
            }
            if (node->right) {
                st.push({node->right, 0, endedLeft + 1});
            }
        }
        return best;
    }
};
