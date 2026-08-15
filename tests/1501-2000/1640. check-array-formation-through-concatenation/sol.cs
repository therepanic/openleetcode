public class Solution {
    public bool CanFormArray(int[] arr, int[][] pieces) {
        List<int> a = new List<int>();
        List<int[]> remaining = pieces.ToList();
        foreach (int i in arr) {
            for (int j = 0; j < remaining.Count; j++) {
                if (remaining[j].Contains(i)) {
                    a.AddRange(remaining[j]);
                    remaining.RemoveAt(j);
                    break;
                }
            }
        }
        if (a.Count != arr.Length) return false;
        for (int idx = 0; idx < a.Count; idx++) {
            if (a[idx] != arr[idx]) return false;
        }
        return true;
    }
}
