public class Solution {
    public IList<int> CircularPermutation(int n, int start) {
        IList<int> result = new List<int>();
        for (int i = 0; i < (1 << n); i++) {
            result.Add(start ^ (i ^ (i >> 1)));
        }
        return result;
    }
}
