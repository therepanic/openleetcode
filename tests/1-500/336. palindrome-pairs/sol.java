class Solution {
    private boolean isPalindrome(String s) {
        int l = 0, r = s.length() - 1;
        while (l < r) {
            if (s.charAt(l) != s.charAt(r)) return false;
            l++;
            r--;
        }
        return true;
    }

    public List<List<Integer>> palindromePairs(String[] words) {
        List<List<Integer>> ans = new ArrayList<>();
        Map<String, Integer> wordMap = new HashMap<>();
        for (int i = 0; i < words.length; i++) {
            wordMap.put(new StringBuilder(words[i]).reverse().toString(), i);
        }

        if (wordMap.containsKey("")) {
            int emptyIdx = wordMap.get("");
            for (int i = 0; i < words.length; i++) {
                if (!words[i].equals("") && isPalindrome(words[i])) {
                    ans.add(Arrays.asList(i, emptyIdx));
                }
            }
        }

        for (int i = 0; i < words.length; i++) {
            String word = words[i];
            for (int j = 0; j < word.length(); j++) {
                String left = word.substring(0, j + 1);
                String right = word.substring(j + 1);
                if (wordMap.containsKey(left) && isPalindrome(right) && wordMap.get(left) != i) {
                    ans.add(Arrays.asList(i, wordMap.get(left)));
                }
                if (wordMap.containsKey(right) && isPalindrome(left) && wordMap.get(right) != i) {
                    ans.add(Arrays.asList(wordMap.get(right), i));
                }
            }
        }
        return ans;
    }
}
