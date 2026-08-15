class Solution {
public:
    int maxSumRangeQuery(vector<int>& nums, vector<vector<int>>& requests) {
        vector<pair<int, int>> events;
        const int MOD = 1e9+7;
        
        for (auto& req : requests) {
            events.push_back({req[0], 1});
            events.push_back({req[1]+1, -1});
        }
        
        sort(events.begin(), events.end());
        
        int cnt = 0;
        int prev = -1;
        unordered_map<long long, long long> weight;
        
        for (auto& [pos, delta] : events) {
            if (prev != -1 && cnt != 0) {
                weight[cnt] += pos - prev;
            }
            prev = pos;
            cnt += delta;
        }
        
        vector<pair<long long, long long>> wList(weight.begin(), weight.end());
        sort(wList.begin(), wList.end(), [](auto& a, auto& b) {
            return a.first > b.first;
        });
        
        sort(nums.rbegin(), nums.rend());
        long long ans = 0;
        int idx = 0;
        
        for (auto& [wg, num] : wList) {
            for (long long i = 0; i < num; i++) {
                ans = (ans + nums[idx] * wg) % MOD;
                idx++;
            }
        }
        
        return ans;
    }
};
