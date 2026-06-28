class Solution {
    public int repeatedStringMatch(String a, String b) {
        StringBuilder repeatA = new StringBuilder(a);
        int count = 1;

        while (repeatA.length() < b.length()) {
            repeatA.append(a);
            count++;
            if (repeatA.toString().contains(b)) {
                return count;
            }
        }

        repeatA.append(a);
        count++;
        if (repeatA.toString().contains(b)) {
            return count;
        }

        return -1;
    }
}
