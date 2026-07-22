public class Solution {
    public IList<IList<int>> MinimumAbsDifference(int[] arr) {
        Array.Sort(arr);
        int minDiff = int.MaxValue;
        for (int i = 1; i < arr.Length; i++) {
            minDiff = Math.Min(minDiff, arr[i] - arr[i - 1]);
        }
        IList<IList<int>> result = new List<IList<int>>();
        for (int i = 1; i < arr.Length; i++) {
            if (arr[i] - arr[i - 1] == minDiff) {
                result.Add(new List<int> { arr[i - 1], arr[i] });
            }
        }
        return result;
    }
}
