class Solution {
public:
    bool validateBinaryTreeNodes(int n, vector<int>& leftChild, vector<int>& rightChild) {
        vector<int> inDegree(n, 0);
        for (int i = 0; i < n; i++) {
            for (int child : {leftChild[i], rightChild[i]}) {
                if (child != -1) {
                    if (child < 0 || child >= n) return false;
                    inDegree[child]++;
                    if (inDegree[child] > 1) return false;
                }
            }
        }

        int root = -1;
        for (int i = 0; i < n; i++) {
            if (inDegree[i] == 0) {
                if (root != -1) return false;
                root = i;
            }
        }
        if (root == -1) return false;

        queue<int> q;
        vector<bool> visited(n, false);
        q.push(root);
        visited[root] = true;
        int count = 1;

        while (!q.empty()) {
            int node = q.front();
            q.pop();
            for (int child : {leftChild[node], rightChild[node]}) {
                if (child == -1) continue;
                if (visited[child]) return false;
                visited[child] = true;
                count++;
                q.push(child);
            }
        }
        return count == n;
    }
};
