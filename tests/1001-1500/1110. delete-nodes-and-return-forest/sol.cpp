#include <vector>
#include <unordered_set>
#include <queue>
using namespace std;

class Solution {
public:
    vector<TreeNode*> delNodes(TreeNode* root, vector<int>& to_delete) {
        vector<TreeNode*> ans;
        if (!root) return ans;

        unordered_set<int> st(to_delete.begin(), to_delete.end());

        TreeNode* ref = new TreeNode(-1);
        ref->left = root;

        deque<TreeNode*> q1;
        deque<TreeNode*> toProcess;
        toProcess.push_back(ref);

        while (!toProcess.empty()) {
            TreeNode* newTree = toProcess.front();
            toProcess.pop_front();

            if (newTree->left) {
                if (st.count(newTree->left->val)) {
                    toProcess.push_back(newTree->left);
                } else {
                    ans.push_back(newTree->left);
                    q1.push_back(newTree->left);
                }
                newTree->left = nullptr;
            }

            if (newTree->right) {
                if (st.count(newTree->right->val)) {
                    toProcess.push_back(newTree->right);
                } else {
                    ans.push_back(newTree->right);
                    q1.push_back(newTree->right);
                }
                newTree->right = nullptr;
            }

            while (!q1.empty()) {
                TreeNode* temp = q1.front();
                q1.pop_front();

                if (temp->left) {
                    if (st.count(temp->left->val)) {
                        toProcess.push_back(temp->left);
                        temp->left = nullptr;
                    } else {
                        q1.push_back(temp->left);
                    }
                }

                if (temp->right) {
                    if (st.count(temp->right->val)) {
                        toProcess.push_back(temp->right);
                        temp->right = nullptr;
                    } else {
                        q1.push_back(temp->right);
                    }
                }
            }
        }

        return ans;
    }
};
