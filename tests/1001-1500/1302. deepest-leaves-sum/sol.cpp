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
    int deepestLeavesSum(TreeNode* root) {
        unordered_map<int, int> depthMap;
        dfs(root, 0, depthMap);
        int maxDepth = 0;
        for (const auto& pair : depthMap) {
            maxDepth = max(maxDepth, pair.first);
        }
        return depthMap[maxDepth];
    }
    
private:
    void dfs(TreeNode* node, int depth, unordered_map<int, int>& depthMap) {
        if (!node) return;
        if (!node->left && !node->right) {
            depthMap[depth] += node->val;
        }
        dfs(node->left, depth + 1, depthMap);
        dfs(node->right, depth + 1, depthMap);
    }
};
