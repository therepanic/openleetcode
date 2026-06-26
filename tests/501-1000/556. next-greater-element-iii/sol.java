class Solution {
    public int nextGreaterElement(int n) {
        char[] digits = Integer.toString(n).toCharArray();
        int length = digits.length;
        int pivot = -1;

        for (int i = length - 2; i >= 0; i--) {
            if (digits[i] < digits[i + 1]) {
                pivot = i;
                break;
            }
        }

        if (pivot == -1) {
            return -1;
        }

        for (int i = length - 1; i > pivot; i--) {
            if (digits[i] > digits[pivot]) {
                char temp = digits[i];
                digits[i] = digits[pivot];
                digits[pivot] = temp;
                break;
            }
        }

        int left = pivot + 1;
        int right = length - 1;
        while (left < right) {
            char temp = digits[left];
            digits[left] = digits[right];
            digits[right] = temp;
            left++;
            right--;
        }

        long result = Long.parseLong(new String(digits));
        return result <= Integer.MAX_VALUE ? (int) result : -1;
    }
}
