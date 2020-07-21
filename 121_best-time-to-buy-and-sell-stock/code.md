# Best Time to Buy and Sell Stock
# 买卖股票的最佳时机

## Description
Say you have an array for which the ith element is the price of a given stock on day i.

If you were only permitted to complete at most one transaction (i.e., buy one and sell one share of the stock), design an algorithm to find the maximum profit.


## Description
给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。

如果你最多只允许完成一笔交易（即买入和卖出一支股票一次），设计一个算法来计算你所能获取的最大利润。




## Example
### Example 1:
    Input: [7,1,5,3,6,4]
    Output: 5
    Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
             Not 7-1 = 6, as selling price needs to be larger than buying price.

### Example 2:
    Input: [7,6,4,3,1]
    Output: 0
    Explanation: In this case, no transaction is done, i.e. max profit = 0.


## 样例
### 样例  1:
	输入: [7,1,5,3,6,4]
    输出: 5
    解释: 在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
     注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格；同时，你不能在买入前卖出股票。


### 样例 2:
	输入: [7,6,4,3,1]
    输出: 0
    解释: 在这种情况下, 没有交易完成, 所以最大利润为 0。    

## Note
that you cannot sell a stock before you buy one.

## 注意

你不能在买入股票前卖出股票。


## Solution

### 贪心
这道题目还是比较简单的题目, 从最简单的暴力破解到我们使用的贪心都可以解决, 除此之外的情况, 我们还可以用动态规划来解答.这里我们使用贪心的想法, 简单来说, 我们记录下当天之前最低的价格, 我们在当天卖出, 看下收益的情况,并和历史中最高的收益进行比较即可.    

### Code

```java
    //T O(n)
    //S O(1)
    public int maxProfit(int[] prices) {
        //非空判断
        if (prices == null || prices.length == 0){
            return 0;
        }
        //定义返回结果
        int result = 0;
        //定义最小值(默认为数组的第一个)
        int min = prices[0];

        //遍历数组
        for(int price: prices){
            //贪心寻找
            //在此之前价格最低购买, 此时出售的情况
            min = Math.min(min, price);
            result = Math.max(result, price - min);
        }

        return result;
    }
```