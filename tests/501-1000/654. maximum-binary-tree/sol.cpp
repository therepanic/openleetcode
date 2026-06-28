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
    TreeNode* constructMaximumBinaryTree(vector<int>& nums) {
        vector<TreeNode*> stack;
        
        for (int num : nums) {
            TreeNode* current = new TreeNode(num);
            
            while (!stack.empty() && stack.back()->val < num) {
                current->left = stack.back();
                stack.pop_back();
            }
            
            if (!stack.empty()) {
                stack.back()->right = current;
            }
            
            stack.push_back(current);
        }
        
        return stack[0];
    }
};
