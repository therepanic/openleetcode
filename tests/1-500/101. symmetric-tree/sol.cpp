
class Solution {
public:
    bool isSymmetric(TreeNode* root) {
        return root == nullptr || mirror(root->left, root->right);
    }

private:
    bool mirror(TreeNode* left, TreeNode* right) {
        if (left == nullptr || right == nullptr) return left == right;
        return left->val == right->val &&
               mirror(left->left, right->right) &&
               mirror(left->right, right->left);
    }
};
