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
    TreeNode* increasingBST(TreeNode* root) {
        vector<int> vals;
        inord(root, vals);
        return create(vals, 0);
    }
    
private:
    TreeNode* create(vector<int>& vals, int i) {
        if (i >= vals.size()) return nullptr;
        TreeNode* node = new TreeNode(vals[i]);
        node->right = create(vals, i + 1);
        return node;
    }
    
    void inord(TreeNode* root, vector<int>& vals) {
        if (!root) return;
        inord(root->left, vals);
        vals.push_back(root->val);
        inord(root->right, vals);
    }
};
