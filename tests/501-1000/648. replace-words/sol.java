class Solution {
    @SuppressWarnings("unchecked")
    private void addInTrie(Map<String, Object> trie, String word) {
        Map<String, Object> n = trie;
        for (char letter : word.toCharArray()) {
            String key = String.valueOf(letter);
            if (!n.containsKey(key)) {
                Map<String, Object> newNode = new HashMap<>();
                newNode.put("*", false);
                n.put(key, newNode);
            }
            n = (Map<String, Object>) n.get(key);
        }
        n.put("*", true);
    }
    
    @SuppressWarnings("unchecked")
    private String getReplacement(Map<String, Object> trie, String word) {
        Map<String, Object> n = trie;
        for (int i = 0; i < word.length(); i++) {
            if ((boolean) n.get("*")) {
                return word.substring(0, i);
            }
            String key = String.valueOf(word.charAt(i));
            if (!n.containsKey(key)) {
                break;
            }
            n = (Map<String, Object>) n.get(key);
        }
        return word;
    }
    
    public String replaceWords(String[] dictionary, String sentence) {
        Map<String, Object> trie = new HashMap<>();
        trie.put("*", false);
        String[] arr = sentence.split(" ");
        
        for (String word : dictionary) {
            addInTrie(trie, word);
        }
        
        for (int i = 0; i < arr.length; i++) {
            arr[i] = getReplacement(trie, arr[i]);
        }
        
        return String.join(" ", arr);
    }
}
