class Solution {
public:
    int maxPerformance(int n, vector<int>& speed, vector<int>& efficiency, int k) {
        const int MOD = 1000000007;
        vector<pair<int, int>> engineers;
        for (int i = 0; i < n; i++) {
            engineers.push_back({efficiency[i], speed[i]});
        }
        sort(engineers.begin(), engineers.end(), [](auto& a, auto& b) {
            return a.first > b.first;
        });
        
        priority_queue<int, vector<int>, greater<int>> pq;
        long long curSum = 0;
        long long ans = 0;
        
        for (auto& [e, s] : engineers) {
            while (pq.size() > k - 1) {
                curSum -= pq.top();
                pq.pop();
            }
            pq.push(s);
            curSum += s;
            ans = max(ans, curSum * e);
        }
        
        return ans % MOD;
    }
};
