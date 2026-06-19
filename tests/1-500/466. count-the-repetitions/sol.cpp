class Solution {
public:
    int countTheRepetitions(string s1, int n1, string s2, int n2) {
        int m = s1.size();
        int n = s2.size();
        
        if ((long long)m * n1 < (long long)n * n2) {
            return 0;
        }
        
        int j = 0;
        int cnt = 0;
        int k = 0;
        
        unordered_map<int, pair<int, int>> seen;
        
        while (k < n1) {
            for (char ch : s1) {
                if (ch == s2[j]) {
                    j++;
                    if (j == n) {
                        cnt++;
                        j = 0;
                    }
                }
            }
            
            k++;
            
            if (seen.find(j) != seen.end()) {
                auto [prevCnt, prevK] = seen[j];
                int periodK = k - prevK;
                int periodCnt = cnt - prevCnt;
                
                if (periodCnt == 0) {
                    break;
                }
                
                int remaining = n1 - k;
                int cycles = remaining / periodK;
                
                cnt += cycles * periodCnt;
                k += cycles * periodK;
            } else {
                seen[j] = {cnt, k};
            }
        }
        
        return cnt / n2;
    }
};
