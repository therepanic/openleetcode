class Solution {
    public String minInteger(String num, int k) {
        int n = num.length();
        java.util.Map<Character, java.util.ArrayDeque<Integer>> dict = new java.util.HashMap<>();
        for (int i = 0; i < n; i++) {
            char ch = num.charAt(i);
            dict.computeIfAbsent(ch, key -> new java.util.ArrayDeque<>()).addLast(i);
        }
        
        int[] bit = new int[n + 1];
        for (int i = 1; i <= n; i++) {
            update(bit, i, 1);
        }
        
        StringBuilder res = new StringBuilder();
        for (int pos = 0; pos < n; pos++) {
            for (char v = '0'; v <= '9'; v++) {
                java.util.ArrayDeque<Integer> dq = dict.get(v);
                if (dq != null && !dq.isEmpty()) {
                    int idx = dq.peekFirst();
                    int cnt = query(bit, idx);
                    if (cnt <= k) {
                        dq.pollFirst();
                        k -= cnt;
                        res.append(v);
                        update(bit, idx + 1, -1);
                        break;
                    }
                }
            }
        }
        return res.toString();
    }
    
    private void update(int[] bit, int i, int val) {
        while (i < bit.length) {
            bit[i] += val;
            i += i & -i;
        }
    }
    
    private int query(int[] bit, int i) {
        int total = 0;
        while (i > 0) {
            total += bit[i];
            i -= i & -i;
        }
        return total;
    }
}
