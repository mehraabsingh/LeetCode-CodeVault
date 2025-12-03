import java.util.*;

class Solution {
    public int countTrapezoids(int[][] points) {
        int n = points.length;
        Map<Slope, Map<Integer, Integer>> edges = new HashMap<>();
        Map<Line, Set<Integer>> lines = new HashMap<>();

        for (int i = 0; i < n - 1; i++) {
            int x1 = points[i][0], y1 = points[i][1];
            for (int j = i + 1; j < n; j++) {
                int x2 = points[j][0], y2 = points[j][1];
                int dx = x2 - x1;
                int dy = y2 - y1;
                int g = gcd(dx, dy);
                dx /= g;
                dy /= g;
                if (dx < 0 || (dx == 0 && dy < 0)) {
                    dx = -dx;
                    dy = -dy;
                }
                Slope s = new Slope(dx, dy);
                int w = dy * x1 - dx * y1;

                Map<Integer, Integer> m = edges.get(s);
                if (m == null) {
                    m = new HashMap<>();
                    edges.put(s, m);
                }
                m.put(w, m.getOrDefault(w, 0) + 1);

                Line ln = new Line(dx, dy, w);
                Set<Integer> set = lines.get(ln);
                if (set == null) {
                    set = new HashSet<>();
                    lines.put(ln, set);
                }
                set.add(i);
                set.add(j);
            }
        }

        long ans = 0;
        for (Map<Integer, Integer> m : edges.values()) {
            int size = m.size();
            if (size < 2) continue;
            int[] cnts = new int[size];
            int idx = 0;
            for (int v : m.values()) cnts[idx++] = v;
            for (int i = 0; i < size; i++) {
                long c1 = cnts[i];
                for (int j = i + 1; j < size; j++) {
                    long c2 = cnts[j];
                    ans += c1 * c2;
                }
            }
        }

        long dup = countParallelograms(points);

        for (Set<Integer> set : lines.values()) {
            if (set.size() >= 4) {
                int m = set.size();
                int[][] sub = new int[m][2];
                int idx = 0;
                for (int id : set) {
                    sub[idx][0] = points[id][0];
                    sub[idx][1] = points[id][1];
                    idx++;
                }
                dup -= countParallelograms(sub);
            }
        }

        long res = ans - dup;
        return (int) res;
    }

    private long countParallelograms(int[][] pts) {
        int n = pts.length;
        Map<Long, Integer> mp = new HashMap<>();
        for (int i = 0; i < n; i++) {
            int x1 = pts[i][0], y1 = pts[i][1];
            for (int j = i + 1; j < n; j++) {
                int x2 = pts[j][0], y2 = pts[j][1];
                long mx = (long) x1 + x2;
                long my = (long) y1 + y2;
                long key = (mx << 32) ^ (my & 0xffffffffL);
                mp.put(key, mp.getOrDefault(key, 0) + 1);
            }
        }
        long total = 0;
        for (int c : mp.values()) {
            if (c >= 2) {
                total += (long) c * (c - 1) / 2;
            }
        }
        return total;
    }

    private int gcd(int a, int b) {
        a = Math.abs(a);
        b = Math.abs(b);
        if (a == 0) return b;
        if (b == 0) return a;
        while (b != 0) {
            int t = a % b;
            a = b;
            b = t;
        }
        return a;
    }

    private static class Slope {
        int dx, dy;
        Slope(int dx, int dy) {
            this.dx = dx;
            this.dy = dy;
        }
        public boolean equals(Object o) {
            if (this == o) return true;
            if (!(o instanceof Slope)) return false;
            Slope s = (Slope) o;
            return dx == s.dx && dy == s.dy;
        }
        public int hashCode() {
            return 31 * dx + dy;
        }
    }

    private static class Line {
        int dx, dy, w;
        Line(int dx, int dy, int w) {
            this.dx = dx;
            this.dy = dy;
            this.w = w;
        }
        public boolean equals(Object o) {
            if (this == o) return true;
            if (!(o instanceof Line)) return false;
            Line l = (Line) o;
            return dx == l.dx && dy == l.dy && w == l.w;
        }
        public int hashCode() {
            int res = dx;
            res = 31 * res + dy;
            res = 31 * res + w;
            return res;
        }
    }
}
