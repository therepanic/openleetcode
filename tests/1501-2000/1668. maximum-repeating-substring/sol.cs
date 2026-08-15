public class Solution {
    public int MaxRepeating(string sequence, string word) {
        string temp = word;
        int res = 0;
        while (sequence.Contains(temp)) {
            res++;
            temp += word;
        }
        return res;
    }
}
