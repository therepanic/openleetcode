class Solution {
    public boolean hasAllCodes(String s, int k) {
        int req = 1 << k;
        boolean[] seen = new boolean[req];
        int mask = req - 1;
        int h = 0;

        for (int i = 0; i < s.length(); i++) {
            h = ((h << 1) & mask) | (s.charAt(i) & 1);

            if (i >= k - 1 && !seen[h]) {
                seen[h] = true;
                req--;
                if (req == 0) return true;
            }
        }

        return false;
    }
}
