public class Solution {
    public int[] ConstructRectangle(int area) {
        int w = (int) Math.Sqrt(area);
        while (area % w != 0) {
            w--;
        }
        return new int[] {area / w, w};
    }
}
