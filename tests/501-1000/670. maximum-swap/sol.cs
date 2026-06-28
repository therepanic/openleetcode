public class Solution {
    public int MaximumSwap(int num) {
        char[] numList = num.ToString().ToCharArray();
        Dictionary<int, int> lastIndex = new Dictionary<int, int>();
        for (int i = 0; i < numList.Length; i++) {
            lastIndex[numList[i] - '0'] = i;
        }
        for (int i = 0; i < numList.Length; i++) {
            int d = numList[i] - '0';
            for (int x = 9; x > d; x--) {
                if (lastIndex.ContainsKey(x) && lastIndex[x] > i) {
                    char temp = numList[i];
                    numList[i] = numList[lastIndex[x]];
                    numList[lastIndex[x]] = temp;
                    return int.Parse(new string(numList));
                }
            }
        }
        return num;
    }
}
