class Solution {
    static final long MOD = 1000000007;
    public int countPermutations(int[] complexity) {
        int n = complexity.length;
        for (int i = 1; i < n; i++) if (complexity[0] >= complexity[i]) return 0;
        long ans = 1;
        for (int i = 1; i <= n - 1; i++) ans = (ans * i) % MOD;
        return (int) ans;
    }
}
