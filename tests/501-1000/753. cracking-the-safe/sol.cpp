class Solution {
public:
    string crackSafe(int n, int k) {
        if (n == 1) {
            string res;
            for (int i = 0; i < k; ++i) {
                res += to_string(i);
            }
            return res;
        }
        
        unordered_map<string, vector<int>> adj;
        string startNode(n - 1, '0');
        string res;
        
        function<void(string)> visit = [&](string node) {
            if (!adj.count(node)) {
                for (int i = k - 1; i >= 0; --i) {
                    adj[node].push_back(i);
                }
            }
            while (!adj[node].empty()) {
                int digit = adj[node].back();
                adj[node].pop_back();
                string nextNode = node + to_string(digit);
                nextNode = nextNode.substr(1);
                visit(nextNode);
                res += to_string(digit);
            }
        };
        
        visit(startNode);
        return res + startNode;
    }
};
