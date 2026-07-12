public class Solution {
    public int[] FairCandySwap(int[] aliceSizes, int[] bobSizes) {
        int sumA = aliceSizes.Sum();
        int sumB = bobSizes.Sum();
        int diff = (sumB - sumA) / 2;
        var setB = new HashSet<int>(bobSizes);
        foreach (int a in aliceSizes) {
            if (setB.Contains(a + diff)) {
                return new int[] { a, a + diff };
            }
        }
        return new int[] { };
    }
}
