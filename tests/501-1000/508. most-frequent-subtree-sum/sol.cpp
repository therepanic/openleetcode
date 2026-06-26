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
    vector<int> findFrequentTreeSum(TreeNode* root) {
        unordered_map<int, int> c;
        int maxCnt = 0;
        function<int(TreeNode*)> s = [&](TreeNode* n) -> int {
            if (!n) return 0;
            int r = n->val + s(n->left) + s(n->right);
            c[r]++;
            if (c[r] > maxCnt) maxCnt = c[r];
            return r;
        };
        s(root);
        vector<int> res;
        for (auto& p : c) {
            if (p.second == maxCnt) {
                res.push_back(p.first);
            }
        }
        return res;
    }
};
