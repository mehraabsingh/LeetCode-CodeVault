class Solution {
    func maxPower(_ stations: [Int], _ r: Int, _ k: Int) -> Int {
        let n = stations.count
        var left: Int64 = Int64(stations.min()!)
        var right: Int64 = Int64(stations.reduce(0,+)) + Int64(k) + 1

        while left < right {
            let mid = (left + right) >> 1
            if check(stations, r, k, mid) {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return Int(left - 1)
    }

    func check(_ stations: [Int], _ r: Int, _ k: Int, _ minPower: Int64) -> Bool {
        var st = stations   // clone
        var add = Int64(k)
        let n = st.count
        var power: Int64 = 0

        // initialize first window (exclude stations[r], will add later)
        if r > 0 {
            for i in 0..<min(r, n) {
                power += Int64(st[i])
            }
        }

        for i in 0..<n {
            if i + r < n {
                power += Int64(st[i + r])
            }
            if power < minPower {
                let need = minPower - power
                if need > add { return false }
                let idx = min(n-1, i + r)
                st[idx] += Int(need)
                add -= need
                power += need
            }
            if i - r >= 0 {
                power -= Int64(st[i - r])
            }
        }
        return true
    }
}
