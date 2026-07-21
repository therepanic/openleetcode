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
    int pseudoPalindromicPaths (TreeNode* root) {
        int count = 0;
        int counter[10] = {0};

        auto checkPalindromic = [&]() {
            int odd = 0;
            for (int i = 1; i <= 9; i++) {
                if (counter[i] % 2 == 1) {
                    odd++;
                    if (odd > 1) return false;
                }
            }
            return true;
        };

        function<void(TreeNode*)> dfs = [&](TreeNode* node) {
            if (!node) return;

            counter[node->val]++;

            if (!node->left && !node->right) {
                if (checkPalindromic()) count++;
            } else {
                dfs(node->left);
                dfs(node->right);
            }

            counter[node->val]--;
        };

        dfs(root);
        return count;
    }
};
