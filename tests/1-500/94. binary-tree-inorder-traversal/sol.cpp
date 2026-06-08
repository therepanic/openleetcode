class Solution {
public:
    vector<int> inorderTraversal(TreeNode* root) {
        vector<int> result;
        vector<TreeNode*> stack;
        TreeNode* current = root;

        while (current != nullptr || !stack.empty()) {
            while (current != nullptr) {
                stack.push_back(current);
                current = current->left;
            }
            current = stack.back();
            stack.pop_back();
            result.push_back(current->val);
            current = current->right;
        }

        return result;
    }
};
