class Solution {
    public List<Integer> selfDividingNumbers(int left, int right) {
        List<Integer> lst = new ArrayList<>();
        for (int i = left; i <= right; i++) {
            String s = Integer.toString(i);
            boolean hasZero = false;
            for (char c : s.toCharArray()) {
                if (c == '0') {
                    hasZero = true;
                    break;
                }
            }
            if (hasZero) continue;
            int b = 1;
            for (char c : s.toCharArray()) {
                int digit = c - '0';
                if (i % digit != 0) {
                    b = 0;
                    break;
                }
            }
            if (b == 1) lst.add(i);
        }
        return lst;
    }
}
