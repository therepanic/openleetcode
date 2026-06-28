public class Solution {
    public bool IsPossible(int[] nums) {
        Dictionary<int, int> count = new Dictionary<int, int>();
        Dictionary<int, int> subseq = new Dictionary<int, int>();

        foreach (int num in nums) {
            if (count.ContainsKey(num)) count[num]++;
            else count[num] = 1;
        }

        foreach (int num in nums) {
            if (count[num] == 0) continue;
            if (subseq.ContainsKey(num - 1) && subseq[num - 1] > 0) {
                subseq[num - 1]--;
                if (subseq.ContainsKey(num)) subseq[num]++;
                else subseq[num] = 1;
            } else if (count.ContainsKey(num + 1) && count[num + 1] > 0 && count.ContainsKey(num + 2) && count[num + 2] > 0) {
                count[num + 1]--;
                count[num + 2]--;
                if (subseq.ContainsKey(num + 2)) subseq[num + 2]++;
                else subseq[num + 2] = 1;
            } else {
                return false;
            }
            count[num]--;
        }

        return true;
    }
}
