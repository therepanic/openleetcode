class Solution {
    public int getMaxRepetitions(String s1, int n1, String s2, int n2) {
        int m = s1.length();
        int n = s2.length();
        
        if ((long) m * n1 < (long) n * n2) {
            return 0;
        }
        
        int j = 0;
        int cnt = 0;
        int k = 0;
        
        Map<Integer, int[]> seen = new HashMap<>();
        
        while (k < n1) {
            for (char ch : s1.toCharArray()) {
                if (ch == s2.charAt(j)) {
                    j++;
                    if (j == n) {
                        cnt++;
                        j = 0;
                    }
                }
            }
            
            k++;
            
            if (seen.containsKey(j)) {
                int[] prev = seen.get(j);
                int prevCnt = prev[0];
                int prevK = prev[1];
                
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
                seen.put(j, new int[]{cnt, k});
            }
        }
        
        return cnt / n2;
    }
}
