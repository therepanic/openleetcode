class Solution {
    public int minDeletions(String s) {
        int[] count = new int[26];
        for (char c : s.toCharArray()) {
            count[c - 'a']++;
        }
        java.util.List<Integer> freqs = new java.util.ArrayList<>();
        for (int f : count) {
            if (f > 0) freqs.add(f);
        }
        freqs.sort(java.util.Collections.reverseOrder());
        int deletes = 0;
        for (int idx = 1; idx < freqs.size(); idx++) {
            if (freqs.get(idx) >= freqs.get(idx - 1)) {
                int target = Math.max(0, freqs.get(idx - 1) - 1);
                deletes += (freqs.get(idx) - target);
                freqs.set(idx, target);
            }
        }
        return deletes;
    }
}
