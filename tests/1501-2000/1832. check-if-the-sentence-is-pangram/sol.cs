public class Solution {
    public bool CheckIfPangram(string sentence) {
        if (sentence.Length < 26) return false;
        
        for (int i = 0; i < 26; i++) {
            if (!sentence.Contains((char)(97+i))) return false;
        }
        return true;
    }
}
