public class Solution {
    public string AlphabetBoardPath(string target) {
        int[][] arr = new int[][] { new int[] {0,1,2,3,4}, new int[] {5,6,7,8,9}, new int[] {10,11,12,13,14}, new int[] {15,16,17,18,19}, new int[] {20,21,22,23,24}, new int[] {25} };
        int[] word = new int[target.Length];
        for (int i = 0; i < target.Length; i++) {
            word[i] = target[i] - 'a';
        }
        string s = "";
        int j = 0, k = 0;
        if (word[0] % 5 != 0) {
            s += new string('D', word[0] / 5);
        } else {
            s += new string('D', word[0] / 5);
        }
        if (word[0] % 5 >= 0) {
            s += new string('R', word[0] % 5);
        }
        s += "!";
        for (int i = 1; i < word.Length; i++) {
            for (int h = 0; h < arr.Length; h++) {
                for (int l = 0; l < arr[h].Length; l++) {
                    if (arr[h][l] == word[i-1]) j = h;
                    if (arr[h][l] == word[i]) k = h;
                }
            }
            if (word[i-1] == 25) {
                if (j > k) {
                    s += new string('U', j - k);
                } else {
                    s += new string('D', k - j);
                }
                if (word[i] % 5 >= word[i-1] % 5) {
                    s += new string('R', word[i] % 5 - word[i-1] % 5);
                } else {
                    s += new string('L', word[i-1] % 5 - word[i] % 5);
                }
            } else {
                if (word[i] % 5 >= word[i-1] % 5) {
                    s += new string('R', word[i] % 5 - word[i-1] % 5);
                } else {
                    s += new string('L', word[i-1] % 5 - word[i] % 5);
                }
                if (j > k) {
                    s += new string('U', j - k);
                } else {
                    s += new string('D', k - j);
                }
            }
            s += "!";
        }
        return s;
    }
}
