class Solution {
public:
    int minNumberOfSemesters(int n, vector<vector<int>>& relations, int k) {
        vector<vector<int>> graph(n);
        vector<int> inDegrees(n, 0);
        for (auto& rel : relations) {
            int prev = rel[0] - 1;
            int next = rel[1] - 1;
            inDegrees[next]++;
            graph[prev].push_back(next);
        }
        
        unordered_map<string, int> memo;
        
        function<int(int, vector<int>)> recurse = [&](int mask, vector<int> inDeg) -> int {
            if (mask == 0) return 0;
            string key = to_string(mask) + "-";
            for (int d : inDeg) key += to_string(d) + ",";
            if (memo.count(key)) return memo[key];
            
            vector<int> nodes;
            for (int i = 0; i < n; i++) {
                if ((mask & (1 << i)) && inDeg[i] == 0) {
                    nodes.push_back(i);
                }
            }
            
            int ans = INT_MAX;
            int combLimit = min(k, (int)nodes.size());
            vector<vector<int>> combos = getCombinations(nodes, combLimit);
            for (auto& kNodes : combos) {
                int newMask = mask;
                vector<int> newInDeg = inDeg;
                for (int node : kNodes) {
                    newMask ^= (1 << node);
                    for (int child : graph[node]) {
                        newInDeg[child]--;
                    }
                }
                ans = min(ans, 1 + recurse(newMask, newInDeg));
            }
            return memo[key] = ans;
        };
        
        return recurse((1 << n) - 1, inDegrees);
    }
    
private:
    vector<vector<int>> getCombinations(vector<int>& arr, int k) {
        vector<vector<int>> result;
        vector<int> current;
        function<void(int)> backtrack = [&](int start) {
            if (current.size() == k) {
                result.push_back(current);
                return;
            }
            for (int i = start; i < arr.size(); i++) {
                current.push_back(arr[i]);
                backtrack(i + 1);
                current.pop_back();
            }
        };
        backtrack(0);
        return result;
    }
};
