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
    int maxSumBST(TreeNode* root) {
        int best = 0;
        dfs(root, best);
        return best;
    }
    
private:
    tuple<bool, int, int, int> dfs(TreeNode* node, int& best) {
        if (!node) {
            return {true, INT_MAX, INT_MIN, 0};
        }
        
        auto [lbst, lmin, lmax, lsum] = dfs(node->left, best);
        auto [rbst, rmin, rmax, rsum] = dfs(node->right, best);
        
        if (lbst && rbst && lmax < node->val && node->val < rmin) {
            int total = lsum + rsum + node->val;
            best = max(best, total);
            int newMin = min(lmin, node->val);
            int newMax = max(rmax, node->val);
            return {true, newMin, newMax, total};
        }
        
        return {false, INT_MIN, INT_MAX, 0};
    }
};
