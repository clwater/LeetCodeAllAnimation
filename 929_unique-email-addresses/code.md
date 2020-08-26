# Unique Email Addresses
# 独特的电子邮件地址

## Description
Every email consists of a local name and a domain name, separated by the @ sign.
For example, in alice@leetcode.com, alice is the local name, and leetcode.com is the domain name.
Besides lowercase letters, these emails may contain '.'s or '+'s.
If you add periods ('.') between some characters in the local name part of an email address, mail sent there will be forwarded to the same address without dots in the local name.  For example, "alice.z@leetcode.com" and "alicez@leetcode.com" forward to the same email address.  (Note that this rule does not apply for domain names.)
If you add a plus ('+') in the local name, everything after the first plus sign will be ignored. This allows certain emails to be filtered, for example m.y+name@email.com will be forwarded to my@email.com.  (Again, this rule does not apply for domain names.)
It is possible to use both of these rules at the same time.
Given a list of emails, we send one email to each address in the list.  How many different addresses actually receive mails? 

## Description
每封电子邮件都由一个本地名称和一个域名组成，以 @ 符号分隔。
例如，在 alice@leetcode.com中， alice 是本地名称，而 leetcode.com 是域名。
除了小写字母，这些电子邮件还可能包含 '.' 或 '+'。
如果在电子邮件地址的本地名称部分中的某些字符之间添加句点（'.'），则发往那里的邮件将会转发到本地名称中没有点的同一地址。例如，"alice.z@leetcode.com” 和 “alicez@leetcode.com” 会转发到同一电子邮件地址。 （请注意，此规则不适用于域名。）
如果在本地名称中添加加号（'+'），则会忽略第一个加号后面的所有内容。这允许过滤某些电子邮件，例如 m.y+name@email.com 将转发到 my@email.com。 （同样，此规则不适用于域名。）
可以同时使用这两个规则。
给定电子邮件列表 emails，我们会向列表中的每个地址发送一封电子邮件。实际收到邮件的不同地址有多少？

## Example
###   Example 1:
    Input: ["test.email+alex@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"]
    Output: 2
    Explanation: "testemail@leetcode.com" and "testemail@lee.tcode.com" actually receive mails

## 示例
###   示例：
    输入：["test.email+alex@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"]
    输出：2
    解释：实际收到邮件的是 "testemail@leetcode.com" 和 "testemail@lee.tcode.com"。

## Other
###   Note:
* 1 <= emails[i].length <= 100
* 1 <= emails.length <= 100
* Each emails[i] contains exactly one '@' character.
* All local and domain names are non-empty.
* Local names do not start with a '+' character.

## 其它
###   提示：
* 1 <= emails[i].length <= 100
* 1 <= emails.length <= 100
* 每封 emails[i] 都包含有且仅有一个 '@' 字符。


## Solution
### 规范化
对于每个电子邮件地址, 我们求出它的规范化表示,即根据 '.' 和 '+' 的规则进行处理后得到的, 依次处理即可


## Code 

```java
    //T O(n)
    //S O(n)
    public int numUniqueEmails(String[] emails) {
        //通过set保存结果, 避免重复添加
        Set<String> result = new HashSet<>();
        for (String email : emails) {
            //通过@分割
            String[] splits = email.split("@");
            //获取本地地址
            String local = splits[0];
            //通过+分割, 并获取第一个元素
            //\\+为转义
            local = local.split("\\+")[0];
            //替换.为空
            local = local.replace(".", "");

            //获取域名
            String rest = splits[1];
            //加入set中
            result.add(local + '@' + rest);
        }
        return result.size();
    }
```