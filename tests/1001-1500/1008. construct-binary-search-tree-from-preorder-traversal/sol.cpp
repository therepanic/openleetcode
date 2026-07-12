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
    TreeNode* bstFromPreorder(vector<int>& preorder) {
        if (preorder.empty()) {
            return nullptr;
        }
        return build(preorder, 0, preorder.size() - 1);
    }
    
private:
    TreeNode* build(vector<int>& preorder, int start, int end) {
        if (start > end) {
            return nullptr;
        }
        TreeNode* root = new TreeNode(preorder[start]);
        int i = start + 1;
        while (i <= end && preorder[i] < root->val) {
            i++;
        }
        root->left = build(preorder, start + 1, i - 1);
        root->right = build(preorder, i, end);
        return root;
    }
};
