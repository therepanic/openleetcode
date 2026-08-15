class Solution {
public:
    vector<int> countPairs(int n, vector<vector<int>>& edges, vector<int>& queries) {
        unordered_map<int, unordered_set<int>> x;
        vector<int> edge(n, 0);
        unordered_map<pair<int,int>, int, hash_pair> edgePair;

        for (auto& e : edges) {
            int i = e[0] - 1;
            int j = e[1] - 1;
            x[i].insert(j);
            x[j].insert(i);
            edge[i]++;
            edge[j]++;
            edgePair[{i, j}]++;
            edgePair[{j, i}]++;
        }
        
        vector<int> res = edge;
        sort(res.begin(), res.end());
        
        auto binse = [&](int threshold) -> int {
            int i = 0, j = n - 1;
            int ans = n;
            while (i <= j) {
                int mid = (i + j) / 2;
                if (res[mid] > threshold) {
                    ans = mid;
                    j = mid - 1;
                } else {
                    i = mid + 1;
                }
            }
            return n - ans;
        };
        
        vector<int> result;
        for (int query : queries) {
            unordered_set<int> v;
            int ans = 0;
            
            function<void(int)> f = [&](int i) {
                v.insert(i);
                int a = binse(query - edge[i]);
                
                if (edge[i] > query - edge[i]) {
                    a--;
                }
                
                for (int j : x[i]) {
                    if (edge[j] > query - edge[i] && edge[j] - edgePair[{i, j}] <= query - edge[i]) {
                        a--;
                    }
                    if (v.find(j) == v.end()) {
                        f(j);
                    }
                }
                ans += a;
            };
            
            for (int j = 0; j < n; j++) {
                if (v.find(j) == v.end()) {
                    f(j);
                }
            }
            result.push_back(ans / 2);
        }
        
        return result;
    }
    
private:
    struct hash_pair {
        template <class T1, class T2>
        size_t operator()(const pair<T1, T2>& p) const {
            auto hash1 = hash<T1>{}(p.first);
            auto hash2 = hash<T2>{}(p.second);
            return hash1 ^ hash2;
        }
    };
};
