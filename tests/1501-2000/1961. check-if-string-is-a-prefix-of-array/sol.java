class Solution {
    public boolean isPrefixString(String s, String[] words) {
        StringBuilder res = new StringBuilder();
        int i = 0;
        while (res.length() < s.length()) {
            if (i >= words.length) return false;
            res.append(words[i]);
            i++;
        }
        return res.toString().equals(s);
    }
}
