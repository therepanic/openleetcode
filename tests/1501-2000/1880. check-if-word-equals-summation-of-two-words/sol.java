class Solution {
    public boolean isSumEqual(String firstWord, String secondWord, String targetWord) {
        int first = convert(firstWord);
        int second = convert(secondWord);
        int target = convert(targetWord);
        return first + second == target;
    }
    
    private int convert(String word) {
        StringBuilder sb = new StringBuilder();
        for (char c : word.toCharArray()) {
            sb.append((int)(c - 'a'));
        }
        return Integer.parseInt(sb.toString());
    }
}
