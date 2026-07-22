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
    TreeNode* removeLeafNodes(TreeNode* root, int target) {
        function<bool(TreeNode*)> traverseAndRemove = [&](TreeNode* temp) -> bool {
            if (temp == nullptr) {
                return false;
            }
            if (temp->left == nullptr && temp->right == nullptr) {
                return temp->val != target;
            }
            bool left = traverseAndRemove(temp->left);
            bool right = traverseAndRemove(temp->right);
            if (!left) {
                temp->left = nullptr;
            }
            if (!right) {
                temp->right = nullptr;
            }
            return left || right || temp->val != target;
        };
        
        if (!traverseAndRemove(root)) {
            return nullptr;
        }
        return root;
    }
};
