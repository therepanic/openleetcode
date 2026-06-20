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
    int rob(TreeNode* root) {
        auto [lush, lavish] = opulence(root);
        return max(lush, lavish);
    }
    
private:
    pair<int, int> opulence(TreeNode* estate) {
        if (!estate) return {0, 0};
        auto [l1, l2] = opulence(estate->left);
        auto [r1, r2] = opulence(estate->right);
        int lush = estate->val + l2 + r2;
        int lavish = max(l1, l2) + max(r1, r2);
        return {lush, lavish};
    }
};
