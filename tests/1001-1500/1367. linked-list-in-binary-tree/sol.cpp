/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode() : val(0), next(nullptr) {}
 *     ListNode(int x) : val(x), next(nullptr) {}
 *     ListNode(int x, ListNode *next) : val(x), next(next) {}
 * };
 */
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
    bool matches(TreeNode* node, ListNode* current) {
        if (current == nullptr) return true;
        if (node == nullptr || node->val != current->val) return false;
        return matches(node->left, current->next) || matches(node->right, current->next);
    }

public:
    bool isSubPath(ListNode* head, TreeNode* root) {
        if (root == nullptr) return false;
        return matches(root, head) || isSubPath(head, root->left) || isSubPath(head, root->right);
    }
};
