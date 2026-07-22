class Solution {
    public List<String> printVertically(String s) {
        String[] words = s.split(" ");
        int maxLen = 0;
        for (String word : words) {
            if (word.length() > maxLen) {
                maxLen = word.length();
            }
        }
        List<String> res = new ArrayList<>();
        for (int i = 0; i < maxLen; i++) {
            StringBuilder currWord = new StringBuilder();
            for (String word : words) {
                if (i < word.length()) {
                    currWord.append(word.charAt(i));
                } else {
                    currWord.append(' ');
                }
            }
            String str = currWord.toString();
            while (str.endsWith(" ")) {
                str = str.substring(0, str.length() - 1);
            }
            res.add(str);
        }
        return res;
    }
}
