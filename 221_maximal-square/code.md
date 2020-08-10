# Maximal Square
# 最大正方形


## Description
Given a 2D binary matrix filled with 0's and 1's, find the largest square containing only 1's and return its area.

## Description
在一个由 0 和 1 组成的二维矩阵内，找到只包含 1 的最大正方形，并返回其面积。




## Example
    Input: 

    1 0 1 0 0
    1 0 1 1 1
    1 1 1 1 1
    1 0 0 1 0

    Output: 4

## 示例
    输入: 

    1 0 1 0 0
    1 0 1 1 1
    1 1 1 1 1
    1 0 0 1 0

    输出: 4



## Solution
### 动态规划(dp)
当我们遇到这样的题目的时候, 我们可以很容易的想到动态规划(dp)的思路来解决

### Code

```java
    //T O(mn)
    //S O(mn)
    public int maximalSquare(char[][] matrix) {
        //定义最长边界(结果)
        int maxSide = 0;
        //特殊情况处理
        if (matrix == null || matrix.length == 0 || matrix[0].length == 0) {
            return maxSide;
        }
        //获取数组边界值
        int row = matrix.length, col = matrix[0].length;

        //定义dp数组, 表示已i,j为右下角, 只包含1的的正方形的边长最大值
        int[][] dp = new int[row][col];

        //循环数组
        for (int i = 0; i < row; i++) {
            for (int j = 0; j < col; j++) {
                //判断当前位置是否可以合规
                if (matrix[i][j] == '1') {
                    //首行或者首列
                    if (i == 0 || j == 0) {
                        dp[i][j] = 1;
                    } else {
                        //更新dp情况
                        dp[i][j] = Math.min(Math.min(dp[i - 1][j], dp[i][j - 1]), dp[i - 1][j - 1]) + 1;
                    }
                    //更新数组的最大值
                    maxSide = Math.max(maxSide, dp[i][j]);
                }
            }
        }
        return maxSide * maxSide;
    }
```