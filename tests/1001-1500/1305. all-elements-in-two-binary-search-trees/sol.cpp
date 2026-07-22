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
    vector<int> getAllElements(TreeNode* root1, TreeNode* root2) {
        vector<TreeNode*> stack1, stack2;
        vector<int> output;
        
        while (root1 || root2 || !stack1.empty() || !stack2.empty()) {
            while (root1) {
                stack1.push_back(root1);
                root1 = root1->left;
            }
            while (root2) {
                stack2.push_back(root2);
                root2 = root2->left;
            }

            if (!stack1.empty() && !stack2.empty()) {
                if (stack1.back()->val <= stack2.back()->val) {
                    root1 = stack1.back();
                    stack1.pop_back();
                    output.push_back(root1->val);
                    root1 = root1->right;
                } else {
                    root2 = stack2.back();
                    stack2.pop_back();
                    output.push_back(root2->val);
                    root2 = root2->right;
                }
            } else if (stack1.empty()) {
                root2 = stack2.back();
                stack2.pop_back();
                output.push_back(root2->val);
                root2 = root2->right;
            } else {
                root1 = stack1.back();
                stack1.pop_back();
                output.push_back(root1->val);
                root1 = root1->right;
            }
        }
        
        return output;
    }
};
