public class Solution {
    public int ClosestCost(int[] baseCosts, int[] toppingCosts, int target) {
        List<int> s = new List<int>(){0};
        foreach (int i in toppingCosts) {
            var ss = new List<int>();
            foreach (int j in s) {
                ss.Add(j);
                ss.Add(j+i);
                ss.Add(j+2*i);
            }
            s = ss;
        }
        s.Sort();
        int ans = 1000000000;
        int fans = 1000000000;
        int n = s.Count;
        foreach (int i in baseCosts) {
            int j = target - i;
            int x = s.BinarySearch(j);
            if (x < 0) x = ~x - 1;
            if (x < 0) x = 0;
            int ans1 = Math.Abs(j - s[x]);
            if (ans1 < ans) {
                ans = ans1;
                fans = s[x] + i;
            } else if (ans1 == ans) {
                fans = Math.Min(fans, s[x] + i);
            }
            if (x+1 < n) {
                x++;
                ans1 = Math.Abs(j - s[x]);
                if (ans1 < ans) {
                    ans = ans1;
                    fans = s[x] + i;
                } else if (ans1 == ans) {
                    fans = Math.Min(fans, s[x] + i);
                }
            }
        }
        return fans;
    }
}
