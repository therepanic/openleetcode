public class Solution {
    public int FindNthDigit(int n) {
        long i = 1;
        long count = 9;
        long start = 1;
        long N = n;

        while (N > i * count) {
            N -= i * count;
            i++;
            count *= 10;
            start *= 10;
        }

        long number = start + (N - 1) / i;
        string s = number.ToString();
        return s[(int)((N - 1) % i)] - '0';
    }
}
