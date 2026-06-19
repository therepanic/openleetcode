class Solution {
    public int compress(char[] chars) {
        int i = 0, j = 0;
        while (j < chars.length) {
            char c = chars[j];
            int count = 0;
            while (j < chars.length && chars[j] == c) {
                j++;
                count++;
            }
            chars[i++] = c;
            if (count > 1) {
                for (char ch : String.valueOf(count).toCharArray()) {
                    chars[i++] = ch;
                }
            }
        }
        return i;
    }
}
