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
    bool isEvenOddTree(TreeNode* root) {
        vector<vector<int>> elements = {{}};
        function<bool(TreeNode*, int)> collect = [&](TreeNode* temp, int pos) {
            if (temp == nullptr) return true;
            if (elements.size() == pos) elements.push_back({});
            int posCheck = pos % 2;
            int valCheck = temp->val % 2;
            if (posCheck == 0 && valCheck != 0) {
                if (!elements[pos].empty() && !(elements[pos].back() < temp->val)) return false;
                elements[pos].push_back(temp->val);
            } else if (posCheck != 0 && valCheck == 0) {
                if (!elements[pos].empty() && !(elements[pos].back() > temp->val)) return false;
                elements[pos].push_back(temp->val);
            } else {
                return false;
            }
            return collect(temp->left, pos + 1) && collect(temp->right, pos + 1);
        };
        return collect(root, 0);
    }
};
