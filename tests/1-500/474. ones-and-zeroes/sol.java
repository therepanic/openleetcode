import java.util.HashMap;
import java.util.Map;

class Solution {
    public int findMaxForm(String[] strs, int m, int n) {
        Map<String, Integer> dp = new HashMap<>();
        dp.put("0,0", 0);
        for (String s : strs) {
            int zeros = 0, ones = 0;
            for (char c : s.toCharArray()) {
                if (c == '0') zeros++;
                else ones++;
            }
            Map<String, Integer> newDp = new HashMap<>(dp);
            for (Map.Entry<String, Integer> entry : dp.entrySet()) {
                String[] parts = entry.getKey().split(",");
                int z = Integer.parseInt(parts[0]);
                int o = Integer.parseInt(parts[1]);
                int size = entry.getValue();
                int newZ = z + zeros;
                int newO = o + ones;
                if (newZ <= m && newO <= n) {
                    String key = newZ + "," + newO;
                    newDp.put(key, Math.max(newDp.getOrDefault(key, 0), size + 1));
                }
            }
            dp = newDp;
        }
        int max = 0;
        for (int val : dp.values()) {
            max = Math.max(max, val);
        }
        return max;
    }
}
