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
#include <queue>
#include <string>

class Solution {
public:
    string smallestFromLeaf(TreeNode* root) {
        string smallestString = "";
        queue<pair<TreeNode*, string>> nodeQueue;
        
        nodeQueue.push({root, string(1, (char)(root->val + 'a'))});
        
        while (!nodeQueue.empty()) {
            auto [node, currentString] = nodeQueue.front();
            nodeQueue.pop();
            
            if (!node->left && !node->right) {
                if (smallestString.empty() || currentString < smallestString) {
                    smallestString = currentString;
                }
            }
            
            if (node->left) {
                nodeQueue.push({node->left, string(1, (char)(node->left->val + 'a')) + currentString});
            }
            
            if (node->right) {
                nodeQueue.push({node->right, string(1, (char)(node->right->val + 'a')) + currentString});
            }
        }
        
        return smallestString;
    }
};
