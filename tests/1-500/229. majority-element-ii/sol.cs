public class Solution {
    public IList<int> MajorityElement(int[] nums) {
        int majority1 = 0, majority2 = 0, count1 = 0, count2 = 0;

        foreach (int num in nums) {
            if (num == majority1) {
                count1++;
            } else if (num == majority2) {
                count2++;
            } else if (count1 == 0) {
                majority1 = num;
                count1 = 1;
            } else if (count2 == 0) {
                majority2 = num;
                count2 = 1;
            } else {
                count1--;
                count2--;
            }
        }

        count1 = 0;
        count2 = 0;

        foreach (int num in nums) {
            if (num == majority1) {
                count1++;
            } else if (num == majority2) {
                count2++;
            }
        }

        IList<int> res = new List<int>();
        if (count1 > nums.Length / 3) {
            res.Add(majority1);
        }
        if (count2 > nums.Length / 3) {
            res.Add(majority2);
        }

        return res;
    }
}
