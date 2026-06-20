public class Solution {
    public int GetMaxRepetitions(string s1, int n1, string s2, int n2) {
        int m = s1.Length;
        int n = s2.Length;
        
        if ((long)m * n1 < (long)n * n2) {
            return 0;
        }
        
        int j = 0;
        int cnt = 0;
        int k = 0;
        
        Dictionary<int, (int, int)> seen = new Dictionary<int, (int, int)>();
        
        while (k < n1) {
            foreach (char ch in s1) {
                if (ch == s2[j]) {
                    j++;
                    if (j == n) {
                        cnt++;
                        j = 0;
                    }
                }
            }
            
            k++;
            
            if (seen.ContainsKey(j)) {
                var (prevCnt, prevK) = seen[j];
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
                seen[j] = (cnt, k);
            }
        }
        
        return cnt / n2;
    }
}
