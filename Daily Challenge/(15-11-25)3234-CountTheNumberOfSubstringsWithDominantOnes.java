class Solution {
    public int numberOfSubstrings(String s) {
        int n = s.length();
        int[] pref1 = new int[n+1];
        int[] pref0 = new int[n+1];
        for (int i = 0; i < n; i++) {
            pref1[i+1] = pref1[i] + (s.charAt(i) == '1' ? 1 : 0);
            pref0[i+1] = pref0[i] + (s.charAt(i) == '0' ? 1 : 0);
        }

        int res = 0;
        int B = 250;
        for (int i = 0; i < n; i++) {
            int ones = 0, zeros = 0;
            for (int j = i; j < Math.min(n, i + B); j++) {
                if (s.charAt(j) == '1') ones++;
                else zeros++;
                if (ones >= zeros * zeros) res++;
            }
        }

        int[] pos = new int[n];
        int pc = 0;
        for (int i = 0; i < n; i++) if (s.charAt(i) == '1') pos[pc++] = i;

        for (int z = 1; z * z < n; z++) {
            int need = z * z;
            int p = 0;
            for (int i = 0; i < n; i++) {
                int l = p, r = pc - 1, ans = pc;
                while (l <= r) {
                    int m = (l + r) >> 1;
                    if (pos[m] >= i) {
                        ans = m;
                        r = m - 1;
                    } else l = m + 1;
                }
                int idx = ans + need - 1;
                if (idx >= pc) continue;
                int j = pos[idx];
                int maxR = Math.min(n - 1, pos[ans + need - 1] + z - 1);
                res += Math.max(0, maxR - j + 1);
            }
        }

        return res;
    }
}
