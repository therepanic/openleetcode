class Solution {
    public int findNthDigit(int n) {
        int i = 1;
        long count = 9;
        long start = 1;

        while (n > i * count) {
            n -= i * count;
            i++;
            count *= 10;
            start *= 10;
        }

        long number = start + (n - 1) / i;
        return String.valueOf(number).charAt((n - 1) % i) - '0';
    }
}
