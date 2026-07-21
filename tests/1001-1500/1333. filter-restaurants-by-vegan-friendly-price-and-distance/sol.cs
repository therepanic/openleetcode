public class Solution {
    public IList<int> FilterRestaurants(int[][] restaurants, int veganFriendly, int maxPrice, int maxDistance) {
        List<int[]> restaurantsFiltered = new List<int[]>();

        foreach (var restaurant in restaurants) {
            if (veganFriendly == 1 && restaurant[2] != 1) {
                continue;
            }
            
            if (restaurant[3] > maxPrice) {
                continue;
            }

            if (restaurant[4] > maxDistance) {
                continue;
            }

            restaurantsFiltered.Add(new int[] { restaurant[1], restaurant[0] });
        }

        restaurantsFiltered.Sort((a, b) => {
            if (b[0] != a[0]) {
                return b[0].CompareTo(a[0]);
            }
            return b[1].CompareTo(a[1]);
        });

        List<int> result = new List<int>();

        foreach (var restaurant in restaurantsFiltered) {
            result.Add(restaurant[1]);
        }

        return result;
    }
}
