BASH cheatsheet
===============

Learn Bash by examples/ use cases

https://www.geeksforgeeks.org/introduction-linux-shell-shell-scripting/
http://tldp.org/LDP/abs/html/why-shell.html


Table of Contents
-----------------
  1. [Testing whether a string is null](#Testing-whether-a-string-is-null)
    a. [If else](#If-else) 
    b. [ -z "$String" ](#-z-Operator )
    c. [ -n "$String" ](#-n-Operator)
  2. Man test 
  3. [Write options](#Write-options)
    a. Cases
    b. Positional Parameters
    c. Dry run 
 
  
### Testing whether a string is null 
 
Thường sử dụng trước khi gán giá trị cho một biến. 

Example: Check if variable is assigned or not 
`DEFAULT_CHANNEL_VALUE="stable"
if [ -z "$CHANNEL" ]; then        // check $CHANNEL is null  
	CHANNEL=$DEFAULT_CHANNEL_VALUE
fi
`

http://tldp.org/LDP/abs/html/comparison-ops.html


#### If else

`if some-commands;
then then-commands
else else-commands
fi
`
some-commands is found to be true or it return status 0

Tham khảo: 

#### -z Operator 
[ -z "$String" ]

string is null, that is, has zero length 

`if [ -z "$string" ]
then
    echo "\$String is null."
else
    echo "\$String is not null."
fi
`
> [ -z "$string1" ] && echo "String1 is null"
-> Show "String1 is null"

> [ -z $string1 ] && echo "String1 is null"
-> Show "String1 is null"

This works with unquoted/quoted string within test brackets

#### -n Operator 
[ -n "$quotedString" ]

string is not null. Always quote a tested string. 

[]: test brackets
"": quote
 
Best practice: Luôn luôn quote "" một chuỗi (string) trong []

Using test man or man [ to test quoted/unquoted string in test brackets:

<script src="https://gist.github.com/tuyen03a128/0f5f935ef87774fee707920cdb75ade3.js"></script>

string1 has not been initialized, it has no defined value

1. Non-quote string in test brackets. Wrong results !
> [ -n $string1 ] &&  echo "String1 is not null"
-> Show "String1 is not null" --> Wrong results. 
2. Quote string within test brackets. 
> [ -n "$string1"] && echo "String1 is not null"
->    --> This works fines 
3. string1 stands naked. Must quoting. See the following examples
    3.1 Unquoted
> [ $string1 ] && echo "String1 is not null"
->   --> This works fine.
> string1="a = b"
> [ $string1 ] && echo "String1 is not null"
->   --> Wrong result ! 
    3.2 Quoted
> string1="a = b"
> [ "$string1" ] && echo "String1 is not null"
-> Show "String1 is not null"  --> This works fine

### Write options

#### Positional parameters

#### Dry run 

Show commands without executing them
set -x 
set -n 

http://tldp.org/LDP/abs/html/testbranch.html#EX29

**[Back to top](#table-of-contents)**



