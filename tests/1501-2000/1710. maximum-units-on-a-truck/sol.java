class Solution {
    public int maximumUnits(int[][] boxTypes, int truckSize) {
        Arrays.sort(boxTypes, (a, b) -> b[1] - a[1]);
        int ans = 0;
        for (int[] box : boxTypes) {
            int quantitytaken = Math.min(truckSize, box[0]);
            ans += box[1] * quantitytaken;
            truckSize -= quantitytaken;
            if (truckSize == 0) break;
        }
        return ans;
    }
}
