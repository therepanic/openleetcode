public class Solution {
    public IList<int> AddToArrayForm(int[] num, int k) {
        List<int> result = new List<int>();
        int i = num.Length - 1;
        while (i >= 0 || k > 0) {
            if (i >= 0) {
                k += num[i--];
            }
            result.Add(k % 10);
            k /= 10;
        }
        if (result.Count == 0) {
            result.Add(0);
        }
        result.Reverse();
        return result;
    }
}
