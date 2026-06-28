class Solution {
    public int maximumSwap(int num) {
        char[] numList = Integer.toString(num).toCharArray();
        int[] lastIndex = new int[10];
        for (int i = 0; i < numList.length; i++) {
            lastIndex[numList[i] - '0'] = i;
        }
        for (int i = 0; i < numList.length; i++) {
            int d = numList[i] - '0';
            for (int x = 9; x > d; x--) {
                if (lastIndex[x] > i) {
                    char temp = numList[i];
                    numList[i] = numList[lastIndex[x]];
                    numList[lastIndex[x]] = temp;
                    return Integer.parseInt(new String(numList));
                }
            }
        }
        return num;
    }
}
