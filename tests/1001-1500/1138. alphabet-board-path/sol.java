class Solution {
    public String alphabetBoardPath(String target) {
        int[][] arr = {{0,1,2,3,4},{5,6,7,8,9},{10,11,12,13,14},{15,16,17,18,19},{20,21,22,23,24},{25}};
        int[] word = new int[target.length()];
        for (int i = 0; i < target.length(); i++) {
            word[i] = target.charAt(i) - 'a';
        }
        StringBuilder s = new StringBuilder();
        int j = 0, k = 0;
        if (word[0] % 5 != 0) {
            for (int d = 0; d < word[0] / 5; d++) s.append('D');
        } else {
            for (int d = 0; d < word[0] / 5; d++) s.append('D');
        }
        if (word[0] % 5 >= 0) {
            for (int r = 0; r < word[0] % 5; r++) s.append('R');
        }
        s.append('!');
        for (int i = 1; i < word.length; i++) {
            for (int h = 0; h < arr.length; h++) {
                for (int l = 0; l < arr[h].length; l++) {
                    if (arr[h][l] == word[i-1]) j = h;
                    if (arr[h][l] == word[i]) k = h;
                }
            }
            if (word[i-1] == 25) {
                if (j > k) {
                    for (int u = 0; u < j - k; u++) s.append('U');
                } else {
                    for (int d = 0; d < k - j; d++) s.append('D');
                }
                if (word[i] % 5 >= word[i-1] % 5) {
                    for (int r = 0; r < word[i] % 5 - word[i-1] % 5; r++) s.append('R');
                } else {
                    for (int l = 0; l < word[i-1] % 5 - word[i] % 5; l++) s.append('L');
                }
            } else {
                if (word[i] % 5 >= word[i-1] % 5) {
                    for (int r = 0; r < word[i] % 5 - word[i-1] % 5; r++) s.append('R');
                } else {
                    for (int l = 0; l < word[i-1] % 5 - word[i] % 5; l++) s.append('L');
                }
                if (j > k) {
                    for (int u = 0; u < j - k; u++) s.append('U');
                } else {
                    for (int d = 0; d < k - j; d++) s.append('D');
                }
            }
            s.append('!');
        }
        return s.toString();
    }
}
