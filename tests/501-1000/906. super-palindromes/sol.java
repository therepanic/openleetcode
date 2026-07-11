class Solution {
    public int superpalindromesInRange(String left, String right) {
        long L = Long.parseLong(left);
        long R = Long.parseLong(right);
        int count = 0;
        for (int i = 1; i <= 100000; i++) {
            String s = Integer.toString(i);
            String rev = new StringBuilder(s).reverse().toString();
            long val1 = Long.parseLong(s + rev);
            long val2 = Long.parseLong(s + rev.substring(1));
            long sqval1 = val1 * val1;
            long sqval2 = val2 * val2;
            if (L <= sqval1 && sqval1 <= R) {
                String ssqval1 = Long.toString(sqval1);
                if (ssqval1.equals(new StringBuilder(ssqval1).reverse().toString())) {
                    count++;
                }
            }
            if (L <= sqval2 && sqval2 <= R) {
                String ssqval2 = Long.toString(sqval2);
                if (ssqval2.equals(new StringBuilder(ssqval2).reverse().toString())) {
                    count++;
                }
            }
            if (val2 > R) {
                break;
            }
        }
        return count;
    }
}
