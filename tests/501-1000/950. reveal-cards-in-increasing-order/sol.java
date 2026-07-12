class Solution {
    public int[] deckRevealedIncreasing(int[] deck) {
        Arrays.sort(deck);
        int n = deck.length;
        LinkedList<Integer> rebuild = new LinkedList<>();
        rebuild.add(deck[n - 1]);
        for (int i = n - 2; i >= 0; i--) {
            rebuild.addFirst(rebuild.removeLast());
            rebuild.addFirst(deck[i]);
        }
        int[] result = new int[n];
        for (int i = 0; i < n; i++) {
            result[i] = rebuild.get(i);
        }
        return result;
    }
}
