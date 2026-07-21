class Solution {
    public int countCharacters(String[] words, String chars) {
        int[] ch = new int[26];
        for (char c : chars.toCharArray()) {
            ch[c - 'a']++;
        }
        
        int res = 0;
        for (String word : words) {
            int[] copy = ch.clone();
            boolean good = true;
            for (char c : word.toCharArray()) {
                if (copy[c - 'a'] > 0) {
                    copy[c - 'a']--;
                } else {
                    res -= word.length();
                    good = false;
                    break;
                }
            }
            res += word.length();
        }
        return res;
    }
}
