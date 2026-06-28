class Solution {
    public int shoppingOffers(int[] price, int[][] special, int[] needs) {
        List<Integer> priceList = new ArrayList<>();
        for (int x : price) {
            priceList.add(x);
        }
        List<List<Integer>> specialList = new ArrayList<>();
        for (int[] offer : special) {
            List<Integer> row = new ArrayList<>();
            for (int x : offer) {
                row.add(x);
            }
            specialList.add(row);
        }
        List<Integer> needsList = new ArrayList<>();
        for (int x : needs) {
            needsList.add(x);
        }
        int p = priceList.size();
        Map<List<Integer>, Integer> memo = new HashMap<>();
        return dp(needsList, priceList, specialList, p, memo);
    }
    
    private int dp(List<Integer> curr, List<Integer> price, List<List<Integer>> special, int p, Map<List<Integer>, Integer> memo) {
        boolean allZero = true;
        for (int i : curr) {
            if (i != 0) {
                allZero = false;
                break;
            }
        }
        if (allZero) return 0;
        
        if (memo.containsKey(curr)) return memo.get(curr);
        
        int n = curr.size();
        int res = 0;
        for (int i = 0; i < p; i++) {
            res += curr.get(i) * price.get(i);
        }
        
        for (List<Integer> offer : special) {
            boolean canUse = true;
            for (int i = 0; i < n; i++) {
                if (curr.get(i) < offer.get(i)) {
                    canUse = false;
                    break;
                }
            }
            if (canUse) {
                List<Integer> newCurr = new ArrayList<>();
                for (int i = 0; i < n; i++) {
                    newCurr.add(curr.get(i) - offer.get(i));
                }
                res = Math.min(res, offer.get(offer.size() - 1) + dp(newCurr, price, special, p, memo));
            }
        }
        
        memo.put(curr, res);
        return res;
    }
}
