class Solution {
    public int countPalindromicSubsequence(String s) {
        int n = s.length();
        int[] first = new int[26];
        int[] last = new int[26];
        java.util.Arrays.fill(first, -1);
        java.util.Arrays.fill(last, -1);
        
        for (int i = 0; i < n; i++) {
            int c = s.charAt(i) - 'a';
            if (first[c] == -1) first[c] = i;
            last[c] = i;
        }
        
        int count = 0;
        for (int c = 0; c < 26; c++) {
            if (first[c] == -1 || first[c] == last[c]) continue;
            java.util.HashSet<Character> set = new java.util.HashSet<>();
            for (int i = first[c] + 1; i < last[c]; i++) {
                set.add(s.charAt(i));
            }
            count += set.size();
        }
        return count;
    }
}
