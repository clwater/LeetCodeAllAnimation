# Best Time to Buy and Sell Stock IV
# 买卖股票的最佳时机 IV

## Description
Say you have an array for which the i-th element is the price of a given stock on day i.
Design an algorithm to find the maximum profit. You may complete at most k transactions.

## Description
给定一个数组，它的第 i 个元素是一支给定的股票在第 i 天的价格。
设计一个算法来计算你所能获取的最大利润。你最多可以完成 k 笔交易。
注意: 你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。

## Example
### Example 1:
    Input: [2,4,1], k = 2
    Output: 2
    Explanation: Buy on day 1 (price = 2) and sell on day 2 (price = 4), profit = 4-2 = 2.

### Example 2:
    Input: [3,2,6,5,0,3], k = 2
    Output: 7
    Explanation: Buy on day 2 (price = 2) and sell on day 3 (price = 6), profit = 6-2 = 4.
                 Then buy on day 5 (price = 0) and sell on day 6 (price = 3), profit = 3-0 = 3.

## 示例
### 示例 1:
    输入: [2,4,1], k = 2
    输出: 2
    解释: 在第 1 天 (股票价格 = 2) 的时候买入，在第 2 天 (股票价格 = 4) 的时候卖出，这笔交易所能获得利润 = 4-2 = 2 。

### 示例 2:
    输入: [3,2,6,5,0,3], k = 2
    输出: 7
    解释: 在第 2 天 (股票价格 = 2) 的时候买入，在第 3 天 (股票价格 = 6) 的时候卖出, 这笔交易所能获得利润 = 6-2 = 4 。
         随后，在第 5 天 (股票价格 = 0) 的时候买入，在第 6 天 (股票价格 = 3) 的时候卖出, 这笔交易所能获得利润 = 3-0 = 3 。

## Other
### Note:
* You may not engage in multiple transactions at the same time (ie, you must sell the stock before you buy again).



## Solution
### 动态规划
动态规划是类似题目的通用解答方式, 在这里我们使用动态规划来解决, 需要注意的是k可以转化为无限次交易的情况, 以及状态转移公式的确定


## Code 

```java
    //T O(n * n)
    //S O(n * n)
    public int maxProfit(int k, int[] prices) {

        //特殊值处理
        if (prices == null || prices.length == 0) {
            return 0;
        }

        //获取数组的长度
        int N = prices.length;

        //当k非常大时转为无限次交易
        //题目可以转化为买卖股票的最佳时机II的问题
        //这里使用贪心的思路解决, 也可以使用其它方法解决
        if (k >= N / 2) {
            int result = 0;
            for (int i = 1; i < prices.length; i++) {
                //计算当前尝试前一天买入今天卖出的收入
                int income = prices[i] - prices[i - 1];
                //如果当前当前收入大于, 则记录此时操作的收入
                if (income > 0) {
                    result += income;
                }
            }
            return result;
        }

        //定义dp数组三维
        //dp[i][k][0] 表示第i天交易了k次时为卖出状态的最大收益
        //dp[i][k][1] 表示第i天交易了k次时为买入状态的最大收益
        int[][][] dp = new int[N][k + 1][2];

        //初始化第一天特殊值处理
        for (int _k = 0; _k <= k; ++_k) {
            dp[0][_k][0] = 0;
            dp[0][_k][1] = -prices[0];
        }

        //依次遍历需要处理的天数
        for (int i = 1; i < N; ++i) {
            //当前处理的次数
            for (int _k = 1; _k <= k; ++_k) {
                //处理第k次卖出
                //第k次卖出, 第k次卖出后不购入新的, 或者从第k次买入转换
                dp[i][_k][0] = Math.max(dp[i - 1][_k][0], dp[i - 1][_k][1] + prices[i]);
                //处理第k次买入
                //第k次买入, 第k次买入后一直持有, 或者从第k-1卖出转换
                dp[i][_k][1] = Math.max(dp[i - 1][_k][1], dp[i - 1][_k - 1][0] - prices[i]);
            }
        }


        //利润最大值就保存在dp[n-1][k][0]中,我们直接返回即可
        return dp[N - 1][k][0];
    }
```