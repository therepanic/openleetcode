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
    int distributeCoins(TreeNode* root) {
        int moves = 0;
        solve(root, moves);
        return moves;
    }
    
private:
    int solve(TreeNode* node, int& moves) {
        if (!node) return 0;
        int leftCandie = solve(node->left, moves);
        int rightCandie = solve(node->right, moves);
        moves += abs(leftCandie) + abs(rightCandie);
        return (leftCandie + rightCandie + node->val) - 1;
    }
};
