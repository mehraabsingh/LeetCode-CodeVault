class Solution {
    private let MOD = 1_000_000_007

    func magicalSum(_ m: Int, _ k: Int, _ nums: [Int]) -> Int {
        let comb = getComb(m, m)
        var mem = Array(
            repeating: Array(
                repeating: Array(
                    repeating: Array<Int?>(repeating: nil, count: m + 1),
                    count: nums.count + 1
                ),
                count: k + 1
            ),
            count: m + 1
        )

        return dp(m, k, 0, 0, nums, &mem, comb)
    }

    private func dp(
        _ m: Int,
        _ k: Int,
        _ i: Int,
        _ carry: Int,
        _ nums: [Int],
        _ mem: inout [[[[Int?]]]],
        _ comb: [[Int]]
    ) -> Int {
        if m < 0 || k < 0 || (m + carry.nonzeroBitCount < k) {
            return 0
        }
        if m == 0 {
            return k == carry.nonzeroBitCount ? 1 : 0
        }
        if i == nums.count {
            return 0
        }
        if let cached = mem[m][k][i][carry] {
            return cached
        }

        var res = 0
        for count in 0...m {
            let contribution = (Int64(comb[m][count]) * modPow(Int64(nums[i]), count)) % Int64(MOD)
            let newCarry = carry + count
            let sub = dp(m - count, k - (newCarry % 2), i + 1, newCarry / 2, nums, &mem, comb)
            res = (res + Int((Int64(sub) * contribution) % Int64(MOD))) % MOD
        }

        mem[m][k][i][carry] = res
        return res
    }

    private func getComb(_ n: Int, _ k: Int) -> [[Int]] {
        var comb = Array(repeating: Array(repeating: 0, count: k + 1), count: n + 1)
        for i in 0...n {
            comb[i][0] = 1
        }
        for i in 1...n {
            for j in 1...k {
                comb[i][j] = (comb[i - 1][j] + comb[i - 1][j - 1]) % MOD
            }
        }
        return comb
    }

    private func modPow(_ x: Int64, _ n: Int) -> Int64 {
        if n == 0 { return 1 }
        if n % 2 == 1 {
            return (x * modPow(x % Int64(MOD), n - 1)) % Int64(MOD)
        } else {
            return modPow((x * x) % Int64(MOD), n / 2) % Int64(MOD)
        }
    }
}
