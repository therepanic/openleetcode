public class Solution {
    public int MaxSumMinProduct(int[] nums) {
        int n = nums.Length;
        long[] prefix = new long[n + 1];
        for (int i = 0; i < n; i++) prefix[i+1] = prefix[i] + nums[i];
        
        int[] leftBound = new int[n];
        int[] rightBound = new int[n];
        Array.Fill(leftBound, -1);
        Array.Fill(rightBound, n);
        var stack = new Stack<int>();
        for (int i = 0; i < n; i++) {
            while (stack.Count > 0 && nums[stack.Peek()] > nums[i]) {
                rightBound[stack.Pop()] = i;
            }
            stack.Push(i);
        }
        stack.Clear();
        for (int i = n-1; i >= 0; i--) {
            while (stack.Count > 0 && nums[stack.Peek()] > nums[i]) {
                leftBound[stack.Pop()] = i;
            }
            stack.Push(i);
        }
        
        long maxProd = 0;
        for (int i = 0; i < n; i++) {
            int l = leftBound[i], r = rightBound[i];
            long total = prefix[r] - prefix[l+1];
            maxProd = Math.Max(maxProd, (long)nums[i] * total);
        }
        return (int)(maxProd % 1000000007L);
    }
}
