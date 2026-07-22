class Solution {
  int distanceBetweenBusStops(List<int> distance, int start_value, int destination) {
    if (start_value > destination) {
      int temp = start_value;
      start_value = destination;
      destination = temp;
    }

    int direct = 0;
    int total = 0;
    for (int i = 0; i < distance.length; i++) {
      total += distance[i];
      if (i >= start_value && i < destination) {
        direct += distance[i];
      }
    }

    int wrap = total - direct;
    return direct < wrap ? direct : wrap;
  }
}
