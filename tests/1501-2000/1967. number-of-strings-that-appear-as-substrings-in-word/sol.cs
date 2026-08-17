public class Solution {
    public int NumOfStrings(string[] patterns, string word) {
        int count = 0;
        foreach (string s in patterns) {
            if (word.Contains(s)) {
                count++;
            }
        }
        return count;
    }
}
