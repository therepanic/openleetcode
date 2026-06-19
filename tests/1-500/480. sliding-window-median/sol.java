import java.util.*;

class DualHeap {
    PriorityQueue<Integer> small = new PriorityQueue<>(Collections.reverseOrder());
    PriorityQueue<Integer> large = new PriorityQueue<>();
    Map<Integer, Integer> delayed = new HashMap<>();
    int k;
    int smallSize = 0;
    int largeSize = 0;

    DualHeap(int k) {
        this.k = k;
    }

    void prune(PriorityQueue<Integer> heap) {
        while (!heap.isEmpty()) {
            int num = heap.peek();
            if (!delayed.containsKey(num) || delayed.get(num) == 0) break;
            delayed.put(num, delayed.get(num) - 1);
            if (delayed.get(num) == 0) delayed.remove(num);
            heap.poll();
        }
    }

    void makeBalance() {
        if (smallSize > largeSize + 1) {
            large.offer(small.poll());
            smallSize--;
            largeSize++;
            prune(small);
        } else if (smallSize < largeSize) {
            small.offer(large.poll());
            smallSize++;
            largeSize--;
            prune(large);
        }
    }

    void insert(int num) {
        if (small.isEmpty() || num <= small.peek()) {
            small.offer(num);
            smallSize++;
        } else {
            large.offer(num);
            largeSize++;
        }
        makeBalance();
    }

    void erase(int num) {
        delayed.put(num, delayed.getOrDefault(num, 0) + 1);
        if (num <= small.peek()) {
            smallSize--;
            if (num == small.peek()) prune(small);
        } else {
            largeSize--;
            if (!large.isEmpty() && num == large.peek()) prune(large);
        }
        makeBalance();
    }

    double median() {
        if (k % 2 == 1) return (double) small.peek();
        return ((double) small.peek() + large.peek()) / 2.0;
    }
}

class Solution {
    public double[] medianSlidingWindow(int[] nums, int k) {
        DualHeap dh = new DualHeap(k);
        for (int i = 0; i < k; i++) dh.insert(nums[i]);
        double[] ans = new double[nums.length - k + 1];
        ans[0] = dh.median();
        for (int i = k; i < nums.length; i++) {
            dh.insert(nums[i]);
            dh.erase(nums[i - k]);
            ans[i - k + 1] = dh.median();
        }
        return ans;
    }
}
