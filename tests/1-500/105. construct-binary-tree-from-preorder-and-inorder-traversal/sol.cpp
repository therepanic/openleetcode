
class Solution {
public:
    TreeNode* buildTree(vector<int>& preorder, vector<int>& inorder) {
        unordered_map<int, int> index;
        for (int i = 0; i < static_cast<int>(inorder.size()); ++i) {
            index[inorder[i]] = i;
        }
        int preorderIndex = 0;
        return build(preorder, index, preorderIndex, 0, static_cast<int>(inorder.size()) - 1);
    }

private:
    TreeNode* build(const vector<int>& preorder, unordered_map<int, int>& index, int& preorderIndex, int left, int right) {
        if (left > right) return nullptr;
        int rootVal = preorder[preorderIndex++];
        TreeNode* root = new TreeNode(rootVal);
        int mid = index[rootVal];
        root->left = build(preorder, index, preorderIndex, left, mid - 1);
        root->right = build(preorder, index, preorderIndex, mid + 1, right);
        return root;
    }
};
