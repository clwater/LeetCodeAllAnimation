# Paint House
# 粉刷房子

## Description
There are a row of n houses, each house can be painted with one of the three colors: red, blue or green. The cost of painting each house with a certain color is different. You have to paint all the houses such that no two adjacent houses have the same color.
The cost of painting each house with a certain color is represented by a n x 3 cost matrix. For example, costs[0][0] is the cost of painting house 0 with color red; costs[1][2] is the cost of painting house 1 with color green, and so on... Find the minimum cost to paint all houses.

## Description
假如有一排房子，共 n 个，每个房子可以被粉刷成红色、蓝色或者绿色这三种颜色中的一种，你需要粉刷所有的房子并且使其相邻的两个房子颜色不能相同。
当然，因为市场上不同颜色油漆的价格不同，所以房子粉刷成不同颜色的花费成本也是不同的。每个房子粉刷成不同颜色的花费是以一个 n x 3 的矩阵来表示的。
例如，costs[0][0] 表示第 0 号房子粉刷成红色的成本花费；costs[1][2] 表示第 1 号房子粉刷成绿色的花费，以此类推。请你计算出粉刷完所有房子最少的花费成本。


## Example
### Example:
    Input: [[17,2,17],[16,16,5],[14,3,19]]
    Output: 10
    Explanation: Paint house 0 into blue, paint house 1 into green, paint house 2 into blue. 
                 Minimum cost: 2 + 5 + 3 = 10.

## 示例
### 示例：
    输入: [[17,2,17],[16,16,5],[14,3,19]]
    输出: 10
    解释: 将 0 号房子粉刷成蓝色，1 号房子粉刷成绿色，2 号房子粉刷成蓝色。
         最少花费: 2 + 5 + 3 = 10。

## Other
### Note:
* All costs are positive integers.

## 其它
### 注意：
* 所有花费均为正整数。

## Solution
### 动态规划
我们可以计算每个子问题的成本,从具有最高的门牌号的子问题开始，并将结果直接写入到输入数组.



## Code 

```java
    //T O(n)
    //S O(1)
    public int minCost(int[][] costs) {
        //处理特殊情况
        if (costs.length == 0){
            return 0;
        }

        //从第二行开始比较当前情况
        for (int n = 1; n < costs.length; n++) {
            costs[n][0] += Math.min(costs[n - 1][1], costs[n - 1][2]);
            costs[n][1] += Math.min(costs[n - 1][0], costs[n - 1][2]);
            costs[n][2] += Math.min(costs[n - 1][0], costs[n - 1][1]);
        }

        //返回最后一行中结果最小的情况
        return Math.min(Math.min(costs[costs.length - 1][0], costs[costs.length - 1]
                [1]), costs[costs.length - 1][2]);
    }
```