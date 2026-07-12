class Solution {
public:
    bool splitArraySameAverage(vector<int>& nums) {
        int n = nums.size();
        if (n < 2) return false;
        int total = accumulate(nums.begin(), nums.end(), 0);
        vector<int> transformed(n);
        for (int i = 0; i < n; i++) {
            transformed[i] = nums[i] * n - total;
        }
        
        int mid = n >> 1;
        auto generate = [](const vector<int>& arr) -> unordered_map<int, unordered_set<int>> {
            unordered_map<int, unordered_set<int>> mp;
            int len = arr.size();
            for (int mask = 1; mask < (1 << len); mask++) {
                int sum = 0, cnt = 0;
                for (int i = 0; i < len; i++) {
                    if (mask & (1 << i)) {
                        sum += arr[i];
                        cnt++;
                    }
                }
                mp[cnt].insert(sum);
            }
            return mp;
        };
        
        auto mpA = generate(vector<int>(transformed.begin(), transformed.begin() + mid));
        auto mpB = generate(vector<int>(transformed.begin() + mid, transformed.end()));
        
        for (auto& [cnt, st] : mpA) {
            if (st.count(0) && cnt != 0) return true;
        }
        for (auto& [cnt, st] : mpB) {
            if (st.count(0) && cnt != 0) return true;
        }
        
        for (auto& [cntA, stA] : mpA) {
            for (auto& [cntB, stB] : mpB) {
                int totalCnt = cntA + cntB;
                if (totalCnt == 0 || totalCnt == n) continue;
                for (int val : stA) {
                    if (stB.count(-val)) return true;
                }
            }
        }
        return false;
    }
};
