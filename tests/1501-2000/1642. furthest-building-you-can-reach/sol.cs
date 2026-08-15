using System.Collections.Generic;

public class Solution {
    public int FurthestBuilding(int[] heights, int bricks, int ladders) {
        var heap = new SortedDictionary<int, int>();
        int heapCount = 0;
        int n = heights.Length;
        for (int i = 1; i < n; i++) {
            int climb = heights[i] - heights[i-1];
            if (climb <= 0) continue;
            heap[climb] = heap.TryGetValue(climb, out int count) ? count + 1 : 1;
            heapCount++;
            if (heapCount > ladders) {
                int min = heap.Keys.First();
                if (heap[min] == 1) heap.Remove(min);
                else heap[min]--;
                heapCount--;
                if (bricks >= min) {
                    bricks -= min;
                } else {
                    return i-1;
                }
            }
        }
        return n-1;
    }
}
