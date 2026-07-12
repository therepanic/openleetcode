class Solution {
public:
    int bagOfTokensScore(vector<int>& tokens, int power) {
        sort(tokens.begin(), tokens.end());
        int n = tokens.size();
        int l = 0;
        int curr = 0;
        
        while (l < n && tokens[l] <= power) {
            power -= tokens[l];
            l++;
            curr++;
        }
        
        int r = n - 1;
        int res = curr;
        
        while (l < r && curr > 0) {
            power += tokens[r];
            curr--;
            r--;
            
            while (l <= r && tokens[l] <= power) {
                power -= tokens[l];
                l++;
                curr++;
            }
            res = max(res, curr);
        }
        
        return res;
    }
};
