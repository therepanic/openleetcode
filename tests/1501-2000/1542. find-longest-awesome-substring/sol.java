class Solution {
    public int longestAwesome(String s) {
        int n = s.length();
        HashMap<Integer, Integer> mask = new HashMap<>();
        int curMask = 0;
        mask.put(curMask, -1);
        int ans = 1;
        for (int i = 0; i < n; i++) {
            int num = s.charAt(i) - '0';
            curMask ^= (1 << num);
            int needMask = curMask;
            if (mask.containsKey(needMask)) {
                ans = Math.max(ans, i - mask.get(needMask));
            }
            for (int bit = 0; bit < 10; bit++) {
                int nNeedMax = needMask ^ (1 << bit);
                if (mask.containsKey(nNeedMax)) {
                    ans = Math.max(ans, i - mask.get(nNeedMax));
                }
            }
            if (!mask.containsKey(curMask)) {
                mask.put(curMask, i);
            }
        }
        return ans;
    }
}
