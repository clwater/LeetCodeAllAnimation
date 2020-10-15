# Find the Derangement of An Array
# 寻找数组的错位排列

## Description
In combinatorial mathematics, a derangement is a permutation of the elements of a set, such that no element appears in its original position.

There's originally an array consisting of n integers from 1 to n in ascending order, you need to find the number of derangement it can generate.

Also, since the answer may be very large, you should return the output mod 10^9 + 7.

## Description
在组合数学中，如果一个排列中所有元素都不在原先的位置上，那么这个排列就被称为错位排列。

给定一个从 1 到 n 升序排列的数组，你可以计算出总共有多少个不同的错位排列吗？

由于答案可能非常大，你只需要将答案对 10^9+7 取余输出即可。


## Example
### Example 1:
    Input: 3
    Output: 2
    Explanation: 
    The original array is [1,2,3]. 
    The two derangements are [2,3,1] and [3,1,2].

## 样例
### 样例 1:
    输入: 3
    输出: 2
    解释: 原始的数组为 [1,2,3]。两个错位排列的数组为 [2,3,1] 和 [3,1,2]。

### Note:
n is in the range of [1, 10^6].

## 注意
n 的范围是 [1, 10^6]

## Solution
### 枚举迭代
这个题目我们可以看为另一种的斐波那契数列, 不过这里的通式为f(n)= (n - 1) * (f(n - 1) + f(n - 2))

### Code

```java
    //T O(n)
    //S O(1)
    public int findDerangement(int n) {
        //位置0, 1的处理
        if (n == 0) {
            return 1;
        }
        if (n == 1) {
            return 0;
        }

        //当前n位的结果
        int result = 0;
        //n-1 及n-2 的信息
        int pre = 0, pre2 = 1;


        //循环处理剩下的位数
        for (int i = 2; i <= n; i++) {
            //f(n) = (n - 1) * (f(n - 1) * f(n - 2))
            //降低精度 避免溢出
            result = (int) ((i - 1L) * (pre + pre2) % 1000000007);
            //更新前两位的信息
            pre2 = pre;
            pre = result;
        }

        return result;
    }
```