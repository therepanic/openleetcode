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
    bool leafSimilar(TreeNode* root1, TreeNode* root2) {
        function<void(TreeNode*, vector<int>&)> helper = [&](TreeNode* root, vector<int>& leaves) {
            stack<TreeNode*> st;
            st.push(root);
            while (!st.empty()) {
                TreeNode* curr = st.top();
                st.pop();
                if (!curr->left && !curr->right) {
                    leaves.push_back(curr->val);
                }
                if (curr->left) {
                    st.push(curr->left);
                }
                if (curr->right) {
                    st.push(curr->right);
                }
            }
        };
        vector<int> leaves1, leaves2;
        helper(root1, leaves1);
        helper(root2, leaves2);
        return leaves1 == leaves2;
    }
};
