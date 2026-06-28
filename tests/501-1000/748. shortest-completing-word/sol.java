class Solution {
    public String shortestCompletingWord(String licensePlate, String[] words) {
        int[] lp = new int[26];
        for (char c : licensePlate.toLowerCase().toCharArray()) {
            if (Character.isLetter(c)) {
                lp[c - 'a']++;
            }
        }
        String ans = null;
        for (String w : words) {
            int[] cw = new int[26];
            for (char c : w.toCharArray()) {
                cw[c - 'a']++;
            }
            boolean ok = true;
            for (int i = 0; i < 26; i++) {
                if (cw[i] < lp[i]) {
                    ok = false;
                    break;
                }
            }
            if (ok && (ans == null || w.length() < ans.length())) {
                ans = w;
            }
        }
        return ans;
    }
}
