class Solution {
    public int[] numsSameConsecDiff(int n, int k) {
        Set<Integer> res = new HashSet<>();
        for (int x = 1; x <= 9; x++) {
            res.add(x);
        }
        n -= 1;
        
        while (n > 0) {
            Set<Integer> next = new HashSet<>();
            for (int val : res) {
                int last = val % 10;
                if (last + k < 10) {
                    next.add(val * 10 + last + k);
                }
                if (last - k >= 0) {
                    next.add(val * 10 + last - k);
                }
            }
            res = next;
            n -= 1;
        }
        
        int[] result = new int[res.size()];
        int i = 0;
        for (int val : res) {
            result[i++] = val;
        }
        return result;
    }
}
