---
title       : Analytic Hierarchy Process (AHP)
subtitle    : Priority Vector and Inconsistency Ratios in Shiny
author      : Wahsabii Neanderthal (wahsabii@gmail.com)
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax]     # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides

---

## Purpose   

To calculate an analytic hierarchy process (AHP) priority vector with its inconsistency ratios.

## Scope
* In scope: 
  + Input: a square pairwise comparison matrix in the form of a delimited text file accessible to the user's local computer. 
  + Process: a R Shiny application using an AHP function from the pmr package.
  + Output: an AHP priority vector with Saaty and Koczkodaj inconsistency ratios to the screen.
   
* Out of scope: 
  + Anything not using a CSV pairwise comparison matrix text file as an input with an output a computed priority vector with inconsistency ratios to the screen using a R Shiny application. The number of simulations for inconsistency ratios are also not considered.    

---  

## The Fundamental Scale for Pairwise Comparisons   
* In an AHP matrix, the row entry is compared to the column entry.  
* Each pair is compared twice: once above and below the diagonal with reciprocal values.  
* As in the example below, the element A1 in the first row has a strong importance, 5,  over element A2 in the second column.  Also, row A2 element is 1/5 the value of the A1 element. 
![](MatrixExample.png) The fundamental scale is as follows:     


Value   |     Definition  
------- | ------------------  
**1**   | Equal importance  
**3**   | Moderate importance  
**5**   | Strong importance  
**7**   | Very strong or demonstrated importance  
**9**   | Extreme importance  

Note: 2, 4, 6, and 8 are for compromises between the above values.

---

## Process Steps with Examples     
![](chooseFile.png)   
Result is the following priority vector; please compare with Process #5 example output above:  

```
## [1] 0.61 0.24 0.10 0.04
```
  

---

## Results of the AHP Shiny App    
![](results2.png)  


