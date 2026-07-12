class Solution {
    public int[] threeEqualParts(int[] arr) {
        int n = arr.length;
        int ones = 0;
        for (int x : arr) ones += x;
        if (ones == 0) return new int[]{0, n - 1};
        if (ones % 3 != 0) return new int[]{-1, -1};

        int k = ones / 3;
        int i1 = -1, i2 = -1, i3 = -1;
        int seen = 0;
        for (int i = 0; i < n; i++) {
            if (arr[i] == 1) {
                seen++;
                if (seen == 1) i1 = i;
                else if (seen == k + 1) i2 = i;
                else if (seen == 2 * k + 1) {
                    i3 = i;
                    break;
                }
            }
        }

        int len = n - i3;
        if (i1 + len > i2 || i2 + len > i3) return new int[]{-1, -1};
        for (int i = 0; i < len; i++) {
            if (arr[i1 + i] != arr[i2 + i] || arr[i1 + i] != arr[i3 + i]) {
                return new int[]{-1, -1};
            }
        }
        return new int[]{i1 + len - 1, i2 + len};
    }
}
