public class Solution {
    public bool ThreeConsecutiveOdds(int[] arr) {
        string s = string.Concat(arr.Select(x => (x & 1).ToString()));
        return s.Contains("111");
    }
}
