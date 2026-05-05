#include <bits/stdc++.h>
${IMPORTS}
using namespace std;

${UTILITIES}

${SOLUTION}

int main() {
  ios::sync_with_stdio(false);
  cin.tie(nullptr);
  auto start = chrono::steady_clock::now();
  ${CALL_SOLUTION};
  auto end = chrono::steady_clock::now();
  cout << chrono::duration_cast<chrono::milliseconds>(end - start).count();
  return 0;
}
