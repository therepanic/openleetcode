class Solution {
public:
    int stoneGameV(vector<int>& stoneValue) {
        int n = stoneValue.size();
        vector<int> sv(n + 1, 0);
        for (int i = 0; i < n; ++i) sv[i + 1] = sv[i] + stoneValue[i];
        vector<vector<int>> memo(n + 1, vector<int>(n + 1, -1));
        return helper(sv, 0, n, memo);
    }
    
private:
    int helper(vector<int>& sv, int fro, int to, vector<vector<int>>& memo) {
        if (to - fro == 1) return 0;
        if (memo[fro][to] != -1) return memo[fro][to];
        
        int target = (sv[to] + sv[fro]) / 2;
        int lo = fro, hi = to;
        while (lo < hi) {
            int mid = (lo + hi) / 2;
            if (sv[mid] < target) lo = mid + 1;
            else hi = mid;
        }
        int mid = lo;
        
        int dist = 0;
        int res = 0;
        bool explore_more = true;
        while (explore_more) {
            explore_more = false;
            vector<int> candidates = {mid - dist, mid + dist};
            for (int i : candidates) {
                if (fro < i && i <= to) {
                    int left = sv[i] - sv[fro];
                    int right = sv[to] - sv[i];
                    if (res / 2 <= left && left <= right) {
                        res = max(res, left + helper(sv, fro, i, memo));
                        explore_more = true;
                    }
                    if (left >= right && right >= res / 2) {
                        res = max(res, right + helper(sv, i, to, memo));
                        explore_more = true;
                    }
                }
            }
            dist++;
        }
        memo[fro][to] = res;
        return res;
    }
};
