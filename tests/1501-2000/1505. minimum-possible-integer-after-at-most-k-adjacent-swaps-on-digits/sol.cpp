class Solution {
public:
    string minInteger(string num, int k) {
        int n = num.size();
        unordered_map<char, deque<int>> dict;
        for (int i = 0; i < n; i++) {
            dict[num[i]].push_back(i);
        }
        
        vector<int> bit(n + 1, 0);
        auto update = [&](int i, int val) {
            while (i < bit.size()) {
                bit[i] += val;
                i += i & -i;
            }
        };
        auto query = [&](int i) {
            int total = 0;
            while (i > 0) {
                total += bit[i];
                i -= i & -i;
            }
            return total;
        };
        
        for (int i = 1; i <= n; i++) update(i, 1);
        
        string res;
        for (int pos = 0; pos < n; pos++) {
            for (char v = '0'; v <= '9'; v++) {
                if (!dict[v].empty()) {
                    int idx = dict[v].front();
                    int cnt = query(idx);
                    if (cnt <= k) {
                        dict[v].pop_front();
                        k -= cnt;
                        res += v;
                        update(idx + 1, -1);
                        break;
                    }
                }
            }
        }
        return res;
    }
};
