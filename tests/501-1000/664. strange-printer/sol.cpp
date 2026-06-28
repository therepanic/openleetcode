class Solution {
public:
    int strangePrinter(string s) {
        int n = s.length();
        vector<vector<int>> memo(n, vector<int>(n, -1));
        return minTurns(s, 0, n - 1, memo);
    }
    
private:
    int minTurns(const string& s, int start, int end, vector<vector<int>>& memo) {
        if (start > end) {
            return 0;
        }
        
        if (memo[start][end] != -1) {
            return memo[start][end];
        }
        
        int res = minTurns(s, start, end - 1, memo) + 1;
        
        for (int middle = start; middle < end; middle++) {
            if (s[middle] == s[end]) {
                res = min(res, minTurns(s, start, middle, memo) + minTurns(s, middle + 1, end - 1, memo));
            }
        }
        
        memo[start][end] = res;
        return res;
    }
};
