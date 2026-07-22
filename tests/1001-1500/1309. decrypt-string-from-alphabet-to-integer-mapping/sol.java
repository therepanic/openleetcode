class Solution {
    public String freqAlphabets(String s) {
        StringBuilder decoded = new StringBuilder();
        int index = 0;
        while (index < s.length()) {
            if (index + 2 < s.length() && s.charAt(index + 2) == '#') {
                int num = Integer.parseInt(s.substring(index, index + 2));
                decoded.append((char) ('a' + num - 1));
                index += 3;
            } else {
                int num = s.charAt(index) - '0';
                decoded.append((char) ('a' + num - 1));
                index += 1;
            }
        }
        return decoded.toString();
    }
}
