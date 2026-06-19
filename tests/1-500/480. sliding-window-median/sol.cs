using System;
using System.Collections.Generic;

public class Heap {
    private readonly List<int> data = new List<int>();
    private readonly Comparison<int> cmp;

    public Heap(Comparison<int> cmp) {
        this.cmp = cmp;
    }

    public int Count => data.Count;

    public int Peek() => data[0];

    public void Push(int val) {
        data.Add(val);
        int i = data.Count - 1;
        while (i > 0) {
            int p = (i - 1) / 2;
            if (cmp(data[i], data[p]) >= 0) break;
            (data[i], data[p]) = (data[p], data[i]);
            i = p;
        }
    }

    public int Pop() {
        int root = data[0];
        int last = data[data.Count - 1];
        data.RemoveAt(data.Count - 1);
        if (data.Count > 0) {
            data[0] = last;
            int i = 0;
            while (true) {
                int left = i * 2 + 1;
                int right = left + 1;
                int best = i;
                if (left < data.Count && cmp(data[left], data[best]) < 0) best = left;
                if (right < data.Count && cmp(data[right], data[best]) < 0) best = right;
                if (best == i) break;
                (data[i], data[best]) = (data[best], data[i]);
                i = best;
            }
        }
        return root;
    }
}

public class DualHeap {
    private readonly Heap small = new Heap((a, b) => b.CompareTo(a));
    private readonly Heap large = new Heap((a, b) => a.CompareTo(b));
    private readonly Dictionary<int, int> delayed = new Dictionary<int, int>();
    private readonly int k;
    private int smallSize = 0;
    private int largeSize = 0;

    public DualHeap(int k) {
        this.k = k;
    }

    private void DecDelayed(int num) {
        delayed[num]--;
        if (delayed[num] == 0) delayed.Remove(num);
    }

    private void PruneSmall() {
        while (small.Count > 0) {
            int num = small.Peek();
            if (!delayed.ContainsKey(num)) break;
            DecDelayed(num);
            small.Pop();
        }
    }

    private void PruneLarge() {
        while (large.Count > 0) {
            int num = large.Peek();
            if (!delayed.ContainsKey(num)) break;
            DecDelayed(num);
            large.Pop();
        }
    }

    private void MakeBalance() {
        if (smallSize > largeSize + 1) {
            large.Push(small.Pop());
            smallSize--;
            largeSize++;
            PruneSmall();
        } else if (smallSize < largeSize) {
            small.Push(large.Pop());
            smallSize++;
            largeSize--;
            PruneLarge();
        }
    }

    public void Insert(int num) {
        if (small.Count == 0 || num <= small.Peek()) {
            small.Push(num);
            smallSize++;
        } else {
            large.Push(num);
            largeSize++;
        }
        MakeBalance();
    }

    public void Erase(int num) {
        delayed[num] = delayed.GetValueOrDefault(num, 0) + 1;
        if (num <= small.Peek()) {
            smallSize--;
            if (num == small.Peek()) PruneSmall();
        } else {
            largeSize--;
            if (large.Count > 0 && num == large.Peek()) PruneLarge();
        }
        MakeBalance();
    }

    public double Median() {
        if (k % 2 == 1) return small.Peek();
        return ((double)small.Peek() + large.Peek()) / 2.0;
    }
}

public class Solution {
    public double[] MedianSlidingWindow(int[] nums, int k) {
        var dh = new DualHeap(k);
        for (int i = 0; i < k; i++) dh.Insert(nums[i]);
        var ans = new double[nums.Length - k + 1];
        ans[0] = dh.Median();
        for (int i = k; i < nums.Length; i++) {
            dh.Insert(nums[i]);
            dh.Erase(nums[i - k]);
            ans[i - k + 1] = dh.Median();
        }
        return ans;
    }
}
