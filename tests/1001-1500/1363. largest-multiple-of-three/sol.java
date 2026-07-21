class Solution {
    public String largestMultipleOfThree(int[] digits) {
        int[] counts = new int[10];
        for (int digit : digits) {
            counts[digit]++;
        }

        int sum = 0;
        for (int i = 0; i < 10; i++) {
            sum += i * counts[i];
        }
        int remainder = sum % 3;

        if (remainder == 1) {
            if (!removeSmallest(counts, new int[]{1, 4, 7}, 1)) {
                removeSmallest(counts, new int[]{2, 5, 8}, 2);
            }
        } else if (remainder == 2) {
            if (!removeSmallest(counts, new int[]{2, 5, 8}, 1)) {
                removeSmallest(counts, new int[]{1, 4, 7}, 2);
            }
        }

        StringBuilder sb = new StringBuilder();
        for (int i = 9; i >= 0; i--) {
            for (int j = 0; j < counts[i]; j++) {
                sb.append(i);
            }
        }
        String result = sb.toString();
        return result.startsWith("0") ? "0" : result;
    }

    private boolean removeSmallest(int[] counts, int[] group, int amount) {
        for (int digit : group) {
            while (amount > 0 && counts[digit] > 0) {
                counts[digit]--;
                amount--;
            }
        }
        return amount == 0;
    }
}
