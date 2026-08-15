class Solution {
    public String longestNiceSubstring(String s) {
        int len_s = s.length();
        if (len_s <= 1) return "";

        java.util.HashMap<Character, Integer> charToFreqMap = new java.util.HashMap<>();
        for (char c : s.toCharArray()) {
            charToFreqMap.put(c, charToFreqMap.getOrDefault(c, 0) + 1);
        }
        
        boolean isBroken = false;
        int i = 0;
        while (i < s.length()) {
            char ch = s.charAt(i);
            if (Character.isLowerCase(ch) && charToFreqMap.containsKey(Character.toUpperCase(ch))) {
                // pass
            } else if (Character.isUpperCase(ch) && charToFreqMap.containsKey(Character.toLowerCase(ch))) {
                // pass
            } else {
                isBroken = true;
                break;
            }
            i++;
        }

        if (!isBroken) return s;
        
        String longestNiceSubstr1 = longestNiceSubstring(s.substring(0, i));
        String longestNiceSubstr2 = longestNiceSubstring(s.substring(i + 1));
        
        return longestNiceSubstr1.length() >= longestNiceSubstr2.length() ? longestNiceSubstr1 : longestNiceSubstr2;
    }
}
