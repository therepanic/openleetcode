
class Solution {
public:
    vector<vector<int>> pathSum(TreeNode* root, int targetSum) {
        vector<vector<int>> result;
        vector<int> path;
        dfs(root, targetSum, path, result);
        return result;
    }

private:
    void dfs(TreeNode* node, int remaining, vector<int>& path, vector<vector<int>>& result) {
        if (node == nullptr) return;
        path.push_back(node->val);
        remaining -= node->val;
        if (node->left == nullptr && node->right == nullptr && remaining == 0) {
            result.push_back(path);
        } else {
            dfs(node->left, remaining, path, result);
            dfs(node->right, remaining, path, result);
        }
        path.pop_back();
    }
};
