class Solution {
    func findXSum(_ nums: [Int], _ k: Int, _ x: Int) -> [Int] {
        var freq = [Int:Int]()
        var res = [Int]()
        var l = 0

        for r in 0..<nums.count {
            freq[nums[r], default: 0] += 1
            if r - l + 1 == k {
                var arr = [(Int,Int)]()
                for (v,c) in freq { arr.append((v,c)) }
                arr.sort { a,b in
                    if a.1 == b.1 { return a.0 > b.0 }
                    return a.1 > b.1
                }
                var cnt = 0
                var sum = 0
                for (v,c) in arr {
                    if cnt == x { break }
                    sum += v * c
                    cnt += 1
                }
                res.append(sum)
                freq[nums[l]]! -= 1
                if freq[nums[l]] == 0 { freq.removeValue(forKey: nums[l]) }
                l += 1
            }
        }
        return res
    }
}
