class Solution(object):
    def maxProfit(self, prices, strategy, k):
        n = len(prices)

        # Original profit
        original_profit = sum(strategy[i] * prices[i] for i in range(n))

        # Prefix sums
        pref_price = [0] * (n + 1)
        pref_sp = [0] * (n + 1)  # strategy * price

        for i in range(n):
            pref_price[i + 1] = pref_price[i] + prices[i]
            pref_sp[i + 1] = pref_sp[i] + strategy[i] * prices[i]

        half = k // 2
        max_gain = 0

        for l in range(n - k + 1):
            r = l + k

            # Old contribution
            old = pref_sp[r] - pref_sp[l]

            # New contribution
            # first half -> 0
            # second half -> 1
            new = pref_price[l + k] - pref_price[l + half]

            gain = new - old
            max_gain = max(max_gain, gain)

        return original_profit + max_gain
