
class Solution {
public:
    TreeNode* sortedListToBST(ListNode* head) {
        vector<int> values;
        while (head != nullptr) {
            values.push_back(head->val);
            head = head->next;
        }
        return build(values, 0, static_cast<int>(values.size()) - 1);
    }

private:
    TreeNode* build(const vector<int>& values, int left, int right) {
        if (left > right) return nullptr;
        int mid = left + (right - left) / 2;
        TreeNode* root = new TreeNode(values[mid]);
        root->left = build(values, left, mid - 1);
        root->right = build(values, mid + 1, right);
        return root;
    }
};
