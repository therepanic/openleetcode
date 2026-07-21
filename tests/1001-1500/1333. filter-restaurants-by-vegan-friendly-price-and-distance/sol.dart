class Solution {
  List<int> filterRestaurants(List<List<int>> restaurants, int veganFriendly, int maxPrice, int maxDistance) {
    List<List<int>> restaurantsFiltered = [];

    for (var restaurant in restaurants) {
      if (veganFriendly == 1 && restaurant[2] != 1) {
        continue;
      }
      
      if (restaurant[3] > maxPrice) {
        continue;
      }

      if (restaurant[4] > maxDistance) {
        continue;
      }

      restaurantsFiltered.add([restaurant[1], restaurant[0]]);
    }

    restaurantsFiltered.sort((a, b) {
      if (b[0] != a[0]) {
        return b[0].compareTo(a[0]);
      }
      return b[1].compareTo(a[1]);
    });

    List<int> result = [];

    for (var restaurant in restaurantsFiltered) {
      result.add(restaurant[1]);
    }

    return result;
  }
}
