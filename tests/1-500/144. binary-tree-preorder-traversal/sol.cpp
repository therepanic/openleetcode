class Solution {
public:
    vector<int> preorderTraversal(TreeNode* root) {
        vector<int> result;
        if (!root) return result;
        vector<TreeNode*> stack{root};
        while (!stack.empty()) {
            TreeNode* node = stack.back();
            stack.pop_back();
            result.push_back(node->val);
            if (node->right) stack.push_back(node->right);
            if (node->left) stack.push_back(node->left);
        }
        return result;
    }
};
