public class Solution {
    public int MinOperations(int[] target, int[] arr) {
        var targetIndexMap = new Dictionary<int, int>();
        for (int i = 0; i < target.Length; i++) {
            targetIndexMap[target[i]] = i;
        }
        
        var transformedArr = new List<int>();
        foreach (int num in arr) {
            if (targetIndexMap.ContainsKey(num)) {
                transformedArr.Add(targetIndexMap[num]);
            }
        }
        
        var lis = new List<int>();
        foreach (int index in transformedArr) {
            int pos = lis.BinarySearch(index);
            if (pos < 0) pos = ~pos;
            if (pos == lis.Count) {
                lis.Add(index);
            } else {
                lis[pos] = index;
            }
        }
        
        return target.Length - lis.Count;
    }
}
