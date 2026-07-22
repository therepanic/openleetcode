class Solution {
    public int[] finalPrices(int[] prices) {
        int[] stack = new int[prices.length];
        int top = -1;
        for (int i = 0; i < prices.length; i++) {
            while (top >= 0 && prices[stack[top]] >= prices[i]) {
                int index = stack[top--];
                prices[index] -= prices[i];
            }
            stack[++top] = i;
        }
        return prices;
    }
}
