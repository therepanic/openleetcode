class Solution {
  List<double> sampleStats(List<int> count) {
    int kth(int k) {
      int acc = 0;
      for (int v = 0; v < count.length; v++) {
        acc += count[v];
        if (acc >= k) {
          return v;
        }
      }
      return 0;
    }

    int tot = 0;
    int cnt = 0;
    int? mini;
    int maxi = 0;
    int mode = 0;
    int modeCnt = 0;

    for (int v = 0; v < count.length; v++) {
      int c = count[v];
      if (c > 0) {
        mini ??= v;
        maxi = v;
        tot += c;
        cnt += v * c;
        if (c > modeCnt) {
          modeCnt = c;
          mode = v;
        }
      }
    }

    double m;
    if (tot % 2 == 1) {
      m = kth(tot ~/ 2 + 1).toDouble();
    } else {
      m = (kth(tot ~/ 2) + kth(tot ~/ 2 + 1)) / 2.0;
    }

    return [mini!.toDouble(), maxi.toDouble(), cnt / tot.toDouble(), m, mode.toDouble()];
  }
}
