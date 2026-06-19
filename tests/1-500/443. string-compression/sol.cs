public class Solution {
    public int Compress(char[] chars) {
        int i = 0, j = 0;
        while (j < chars.Length) {
            char c = chars[j];
            int count = 0;
            while (j < chars.Length && chars[j] == c) {
                j++;
                count++;
            }
            chars[i++] = c;
            if (count > 1) {
                foreach (char ch in count.ToString()) {
                    chars[i++] = ch;
                }
            }
        }
        return i;
    }
}
