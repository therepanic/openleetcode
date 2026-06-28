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
    vector<TreeNode*> findDuplicateSubtrees(TreeNode* root) {
        unordered_map<string, int> seen;
        vector<TreeNode*> ans;
        solve(root, seen, ans);
        return ans;
    }
    
private:
    string solve(TreeNode* node, unordered_map<string, int>& seen, vector<TreeNode*>& ans) {
        if (node == nullptr) {
            return "#";
        }
        string left = solve(node->left, seen, ans);
        string right = solve(node->right, seen, ans);
        string currTree = to_string(node->val) + ", " + left + ", " + right;
        seen[currTree]++;
        if (seen[currTree] == 2) {
            ans.push_back(node);
        }
        return currTree;
    }
};
