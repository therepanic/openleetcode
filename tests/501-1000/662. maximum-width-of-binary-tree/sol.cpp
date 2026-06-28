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
    int widthOfBinaryTree(TreeNode* root) {
        std::queue<TreeNode*> q;
        std::queue<long long> ind;
        std::vector<std::vector<long long>> res;
        q.push(root);
        ind.push(0);
        while (!q.empty()) {
            std::vector<long long> l;
            int size = q.size();
            for (int k = 0; k < size; k++) {
                TreeNode* node = q.front();
                q.pop();
                long long i = ind.front();
                ind.pop();
                if (node) {
                    l.push_back(i);
                    if (node->left) {
                        q.push(node->left);
                        ind.push(2 * i + 1);
                    }
                    if (node->right) {
                        q.push(node->right);
                        ind.push(2 * i + 2);
                    }
                }
            }
            res.push_back(l);
        }
        int max_width = 0;
        for (const auto& r : res) {
            if (r.size() >= 1) {
                int width = r.back() - r.front() + 1;
                max_width = std::max(max_width, width);
            }
        }
        return max_width;
    }
};
