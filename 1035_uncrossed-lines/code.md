# Uncrossed Lines
# 不相交的线

## Description
We write the integers of A and B (in the order they are given) on two separate horizontal lines.
Now, we may draw connecting lines: a straight line connecting two numbers A[i] and B[j] such that:
A[i] == B[j];
The line we draw does not intersect any other connecting (non-horizontal) line.
Note that a connecting lines cannot intersect even at the endpoints: each number can only belong to one connecting line.
Return the maximum number of connecting lines we can draw in this way.

## Description
我们在两条独立的水平线上按给定的顺序写下 A 和 B 中的整数。
现在，我们可以绘制一些连接两个数字 A[i] 和 B[j] 的直线，只要 A[i] == B[j]，且我们绘制的直线不与任何其他连线（非水平线）相交。
以这种方法绘制线条，并返回我们可以绘制的最大连线数。


## Note
1. 1 <= A.length <= 500
2. 1 <= B.length <= 500
3. 1 <= A[i], B[i] <= 2000

## 说明
1. 1 <= A.length <= 500
2. 1 <= B.length <= 500
3. 1 <= A[i], B[i] <= 2000
 


![/image.png](image.png)
## Example
### Example 1:
    Input: A = [1,4,2], B = [1,2,4]
    Output: 2
    Explanation: We can draw 2 uncrossed lines as in the diagram.
    We cannot draw 3 uncrossed lines, because the line from A[1]=4 to B[2]=4 will intersect the line from A[2]=2 to B[1]=2.

### Example 2:
    Input: A = [2,5,1,2,5], B = [10,5,2,1,5,2]
    Output: 3

### Example 3:
    Input: A = [1,3,7,1,7,5], B = [1,9,2,5,1]
    Output: 2
    


## 样例
### 示例 1：
    输入：A = [1,4,2], B = [1,2,4]
    输出：2
    解释：
    我们可以画出两条不交叉的线，如上图所示。
    我们无法画出第三条不相交的直线，因为从 A[1]=4 到 B[2]=4 的直线将与从 A[2]=2 到 B[1]=2 的直线相交。

### 示例 2：
    输入：A = [2,5,1,2,5], B = [10,5,2,1,5,2]
    输出：3

### 示例 3：
    输入：A = [1,3,7,1,7,5], B = [1,9,2,5,1]
    输出：2

## Solution

### 动态规划
这道题目可以通过动态规划来解决.这里我们先定义下dp,dp[i][j]表示A截止到i,B截止到j点,此时的最大连线数.这里需要额外为dp申请一行和一列来保证处理的时候不会越界, 当数组AB指向的内容相同的时候, dp[i][j]的值就为dp[i-1][j-1] + 1的值, 不然dp[i][j]则为dp[i][j-1]和dp[i-1][j]中较大的值 

### Code

```java
    //T O(mn)
    //S O(mn)
    public int maxUncrossedLines(int[] A, int[] B) {
        //定义dp数组, dp[i][j]表示A截止到i,B截止到j点,此时的最大连线数.
        //这里额外申请了一部分的空间
        //当i为0或者j为0的时候, 避免i-1或j-1越界
        //当然也可以通过其他方法避免越界的情况
        int[][] dp = new int[A.length + 1][B.length + 1];
        //因为额外申请了空间, 所以都是从1开始
        for (int i = 1; i <= A.length; i++) {
            for (int j = 1; j <= B.length; j++) {
                //判断当前AB数组所指向的内容是否相同并进行处理
                if (A[i - 1] == B[j - 1]){
                    dp[i][j] = dp[i - 1][j - 1] + 1;
                }else {
                    dp[i][j] = Math.max(dp[i][j - 1], dp[i - 1][j]);
                }
            }
        }
        return dp[A.length][B.length];

    }
```