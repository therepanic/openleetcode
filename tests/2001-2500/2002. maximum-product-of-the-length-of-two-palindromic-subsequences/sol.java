class Solution {
    public int maxProduct(String s) {
        int n = s.length();
        List<int[]> palinMasks = new ArrayList<>();
        
        for (int mask = 1; mask < (1 << n); mask++) {
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < n; i++) {
                if (((mask >> i) & 1) == 1) {
                    sb.append(s.charAt(i));
                }
            }
            String seq = sb.toString();
            if (seq.equals(sb.reverse().toString())) {
                palinMasks.add(new int[]{mask, Integer.bitCount(mask)});
            }
        }
        
        int maxProduct = 0;
        for (int i = 0; i < palinMasks.size(); i++) {
            for (int j = i + 1; j < palinMasks.size(); j++) {
                int m1 = palinMasks.get(i)[0];
                int m2 = palinMasks.get(j)[0];
                int l1 = palinMasks.get(i)[1];
                int l2 = palinMasks.get(j)[1];
                if ((m1 & m2) == 0) {
                    maxProduct = Math.max(maxProduct, l1 * l2);
                }
            }
        }
        
        return maxProduct;
    }
}
