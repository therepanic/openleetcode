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
    int pathSum(TreeNode* root, int targetSum) {
        unordered_map<long long, int> prefixSums;
        prefixSums[0] = 1;
        return dfs(root, 0, targetSum, prefixSums);
    }
    
private:
    int dfs(TreeNode* node, long long currentSum, int targetSum, unordered_map<long long, int>& prefixSums) {
        if (!node) return 0;
        currentSum += node->val;
        int count = prefixSums[currentSum - targetSum];
        prefixSums[currentSum]++;
        count += dfs(node->left, currentSum, targetSum, prefixSums);
        count += dfs(node->right, currentSum, targetSum, prefixSums);
        prefixSums[currentSum]--;
        return count;
    }
};
