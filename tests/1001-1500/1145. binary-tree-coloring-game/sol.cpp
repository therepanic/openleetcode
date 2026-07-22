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
    int subtreeCount(TreeNode* node) {
        if (node == nullptr) return 0;
        int leftCount = subtreeCount(node->left);
        int rightCount = subtreeCount(node->right);
        return leftCount + rightCount + 1;
    }

    bool btreeGameWinningMove(TreeNode* root, int n, int x) {
        std::queue<TreeNode*> q;
        q.push(root);
        TreeNode* node = nullptr;
        while (!q.empty()) {
            TreeNode* front = q.front();
            q.pop();
            if (front->val == x) {
                node = front;
                break;
            }
            if (front->left) q.push(front->left);
            if (front->right) q.push(front->right);
        }

        int leftCount = subtreeCount(node->left);
        int rightCount = subtreeCount(node->right);
        int parentCount = n - leftCount - rightCount - 1;
        if (parentCount > leftCount + rightCount) return true;
        else if (leftCount > parentCount + rightCount) return true;
        else if (rightCount > parentCount + leftCount) return true;
        return false;
    }
};
