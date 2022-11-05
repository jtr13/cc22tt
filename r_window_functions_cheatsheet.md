# R window functions cheatsheet

Gokul Sunilkumar and Pooja Srinivasan

What is a window function?

A window function performs a calculation across a set of table rows that are somehow related to the current row. Although their functionalities might sound similar to that of aggregate functions, window functions do not cause rows to become grouped into a single output row like non-window aggregate calls would. Instead, the rows retain their separate identities. Behind the scenes, the window function is able to access more than just the current row of the query result.

Although usage of window functions are very common in database systems and other related applications, a single source of lookup could help ease developers' work while programming. Hence, we have come up with a cheatsheet for the same.

Check out the cheatsheet here: https://github.com/gokul-sunilkumar/RWindowFunctions/blob/main/RWindowFunctionsCheatSheet.pdf
