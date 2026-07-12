import java.util.*;

class Solution {
    public int[] smallestSufficientTeam(String[] req_skills, List<List<String>> people) {
        int n = req_skills.length;
        int full = (1 << n) - 1;
        Map<String, Integer> idx = new HashMap<>();
        for (int i = 0; i < n; i++) idx.put(req_skills[i], i);

        int[] masks = new int[people.size()];
        for (int i = 0; i < people.size(); i++) {
            int mask = 0;
            for (String skill : people.get(i)) mask |= 1 << idx.get(skill);
            masks[i] = mask;
        }

        @SuppressWarnings("unchecked")
        ArrayList<Integer>[] dp = new ArrayList[1 << n];
        dp[0] = new ArrayList<>();

        for (int i = 0; i < masks.length; i++) {
            int pmask = masks[i];
            if (pmask == 0) continue;
            ArrayList<Integer>[] next = Arrays.copyOf(dp, dp.length);
            for (int mask = 0; mask <= full; mask++) {
                if (dp[mask] == null) continue;
                int nmask = mask | pmask;
                ArrayList<Integer> cand = new ArrayList<>(dp[mask]);
                cand.add(i);
                if (next[nmask] == null || cand.size() < next[nmask].size()) {
                    next[nmask] = cand;
                }
            }
            dp = next;
        }

        ArrayList<Integer> ans = dp[full];
        int[] res = new int[ans.size()];
        for (int i = 0; i < ans.size(); i++) res[i] = ans.get(i);
        return res;
    }
}
