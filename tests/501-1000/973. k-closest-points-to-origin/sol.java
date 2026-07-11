import java.util.Arrays;

class Solution {
    public int[][] kClosest(int[][] points, int k) {
        Arrays.sort(points, (a, b) -> Long.compare(
            1L * a[0] * a[0] + 1L * a[1] * a[1],
            1L * b[0] * b[0] + 1L * b[1] * b[1]
        ));
        return Arrays.copyOf(points, k);
    }
}
