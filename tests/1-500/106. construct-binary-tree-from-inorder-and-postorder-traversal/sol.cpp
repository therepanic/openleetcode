
class Solution {
public:
    TreeNode* buildTree(vector<int>& inorder, vector<int>& postorder) {
        unordered_map<int, int> index;
        for (int i = 0; i < static_cast<int>(inorder.size()); ++i) {
            index[inorder[i]] = i;
        }
        int postIndex = static_cast<int>(postorder.size()) - 1;
        return build(postorder, index, postIndex, 0, static_cast<int>(inorder.size()) - 1);
    }

private:
    TreeNode* build(const vector<int>& postorder, unordered_map<int, int>& index, int& postIndex, int left, int right) {
        if (left > right) return nullptr;
        int rootVal = postorder[postIndex--];
        TreeNode* root = new TreeNode(rootVal);
        int mid = index[rootVal];
        root->right = build(postorder, index, postIndex, mid + 1, right);
        root->left = build(postorder, index, postIndex, left, mid - 1);
        return root;
    }
};
