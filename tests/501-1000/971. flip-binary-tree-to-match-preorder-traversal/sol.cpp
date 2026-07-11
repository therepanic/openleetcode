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
private:
    vector<int> flippedNodes;
    int idx;
    vector<int>* voyagePtr;
    
    bool dfs(TreeNode* node) {
        if (node == nullptr) return true;
        if (node->val != (*voyagePtr)[idx]) return false;
        
        idx++;
        if (node->left && node->right) {
            if ((*voyagePtr)[idx] == node->right->val) {
                flippedNodes.push_back(node->val);
                if (!dfs(node->right)) return false;
                if (!dfs(node->left)) return false;
            } else if ((*voyagePtr)[idx] == node->left->val) {
                if (!dfs(node->left)) return false;
                if (!dfs(node->right)) return false;
            } else {
                return false;
            }
        } else {
            if (node->left) {
                if (!dfs(node->left)) return false;
            } else if (node->right) {
                if (!dfs(node->right)) return false;
            }
        }
        return true;
    }
    
public:
    vector<int> flipMatchVoyage(TreeNode* root, vector<int>& voyage) {
        flippedNodes.clear();
        idx = 0;
        voyagePtr = &voyage;
        
        if (!dfs(root)) return {-1};
        return flippedNodes;
    }
};
