# Count Primes
# 计数质数

## Description
Count the number of prime numbers less than a non-negative number, n.

## Description
统计所有小于非负整数 n 的质数的数量。

## Example
### Example:
    Input: 10
    Output: 4
    Explanation: There are 4 prime numbers less than 10, they are 2, 3, 5, 7.

## 示例
### 示例:
    输入: 10
    输出: 4
    解释: 小于 10 的质数一共有 4 个, 它们是 2, 3, 5, 7 。



## Solution
### 素数筛选
除了可以使用简单的暴力搜索的方法, 这里我们可以使用常见的素数筛选法埃拉托斯特尼筛法来解决

## Code 

```java
    //T O(n * log logn)
    //S O(n)
    public int countPrimes(int n) {
        //初始化质数集
        boolean[] isPrime = new boolean[n];

        //初始化赋值为true
        Arrays.fill(isPrime, true);
        //从2开始 √n结束
        for (int i = 2; i * i < n; i++){
            //当前为质数时进行校验
            if (isPrime[i]) {
                //从√n开始到n结束, 将当前i的倍数的数值标为非质数
                for (int j = i * i; j < n; j += i) {
                    isPrime[j] = false;
                }
            }
        }


        //设置返回值
        int result = 0;
        //遍历寻找仍为质数的数量
        for (int i = 2; i < n; i++) {
            if (isPrime[i]) {
                result++;
            }
        }

        return result;

    }
```