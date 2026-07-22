class Solution {
    public List<List<String>> suggestedProducts(String[] products, String searchWord) {
        Arrays.sort(products);
        List<List<String>> answer = new ArrayList<>();
        String prefix = "";
        for (char ch : searchWord.toCharArray()) {
            prefix += ch;
            List<String> current = new ArrayList<>();
            for (String product : products) {
                if (product.startsWith(prefix)) {
                    current.add(product);
                    if (current.size() == 3) break;
                }
            }
            answer.add(current);
        }
        return answer;
    }
}
