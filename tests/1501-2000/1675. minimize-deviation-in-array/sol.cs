public class Solution {
    public int MinimumDeviation(int[] nums) {
        if (nums.Length == 0) return int.MaxValue;
        
        var maxHeap = new SortedSet<int>(Comparer<int>.Create((a, b) => b.CompareTo(a)));
        int minVal = int.MaxValue;
        
        foreach (int num in nums) {
            if (num % 2 == 0) {
                maxHeap.Add(num);
                minVal = Math.Min(num, minVal);
            } else {
                maxHeap.Add(num * 2);
                minVal = Math.Min(num * 2, minVal);
            }
        }
        
        int res = int.MaxValue;
        while (maxHeap.Min % 2 == 0) {
            int maxVal = maxHeap.Min;
            maxHeap.Remove(maxVal);
            res = Math.Min(res, maxVal - minVal);
            int newNum = maxVal / 2;
            maxHeap.Add(newNum);
            minVal = Math.Min(newNum, minVal);
        }
        
        res = Math.Min(maxHeap.Min - minVal, res);
        return res;
    }
}
