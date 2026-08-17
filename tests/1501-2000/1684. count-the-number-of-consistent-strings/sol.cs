public class Solution {
    public int CountConsistentStrings(string allowed, string[] words) {
        int result = 0;
        var allowedSet = new HashSet<char>(allowed);
        foreach (string word in words) {
            bool allIn = true;
            foreach (char c in word) {
                if (!allowedSet.Contains(c)) {
                    allIn = false;
                    break;
                }
            }
            if (allIn) result++;
        }
        return result;
    }
}
