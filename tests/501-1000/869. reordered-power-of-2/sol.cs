public class Solution {
    public bool ReorderedPowerOf2(int n) {
        string Signature(int num) {
            var counts = new int[10];
            if (num == 0) {
                counts[0] = 1;
            } else {
                while (num > 0) {
                    counts[num % 10]++;
                    num /= 10;
                }
            }
            return string.Join(",", counts);
        }

        string target = Signature(n);
        for (int i = 0; i < 31; i++) {
            if (Signature(1 << i) == target) {
                return true;
            }
        }
        return false;
    }
}
