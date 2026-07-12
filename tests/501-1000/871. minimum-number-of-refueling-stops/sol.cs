public class Solution {
    public int MinRefuelStops(int target, int startFuel, int[][] stations) {
        var heap = new List<int>();
        int fuel = startFuel;
        int stops = 0;
        int i = 0;

        while (fuel < target) {
            while (i < stations.Length && stations[i][0] <= fuel) {
                Push(heap, stations[i][1]);
                i++;
            }

            if (heap.Count == 0) {
                return -1;
            }

            fuel += Pop(heap);
            stops++;
        }

        return stops;
    }

    private static void Push(List<int> heap, int value) {
        heap.Add(value);
        int i = heap.Count - 1;
        while (i > 0) {
            int parent = (i - 1) >> 1;
            if (heap[parent] >= heap[i]) {
                break;
            }
            int tmp = heap[parent];
            heap[parent] = heap[i];
            heap[i] = tmp;
            i = parent;
        }
    }

    private static int Pop(List<int> heap) {
        int top = heap[0];
        int last = heap[heap.Count - 1];
        heap.RemoveAt(heap.Count - 1);
        if (heap.Count == 0) {
            return top;
        }

        heap[0] = last;
        int i = 0;
        while (true) {
            int left = (i << 1) + 1;
            if (left >= heap.Count) {
                break;
            }

            int right = left + 1;
            int child = left;
            if (right < heap.Count && heap[right] > heap[left]) {
                child = right;
            }

            if (heap[i] >= heap[child]) {
                break;
            }

            int tmp = heap[i];
            heap[i] = heap[child];
            heap[child] = tmp;
            i = child;
        }

        return top;
    }
}
