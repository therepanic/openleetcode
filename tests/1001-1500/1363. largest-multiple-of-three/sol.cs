public class Solution {
    public string LargestMultipleOfThree(int[] digits) {
        int[] counts = new int[10];
        foreach (int digit in digits) {
            counts[digit]++;
        }

        int sum = 0;
        for (int i = 0; i < 10; i++) {
            sum += i * counts[i];
        }
        int remainder = sum % 3;

        bool RemoveSmallest(int[] group, int amount) {
            foreach (int digit in group) {
                while (amount > 0 && counts[digit] > 0) {
                    counts[digit]--;
                    amount--;
                }
            }
            return amount == 0;
        }

        if (remainder == 1) {
            if (!RemoveSmallest(new int[] {1, 4, 7}, 1)) {
                RemoveSmallest(new int[] {2, 5, 8}, 2);
            }
        } else if (remainder == 2) {
            if (!RemoveSmallest(new int[] {2, 5, 8}, 1)) {
                RemoveSmallest(new int[] {1, 4, 7}, 2);
            }
        }

        var sb = new System.Text.StringBuilder();
        for (int i = 9; i >= 0; i--) {
            sb.Append((char)('0' + i), counts[i]);
        }
        string result = sb.ToString();
        return result.Length > 0 && result[0] == '0' ? "0" : result;
    }
}
