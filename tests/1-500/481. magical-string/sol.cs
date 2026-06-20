public class Solution {
    public int MagicalString(int n) {
        if (n <= 0) return 0;
        if (n <= 3) return 1;
        List<int> s = new List<int> {1, 2, 2};
        int i = 2;
        while (s.Count < n) {
            int nextVal = 3 - s[s.Count - 1];
            int count = s[i];
            for (int j = 0; j < count && s.Count < n; j++) {
                s.Add(nextVal);
            }
            i++;
        }
        int ones = 0;
        for (int j = 0; j < n; j++) {
            if (s[j] == 1) ones++;
        }
        return ones;
    }
}
