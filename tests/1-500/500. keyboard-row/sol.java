class Solution {
    public String[] findWords(String[] words) {
        int[] m = new int[26];
        for (char c : "qwertyuiop".toCharArray()) m[c - 'a'] = 1;
        for (char c : "asdfghjkl".toCharArray()) m[c - 'a'] = 2;
        for (char c : "zxcvbnm".toCharArray()) m[c - 'a'] = 3;
        List<String> ans = new ArrayList<>();
        for (String w : words) {
            String lw = w.toLowerCase();
            int r = m[lw.charAt(0) - 'a'];
            boolean ok = true;
            for (char ch : lw.toCharArray()) {
                if (m[ch - 'a'] != r) {
                    ok = false;
                    break;
                }
            }
            if (ok) ans.add(w);
        }
        return ans.toArray(new String[0]);
    }
}
