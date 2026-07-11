class Solution {
  int carFleet(int target, List<int> position, List<int> speed) {
    List<List<int>> cars = [];
    for (int i = 0; i < position.length; i++) {
      cars.add([position[i], speed[i]]);
    }
    cars.sort((a, b) => b[0].compareTo(a[0]));
    List<double> stack = [];
    for (var car in cars) {
      double t = (target - car[0]) / car[1];
      if (stack.isEmpty || t > stack.last) {
        stack.add(t);
      }
    }
    return stack.length;
  }
}
