class Solution {
  int interchangeableRectangles(List<List<int>> rectangles) {
    int gcd(int a, int b) {
      while (b != 0) {
        int temp = a % b;
        a = b;
        b = temp;
      }
      return a;
    }
    
    Map<Pair<int, int>, int> ratioCount = {};
    int result = 0;
    
    for (var rect in rectangles) {
      int width = rect[0], height = rect[1];
      int g = gcd(width, height);
      var reduced = Pair(width ~/ g, height ~/ g);
      result += ratioCount[reduced] ?? 0;
      ratioCount[reduced] = (ratioCount[reduced] ?? 0) + 1;
    }
    
    return result;
  }
}

class Pair<A, B> {
  final A a;
  final B b;
  Pair(this.a, this.b);
  
  @override
  bool operator ==(Object other) => other is Pair && other.a == a && other.b == b;
  
  @override
  int get hashCode => a.hashCode ^ b.hashCode;
}
