public class Solution {
    public string NearestPalindromic(string n) {
        long num = long.Parse(n);

        long Pow10(int exp) {
            long value = 1;
            for (int i = 0; i < exp; i++) {
                value *= 10;
            }
            return value;
        }

        string Reverse(string s) {
            char[] chars = s.ToCharArray();
            System.Array.Reverse(chars);
            return new string(chars);
        }

        string MakePalindrome(string left) {
            string rightSource = n.Length % 2 == 0 ? left : left.Substring(0, left.Length - 1);
            return left + Reverse(rightSource);
        }

        int prefixLen = (n.Length + 1) / 2;
        var candidates = new System.Collections.Generic.HashSet<long> {
            Pow10(n.Length - 1) - 1,
            Pow10(n.Length) + 1
        };
        long prefix = long.Parse(n.Substring(0, prefixLen));
        for (long delta = -1; delta <= 1; delta++) {
            if (prefix + delta >= 0) {
                string left = (prefix + delta).ToString();
                if (left.Length == prefixLen) {
                    candidates.Add(long.Parse(MakePalindrome(left)));
                }
            }
        }

        long best = -1;
        foreach (long candidate in candidates) {
            if (candidate == num) {
                continue;
            }
            if (best == -1 ||
                System.Math.Abs(candidate - num) < System.Math.Abs(best - num) ||
                (System.Math.Abs(candidate - num) == System.Math.Abs(best - num) && candidate < best)) {
                best = candidate;
            }
        }

        return best.ToString();
    }
}
