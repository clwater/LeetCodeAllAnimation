# Best Time to Buy and Sell Stock III
# 买卖股票的最佳时机 III

## Description
Say you have an array for which the ith element is the price of a given stock on day i.
Design an algorithm to find the maximum profit. You may complete at most two transactions.

## Description
给定一个数组，它的第 i 个元素是一支给定的股票在第 i 天的价格。
设计一个算法来计算你所能获取的最大利润。你最多可以完成 两笔 交易。
注意: 你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。

## Example
### Example 1:
    Input: prices = [3,3,5,0,0,3,1,4]
    Output: 6
    Explanation: Buy on day 4 (price = 0) and sell on day 6 (price = 3), profit = 3-0 = 3.
    Then buy on day 7 (price = 1) and sell on day 8 (price = 4), profit = 4-1 = 3.

### Example 2:
    Input: prices = [1,2,3,4,5]
    Output: 4
    Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.

### Example 3:
    Input: prices = [7,6,4,3,1]
    Output: 0
    Explanation: In this case, no transaction is done, i.e. max profit = 0.

### Example 4:
    Input: prices = [1]
    Output: 0

## 示例
### 示例 1:
    输入: [3,3,5,0,0,3,1,4]
    输出: 6
    解释: 在第 4 天（股票价格 = 0）的时候买入，在第 6 天（股票价格 = 3）的时候卖出，这笔交易所能获得利润 = 3-0 = 3 。
         随后，在第 7 天（股票价格 = 1）的时候买入，在第 8 天 （股票价格 = 4）的时候卖出，这笔交易所能获得利润 = 4-1 = 3 。

### 示例 2:
    输入: [1,2,3,4,5]
    输出: 4
    解释: 在第 1 天（股票价格 = 1）的时候买入，在第 5 天 （股票价格 = 5）的时候卖出, 这笔交易所能获得利润 = 5-1 = 4 。   
         注意你不能在第 1 天和第 2 天接连购买股票，之后再将它们卖出。   
         因为这样属于同时参与了多笔交易，你必须在再次购买前出售掉之前的股票。

### 示例 3:
    输入: [7,6,4,3,1] 
    输出: 0 
    解释: 在这个情况下, 没有交易完成, 所以最大利润为 0。

## Other
### Note: 
You may not engage in multiple transactions at the same time (i.e., you must sell the stock before you buy again).



### Constraints:
* 1 <= prices.length <= 105
* 0 <= prices[i] <= 105



## Solution
### 贪心
这里我们仍然可以延续使用贪心的思路, 在这里我们可以简化为寻找两个最大的递增区间和.


## Code 

```java
//T O(n)
    //S O(n)
    public int maxProfit(int[] prices) {

        //获取数组长度
        int N = prices.length;
        //特殊值处理
        if (N <= 1) {
            return 0;
        }

        //定义左边子数组最大收益(或只交易一次)
        int[] maxLeft = new int[N];
        //定义右边子数组最大收益
        int[] maxRight = new int[N];

        //已知的最低价格
        int minValue = prices[0];
        //已知的最高价格
        int maxValue = prices[N - 1];

        //从左到右遍历一次寻找左侧的的最大收益
        for (int i = 1; i < N; i++) {
            minValue = Math.min(prices[i], minValue);
            maxLeft[i] = Math.max(maxLeft[i - 1], prices[i] - minValue);

        }



        //从左到右遍历一次寻找左侧的的最大收益
        for (int i = N - 1; i >= 0; i--) {
            maxValue = Math.max(prices[i], maxValue);
            maxRight[i] = maxValue - prices[i];
        }


        //定义当前结果
        int result = 0;
        //寻找两次交易的最大收益
        for (int i = 1; i < N - 1; i++) {
            result = Math.max(result, maxLeft[i] + maxRight[i]);
        }

        //比较一次交易和两次交易的较大值
        return Math.max(result, maxLeft[N - 1]);

    }
```