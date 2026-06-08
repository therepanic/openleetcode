import java.util.*;

public class Solution {
    public List<String> letterCombinations(String digits) {
        if (digits.isEmpty()) return new ArrayList<>();
        String[] map = {"", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"};
        List<String> res = new ArrayList<>();
        StringBuilder cur = new StringBuilder();
        backtrack(digits, 0, map, cur, res);
        return res;
    }

    private void backtrack(String digits, int idx, String[] map, StringBuilder cur, List<String> res) {
        if (idx == digits.length()) {
            res.add(cur.toString());
            return;
        }
        String letters = map[digits.charAt(idx) - '0'];
        for (int i = 0; i < letters.length(); i++) {
            cur.append(letters.charAt(i));
            backtrack(digits, idx + 1, map, cur, res);
            cur.deleteCharAt(cur.length() - 1);
        }
    }
}
