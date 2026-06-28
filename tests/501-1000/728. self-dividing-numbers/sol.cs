public class Solution {
    public IList<int> SelfDividingNumbers(int left, int right) {
        IList<int> lst = new List<int>();
        for (int i = left; i <= right; i++) {
            string s = i.ToString();
            if (s.Contains('0')) continue;
            int b = 1;
            foreach (char c in s) {
                int digit = c - '0';
                if (i % digit != 0) {
                    b = 0;
                    break;
                }
            }
            if (b == 1) lst.Add(i);
        }
        return lst;
    }
}
