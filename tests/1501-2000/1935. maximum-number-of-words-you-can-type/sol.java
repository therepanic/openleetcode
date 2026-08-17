class Solution {
    public int canBeTypedWords(String text, String brokenLetters) {
        boolean[] b = new boolean[26];
        int res = 0;

        for (char c : brokenLetters.toCharArray()) {
            b[c - 'a'] = true;
        }

        for (String w : text.split(" ")) {
            boolean ok = true;
            for (char c : w.toCharArray()) {
                if (b[c - 'a']) {
                    ok = false;
                    break;
                }
            }
            if (ok) {
                res++;
            }
        }

        return res;
    }
}
