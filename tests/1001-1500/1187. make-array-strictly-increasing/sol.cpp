class Solution {
public:
    int makeArrayIncreasing(vector<int>& arr1, vector<int>& arr2) {
        sort(arr2.begin(), arr2.end());
        arr2.erase(unique(arr2.begin(), arr2.end()), arr2.end());
        map<pair<int, long long>, int> memo;
        
        function<int(int, long long)> dfs = [&](int i, long long prevMax) -> int {
            if (i == arr1.size()) return 0;
            
            auto key = make_pair(i, prevMax);
            if (memo.count(key)) return memo[key];
            
            int j = upper_bound(arr2.begin(), arr2.end(), prevMax) - arr2.begin();
            
            int ans = INT_MAX / 2;
            if (arr1[i] > prevMax) {
                ans = min(ans, dfs(i + 1, arr1[i]));
            }
            if (j < arr2.size()) {
                ans = min(ans, dfs(i + 1, arr2[j]) + 1);
            }
            
            return memo[key] = ans;
        };
        
        int ops = dfs(0, LLONG_MIN);
        return ops >= INT_MAX / 2 ? -1 : ops;
    }
};
