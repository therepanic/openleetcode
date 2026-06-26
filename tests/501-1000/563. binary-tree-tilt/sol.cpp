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
    int findTilt(TreeNode* root) {
        int ans = 0;
        function<int(TreeNode*)> helper = [&](TreeNode* n) -> int {
            if (!n) return 0;
            int l = helper(n->left);
            int r = helper(n->right);
            ans += abs(l - r);
            return l + r + n->val;
        };
        helper(root);
        return ans;
    }
};
