public class Solution {
    private int PopCount(int value) {
        int count = 0;
        while (value != 0) { value &= value - 1; count++; }
        return count;
    }
    public int[] SortByBits(int[] arr) {
        Array.Sort(arr, (a, b) => {
            int ca = PopCount(a);
            int cb = PopCount(b);
            if (ca != cb) return ca - cb;
            return a - b;
        });
        return arr;
    }
}
