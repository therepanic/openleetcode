import java.util.PriorityQueue;
class Solution {
    public double maxAverageRatio(int[][] classes, int extraStudents) {
        PriorityQueue<double[]> pq = new PriorityQueue<>((a, b) -> Double.compare(b[0], a[0]));
        for (int[] c : classes) {
            double gain = (double)(c[0] + 1) / (c[1] + 1) - (double)c[0] / c[1];
            pq.offer(new double[]{gain, c[0], c[1]});
        }
        for (int i = 0; i < extraStudents; i++) {
            double[] top = pq.poll();
            double p = top[1], t = top[2];
            p++; t++;
            double gain = (double)(p + 1) / (t + 1) - (double)p / t;
            pq.offer(new double[]{gain, p, t});
        }
        double sum = 0;
        for (double[] item : pq) {
            sum += item[1] / item[2];
        }
        return sum / classes.length;
    }
}
