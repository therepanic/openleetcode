import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

class Solution {
    public List<String> findRepeatedDnaSequences(String s) {
        Map<String, Integer> seen = new HashMap<>();
        List<String> ans = new ArrayList<>();
        for (int i = 0; i + 10 <= s.length(); i++) {
            String sub = s.substring(i, i + 10);
            int count = seen.getOrDefault(sub, 0);
            if (count == 1) ans.add(sub);
            seen.put(sub, count + 1);
        }
        return ans;
    }
}
