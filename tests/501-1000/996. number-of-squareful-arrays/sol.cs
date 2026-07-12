public class Solution {
    public int NumSquarefulPerms(int[] nums) {
        int n = nums.Length;
        Array.Sort(nums);

        bool IsSquareful(List<int> currNums, int num) {
            if (currNums.Count == 0) return true;
            int prevNum = currNums[currNums.Count - 1];
            int pairSum = prevNum + num;
            if (pairSum < 0) return false;
            int sqrtN = (int)Math.Sqrt(pairSum);
            return sqrtN * sqrtN == pairSum;
        }

        int Backtrack(int numsMask, List<int> currNums) {
            if (numsMask != 0 && currNums.Count == n) return 1;
            int numSquarefulPerms = 0;
            for (int idx = 0; idx < n; idx++) {
                int num = nums[idx];
                if (idx > 0 && nums[idx] == nums[idx - 1] && (numsMask & (1 << (idx - 1))) == 0) {
                    continue;
                }
                if ((numsMask & (1 << idx)) == 0 && IsSquareful(currNums, num)) {
                    currNums.Add(num);
                    numSquarefulPerms += Backtrack(numsMask | (1 << idx), currNums);
                    currNums.RemoveAt(currNums.Count - 1);
                }
            }
            return numSquarefulPerms;
        }

        return Backtrack(0, new List<int>());
    }
}
