class Solution {
public:
    vector<double> averageOfLevels(TreeNode* root) {
        if (!root) return {};

        vector<double> res;
        queue<TreeNode*> q;
        q.push(root);

        while (!q.empty()) {
            double levelSum = 0;
            int count = q.size();

            for (int i = 0; i < count; i++) {
                TreeNode* node = q.front();
                q.pop();
                levelSum += node->val;
                if (node->left) q.push(node->left);
                if (node->right) q.push(node->right);
            }

            res.push_back(levelSum / count);
        }

        return res;
    }
};
