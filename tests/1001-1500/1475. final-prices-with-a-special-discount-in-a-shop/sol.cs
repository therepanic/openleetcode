public class Solution {
    public int[] FinalPrices(int[] prices) {
        var stack = new System.Collections.Generic.Stack<int>();
        for (int i = 0; i < prices.Length; i++) {
            while (stack.Count > 0 && prices[stack.Peek()] >= prices[i]) {
                int index = stack.Pop();
                prices[index] -= prices[i];
            }
            stack.Push(i);
        }
        return prices;
    }
}
