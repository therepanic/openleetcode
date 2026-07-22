class Solution {
public:
    int maxLength(vector<string>& arr) {
        int ans = 0;
        int n = arr.size();

        function<void(int, string)> dfs = [&](int i, string path) {
            ans = max(ans, (int)path.size());
            for (int j = i; j < n; j++) {
                string s = arr[j];
                unordered_set<char> us(s.begin(), s.end());
                if (us.size() != s.size()) continue;
                bool hasCommon = false;
                for (char c : s) {
                    if (path.find(c) != string::npos) {
                        hasCommon = true;
                        break;
                    }
                }
                if (hasCommon) continue;
                dfs(j + 1, path + s);
            }
        };

        dfs(0, "");
        return ans;
    }
};
