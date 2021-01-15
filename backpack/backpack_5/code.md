# 二维背包问题


## Description
有 N 件物品和一个容量是 V 的背包，背包能承受的最大重量是 M。
每件物品只能用一次。体积是 vi，重量是 mi，价值是 wi。
 求解将哪些物品装入背包，可使物品总体积不超过背包容量，总重量不超过背包可承受的最大重量，且价值总和最大。
输出最大价值。


## 示例
### 示例 :
		输入:
		4 5 6 
		1 2 3
		2 4 4
		3 4 5
		4 5 6
	输出:
		8
	说明
		第一行两个整数，N，V,M，用空格隔开，分别表示物品件数、背包容积和背包可承受的最大重量。
        接下来有 N 行，每行三个整数 vi,mi,wi，用空格隔开，分别表示第 i 件物品的体积、重量和价值。



## Solution
### 背包问题(动态规划)
如果你已经理解了01背包问题, 那么这个题目就十分的简单了, 只要在01背包问题的基础上增加一个维度就可以了

### Code

```java
        //T O(NVM))
    //S O(NVM)
    public int TwoDimensionalPack(int[] v, int[] m, int[] w, int N, int V, int M) {
        //创建dp数组
        //其中dp[i][j]表示 当使用前i件物品恰放入容量为j的背包中, 此时背包内可以获得的最大价值
        int[][][] dp = new int[N + 1][V + 1][M + 1];

        //这里我们使用量两层的循环, 不过我们可以发现当计算dp[i][]的时候都是只和dp[i-1][]有关,
        //所以此时的空间复杂度可以降低为O(VM)
        for (int i = 1; i <= N; i++) {
            for (int j = 1; j <= V; j++) {
                for (int weight = 1; weight <= M; weight++) {
                    //这里需要判断当前物品是否可以放入
                    //需要同时验证体积和重量
                    if (j >= v[i] && weight >= m[i]) {
                        dp[i][j][weight] = Math.max(dp[i - 1][j][weight], dp[i - 1][j - v[i]][weight - m[i]] + w[i]);
                    } else {
                        dp[i][j][weight] = dp[i - 1][j][weight];
                    }
                }
            }
        }

        return dp[N][V][M];
    }
```