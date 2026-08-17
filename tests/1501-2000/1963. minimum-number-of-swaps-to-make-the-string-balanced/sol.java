class Solution {
    public int minSwaps(String s) {
        int swap = 0;
        for (char c : s.toCharArray()) {
            if (c == '[') {
                swap++;
            } else {
                if (swap > 0) {
                    swap--;
                }
            }
        }
        return (swap + 1) / 2;
    }
}
