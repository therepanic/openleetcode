using System;
using System.Collections.Generic;
using System.Linq;

public class Solution {
    public int MinStoneSum(int[] piles, int k) {
        var maxHeap = new List<int>(piles);
        for (int i = maxHeap.Count / 2 - 1; i >= 0; i--) SiftDown(maxHeap, i);
        for (int i = 0; i < k; i++) {
            int x = maxHeap[0];
            int reduced = (x + 1) / 2;
            maxHeap[0] = reduced;
            SiftDown(maxHeap, 0);
        }
        int sum = 0;
        foreach (int x in maxHeap) sum += x;
        return sum;
    }

    private static void SiftDown(List<int> heap, int i) {
        while (true) {
            int left = i * 2 + 1;
            if (left >= heap.Count) return;
            int right = left + 1;
            int child = right < heap.Count && heap[right] > heap[left] ? right : left;
            if (heap[i] >= heap[child]) return;
            int t = heap[i]; heap[i] = heap[child]; heap[child] = t;
            i = child;
        }
    }
}
