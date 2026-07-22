class Solution {
    public List<Integer> filterRestaurants(int[][] restaurants, int veganFriendly, int maxPrice, int maxDistance) {
        List<int[]> restaurantsFiltered = new ArrayList<>();

        for (int[] restaurant : restaurants) {
            if (veganFriendly == 1 && restaurant[2] != 1) {
                continue;
            }
            
            if (restaurant[3] > maxPrice) {
                continue;
            }

            if (restaurant[4] > maxDistance) {
                continue;
            }

            restaurantsFiltered.add(new int[]{restaurant[1], restaurant[0]});
        }

        restaurantsFiltered.sort((a, b) -> {
            if (b[0] != a[0]) {
                return Integer.compare(b[0], a[0]);
            }
            return Integer.compare(b[1], a[1]);
        });

        List<Integer> result = new ArrayList<>();

        for (int[] restaurant : restaurantsFiltered) {
            result.add(restaurant[1]);
        }

        return result;
    }
}
