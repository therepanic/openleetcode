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
    bool isSubtree(TreeNode* root, TreeNode* subRoot) {
        string r = ser(root);
        string s = ser(subRoot);
        return r.find(s) != string::npos;
    }
    
private:
    string ser(TreeNode* n) {
        if (!n) return ",#";
        return "," + to_string(n->val) + ser(n->left) + ser(n->right);
    }
};
