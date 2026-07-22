class Solution {
    public List<Boolean> canMakePaliQueries(String s, int[][] queries) {
        int n = s.length();
        int[] prefix = new int[n + 1];
        
        for (int i = 0; i < n; i++) {
            int bit = 1 << (s.charAt(i) - 'a');
            prefix[i + 1] = prefix[i] ^ bit;
        }
        
        List<Boolean> res = new ArrayList<>();
        
        for (int[] query : queries) {
            int left = query[0];
            int right = query[1];
            int ki = query[2];
            
            int mask = prefix[right + 1] ^ prefix[left];
            int oddCount = Integer.bitCount(mask);
            
            if (oddCount <= 1 || ki >= oddCount / 2) {
                res.add(true);
            } else {
                res.add(false);
            }
        }
        
        return res;
    }
}
