class Solution {
    public int scheduleCourse(int[][] courses) {
        java.util.Arrays.sort(courses, (a, b) -> a[1] == b[1] ? a[0] - b[0] : a[1] - b[1]);
        java.util.PriorityQueue<Integer> heap = new java.util.PriorityQueue<>((a, b) -> b - a);
        int days = 0;
        for (int[] course : courses) {
            int duration = course[0];
            int last = course[1];
            days += duration;
            heap.offer(duration);
            if (days > last) {
                int top = heap.poll();
                days -= top;
            }
        }
        return heap.size();
    }
}
