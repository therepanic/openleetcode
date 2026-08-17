public class Solution {
    public int MaxDistance(int[] position, int m) {
        Array.Sort(position);
        int right = position[position.Length - 1] - position[0];
        int left = 1;
        
        while (left <= right) {
            int mid = (left + right) / 2;
            int myBalls = 1;
            int previous = position[0];
            
            for (int i = 1; i < position.Length; i++) {
                if (position[i] - previous >= mid) {
                    myBalls++;
                    previous = position[i];
                }
            }
            
            if (myBalls >= m) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        
        return right;
    }
}
