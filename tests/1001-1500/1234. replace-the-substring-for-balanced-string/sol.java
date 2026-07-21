class Solution {
    public int balancedString(String s) {
        int n = s.length();
        int each = n / 4;
        java.util.Map<Character, Integer> count = new java.util.HashMap<>();
        for (char c : s.toCharArray()) {
            count.put(c, count.getOrDefault(c, 0) + 1);
        }
        java.util.Map<Character, Integer> extra = new java.util.HashMap<>();
        for (char c : count.keySet()) {
            if (count.get(c) > each) {
                extra.put(c, count.get(c) - each);
            }
        }
        if (extra.isEmpty()) return 0;
        int left = 0;
        int res = Integer.MAX_VALUE;
        java.util.Map<Character, Integer> curr = new java.util.HashMap<>();
        for (int right = 0; right < n; right++) {
            char rc = s.charAt(right);
            if (extra.containsKey(rc)) {
                curr.put(rc, curr.getOrDefault(rc, 0) + 1);
            }
            boolean allMet = true;
            for (char k : extra.keySet()) {
                if (curr.getOrDefault(k, 0) < extra.get(k)) {
                    allMet = false;
                    break;
                }
            }
            while (allMet && left <= right) {
                res = Math.min(res, right - left + 1);
                char lc = s.charAt(left);
                if (curr.containsKey(lc)) {
                    curr.put(lc, curr.get(lc) - 1);
                    if (curr.get(lc) == 0) {
                        curr.remove(lc);
                    }
                }
                left++;
                allMet = true;
                for (char k : extra.keySet()) {
                    if (curr.getOrDefault(k, 0) < extra.get(k)) {
                        allMet = false;
                        break;
                    }
                }
            }
        }
        return res;
    }
}
