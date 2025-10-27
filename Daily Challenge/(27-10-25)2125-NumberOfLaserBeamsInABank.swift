class Solution {
    func numberOfBeams(_ bank: [String]) -> Int {
        var prev = 0, res = 0
        for row in bank {
            let count = row.filter { $0 == "1" }.count
            if count > 0 {
                res += prev * count
                prev = count
            }
        }
        return res
    }
}
