public class Solution {
    public bool AreSentencesSimilar(string sentence1, string sentence2) {
        string[] s1 = sentence1.Split(' ');
        string[] s2 = sentence2.Split(' ');
        
        int l1 = 0, l2 = 0, r1 = s1.Length - 1, r2 = s2.Length - 1;
        
        while (l1 <= r1 && l2 <= r2) {
            if (s1[l1] == s2[l2]) {
                l1++;
                l2++;
            } else if (s1[r1] == s2[r2]) {
                r1--;
                r2--;
            } else {
                return false;
            }
        }
        
        return true;
    }
}
