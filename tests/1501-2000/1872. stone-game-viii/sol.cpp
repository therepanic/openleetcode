class Solution {
public:
    int stoneGameVIII(vector<int>& stones) {
        int n = stones.size();
        vector<int> prefix = stones;
        for (int i = 1; i < n; i++) {
            prefix[i] += prefix[i-1];
        }
        vector<int> memo(n, INT_MIN);
        
        function<int(int)> rec = [&](int i) -> int {
            if (i == n - 2) return prefix[i+1];
            if (memo[i] != INT_MIN) return memo[i];
            int aliceCont = rec(i+1);
            int aliceDone = prefix[i+1] - rec(i+1);
            memo[i] = max(aliceCont, aliceDone);
            return memo[i];
        };
        
        return rec(0);
    }
};
