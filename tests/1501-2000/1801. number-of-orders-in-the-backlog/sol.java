import java.util.*;

class Solution {
    public int getNumberOfBacklogOrders(int[][] orders) {
        PriorityQueue<int[]> buy = new PriorityQueue<>((a,b) -> Integer.compare(b[0], a[0]));
        PriorityQueue<int[]> sell = new PriorityQueue<>((a,b) -> Integer.compare(a[0], b[0]));
        for (int[] order : orders) {
            int price = order[0], amount = order[1], type = order[2];
            if (type == 0) {
                while (!sell.isEmpty() && sell.peek()[0] <= price) {
                    int[] s = sell.poll();
                    int sellPrice = s[0], sellAmount = s[1];
                    if (amount >= sellAmount) {
                        amount -= sellAmount;
                    } else {
                        sell.offer(new int[]{sellPrice, sellAmount - amount});
                        amount = 0;
                        break;
                    }
                }
            } else {
                while (!buy.isEmpty() && buy.peek()[0] >= price) {
                    int[] b = buy.poll();
                    int buyPrice = b[0], buyAmount = b[1];
                    if (amount >= buyAmount) {
                        amount -= buyAmount;
                    } else {
                        buy.offer(new int[]{buyPrice, buyAmount - amount});
                        amount = 0;
                        break;
                    }
                }
            }
            if (amount > 0) {
                if (type == 0) {
                    buy.offer(new int[]{price, amount});
                } else {
                    sell.offer(new int[]{price, amount});
                }
            }
        }
        long res = 0;
        for (int[] x : buy) res += x[1];
        for (int[] x : sell) res += x[1];
        return (int)(res % 1000000007);
    }
}
