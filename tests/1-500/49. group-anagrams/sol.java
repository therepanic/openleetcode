import java.util.*;

public class Solution {
    public List<List<String>> groupAnagrams(String[] strs) {
        Map<String, List<String>> groups = new HashMap<>();
        List<String> keys = new ArrayList<>();

        for (String word : strs) {
            char[] chars = word.toCharArray();
            Arrays.sort(chars);
            String key = new String(chars);
            if (!groups.containsKey(key)) {
                groups.put(key, new ArrayList<>());
                keys.add(key);
            }
            groups.get(key).add(word);
        }

        List<List<String>> res = new ArrayList<>();
        for (String key : keys) {
            res.add(groups.get(key));
        }
        return res;
    }
}
