class Solution {
    public int findTheLongestSubstring(String s) {
        int[] mapy = new int[32];
        for (int i = 0; i < 32; i++) mapy[i] = -2;
        mapy[0] = -1;

        int res = 0;
        int mask = 0;

        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c == 'a') mask ^= 1;
            else if (c == 'e') mask ^= 2;
            else if (c == 'i') mask ^= 4;
            else if (c == 'o') mask ^= 8;
            else if (c == 'u') mask ^= 16;

            int prev = mapy[mask];
            if (prev == -2) mapy[mask] = i;
            else res = Math.max(res, i - prev);
        }

        return res;
    }
}
