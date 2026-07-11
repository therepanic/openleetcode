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
    TreeNode* recoverFromPreorder(string traversal) {
        vector<TreeNode*> stack;
        TreeNode* root = nullptr;
        int i = 0, n = (int)traversal.size();
        while (i < n) {
            int depth = 0;
            while (i < n && traversal[i] == '-') {
                depth++;
                i++;
            }
            int num = 0;
            while (i < n && isdigit(traversal[i])) {
                num = num * 10 + (traversal[i] - '0');
                i++;
            }
            TreeNode* node = new TreeNode(num);
            while ((int)stack.size() > depth) {
                stack.pop_back();
            }
            if (stack.empty()) {
                root = node;
            } else {
                TreeNode* parent = stack.back();
                if (parent->left == nullptr) parent->left = node;
                else parent->right = node;
            }
            stack.push_back(node);
        }
        return root;
    }
};
