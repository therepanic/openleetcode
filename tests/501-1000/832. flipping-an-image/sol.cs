public class Solution {
    public int[][] FlipAndInvertImage(int[][] image) {
        foreach (var row in image) {
            int left = 0, right = row.Length - 1;
            while (left <= right) {
                int temp = 1 - row[right];
                row[right] = 1 - row[left];
                row[left] = temp;
                left++;
                right--;
            }
        }
        return image;
    }
}
