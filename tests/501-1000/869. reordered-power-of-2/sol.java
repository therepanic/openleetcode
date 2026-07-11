class Solution {
    public boolean reorderedPowerOf2(int n) {
        String target = signature(n);
        for (int i = 0; i < 31; i++) {
            if (signature(1 << i).equals(target)) {
                return true;
            }
        }
        return false;
    }

    private String signature(int num) {
        int[] counts = new int[10];
        if (num == 0) {
            counts[0] = 1;
        } else {
            while (num > 0) {
                counts[num % 10]++;
                num /= 10;
            }
        }
        StringBuilder sb = new StringBuilder();
        for (int count : counts) {
            sb.append('#').append(count);
        }
        return sb.toString();
    }
}
