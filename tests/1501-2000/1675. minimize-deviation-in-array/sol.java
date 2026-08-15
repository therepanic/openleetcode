import java.util.*;

class Solution {
    public int minimumDeviation(int[] nums) {
        if (nums.length == 0) return Integer.MAX_VALUE;
        
        PriorityQueue<Integer> maxHeap = new PriorityQueue<>(Collections.reverseOrder());
        int minVal = Integer.MAX_VALUE;
        
        for (int num : nums) {
            if (num % 2 == 0) {
                maxHeap.add(num);
                minVal = Math.min(num, minVal);
            } else {
                maxHeap.add(num * 2);
                minVal = Math.min(num * 2, minVal);
            }
        }
        
        int res = Integer.MAX_VALUE;
        while (maxHeap.peek() % 2 == 0) {
            int maxVal = maxHeap.poll();
            res = Math.min(res, maxVal - minVal);
            int newNum = maxVal / 2;
            maxHeap.add(newNum);
            minVal = Math.min(newNum, minVal);
        }
        
        res = Math.min(maxHeap.peek() - minVal, res);
        return res;
    }
}
