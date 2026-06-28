public class Solution {
    public int ScheduleCourse(int[][] courses) {
        Array.Sort(courses, (a, b) => a[1] == b[1] ? a[0].CompareTo(b[0]) : a[1].CompareTo(b[1]));
        var heap = new MaxHeap();
        int days = 0;
        foreach (var course in courses) {
            int duration = course[0];
            int last = course[1];
            days += duration;
            heap.Push(duration);
            if (days > last) {
                int top = heap.Pop();
                days -= top;
            }
        }
        return heap.Count;
    }

    private sealed class MaxHeap {
        private readonly System.Collections.Generic.List<int> data = new System.Collections.Generic.List<int>();
        public int Count => data.Count;

        public void Push(int value) {
            data.Add(value);
            int i = data.Count - 1;
            while (i > 0) {
                int p = (i - 1) / 2;
                if (data[p] >= data[i]) break;
                (data[p], data[i]) = (data[i], data[p]);
                i = p;
            }
        }

        public int Pop() {
            int result = data[0];
            int last = data[data.Count - 1];
            data.RemoveAt(data.Count - 1);
            if (data.Count > 0) {
                data[0] = last;
                int i = 0;
                while (true) {
                    int left = i * 2 + 1;
                    int right = left + 1;
                    int best = i;
                    if (left < data.Count && data[left] > data[best]) best = left;
                    if (right < data.Count && data[right] > data[best]) best = right;
                    if (best == i) break;
                    (data[i], data[best]) = (data[best], data[i]);
                    i = best;
                }
            }
            return result;
        }
    }
}
