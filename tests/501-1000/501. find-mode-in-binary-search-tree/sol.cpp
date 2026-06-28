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
    vector<int> findMode(TreeNode* root) {
        vector<int> lst;
        function<void(TreeNode*)> traverse = [&](TreeNode* curr) {
            if (curr) {
                lst.push_back(curr->val);
                traverse(curr->left);
                traverse(curr->right);
            }
        };
        traverse(root);
        unordered_map<int, int> d;
        for (int v : lst) {
            d[v]++;
        }
        int m = 0;
        for (int v : lst) {
            m = max(m, d[v]);
        }
        unordered_set<int> sol;
        for (int v : lst) {
            if (d[v] == m) {
                sol.insert(v);
            }
        }
        return vector<int>(sol.begin(), sol.end());
    }
};
