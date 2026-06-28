public class Solution {
    public char NextGreatestLetter(char[] letters, char target) {
        char res = letters[0];
        bool flag = false;

        foreach (char ch in letters) {
            if (!flag) {
                if (ch > target) {
                    res = ch;
                    flag = !flag;
                }
            } else {
                if (ch > target && ch < res) {
                    res = ch;
                }
            }
        }

        return res;
    }
}
