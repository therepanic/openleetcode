class Solution {
    public int maxSumMinProduct(int[] nums) {
        int n = nums.length;
        long[] prefix = new long[n + 1];
        for (int i = 0; i < n; i++) {
            prefix[i+1] = prefix[i] + nums[i];
        }
        
        int[] leftBound = new int[n];
        int[] rightBound = new int[n];
        Arrays.fill(leftBound, -1);
        Arrays.fill(rightBound, n);
        Deque<Integer> stack = new ArrayDeque<>();
        for (int i = 0; i < n; i++) {
            while (!stack.isEmpty() && nums[stack.peek()] > nums[i]) {
                rightBound[stack.pop()] = i;
            }
            stack.push(i);
        }
        stack.clear();
        for (int i = n-1; i >= 0; i--) {
            while (!stack.isEmpty() && nums[stack.peek()] > nums[i]) {
                leftBound[stack.pop()] = i;
            }
            stack.push(i);
        }
        
        long maxProd = 0;
        for (int i = 0; i < n; i++) {
            int l = leftBound[i], r = rightBound[i];
            long total = prefix[r] - prefix[l+1];
            maxProd = Math.max(maxProd, (long)nums[i] * total);
        }
        return (int)(maxProd % 1000000007L);
    }
}
