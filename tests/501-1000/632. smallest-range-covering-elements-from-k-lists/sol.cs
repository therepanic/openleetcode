public class Solution {
    public int[] SmallestRange(IList<IList<int>> nums) {
        var values = new System.Collections.Generic.List<int[]>();
        for (int i = 0; i < nums.Count; i++) {
            foreach (int value in nums[i]) {
                values.Add(new int[] { value, i });
            }
        }
        values.Sort((a, b) => a[0] != b[0] ? a[0].CompareTo(b[0]) : a[1].CompareTo(b[1]));

        var freq = new System.Collections.Generic.Dictionary<int, int>();
        int covered = 0;
        int left = 0;
        int bestLeft = values[0][0];
        int bestRight = values[values.Count - 1][0];

        for (int right = 0; right < values.Count; right++) {
            int listIdx = values[right][1];
            if (!freq.ContainsKey(listIdx) || freq[listIdx] == 0) {
                covered++;
                freq[listIdx] = 0;
            }
            freq[listIdx]++;

            while (covered == nums.Count) {
                int currentLeft = values[left][0];
                int currentRight = values[right][0];
                if ((long)currentRight - currentLeft < (long)bestRight - bestLeft ||
                    ((long)currentRight - currentLeft == (long)bestRight - bestLeft && currentLeft < bestLeft)) {
                    bestLeft = currentLeft;
                    bestRight = currentRight;
                }
                int leftList = values[left][1];
                freq[leftList]--;
                if (freq[leftList] == 0) {
                    covered--;
                }
                left++;
            }
        }
        return new int[] { bestLeft, bestRight };
    }
}
