public class Solution {
    public int SuperpalindromesInRange(string left, string right) {
        long L = long.Parse(left);
        long R = long.Parse(right);
        int count = 0;
        for (int i = 1; i <= 100000; i++) {
            string s = i.ToString();
            char[] charArray = s.ToCharArray();
            Array.Reverse(charArray);
            string rev = new string(charArray);
            long val1 = long.Parse(s + rev);
            long val2 = long.Parse(s + rev.Substring(1));
            long sqval1 = val1 * val1;
            long sqval2 = val2 * val2;
            if (L <= sqval1 && sqval1 <= R) {
                string ssqval1 = sqval1.ToString();
                charArray = ssqval1.ToCharArray();
                Array.Reverse(charArray);
                if (ssqval1 == new string(charArray)) {
                    count++;
                }
            }
            if (L <= sqval2 && sqval2 <= R) {
                string ssqval2 = sqval2.ToString();
                charArray = ssqval2.ToCharArray();
                Array.Reverse(charArray);
                if (ssqval2 == new string(charArray)) {
                    count++;
                }
            }
            if (val2 > R) {
                break;
            }
        }
        return count;
    }
}
