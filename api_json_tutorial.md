# How to obtain data from API and process raw JSON data

Boping Xia and Mingkang Yuan




```r
# load required packages, can be installed by calling install.packages()
library(httr)
library(jsonlite)
library(tidyverse)
```

## Motivation

Obtaining data is the crucial part before we explore and visualize it. Although some processed data are provided in R packages, in a realistic project, we need to collect data from a reliable source that has yet to be processed. We've been able to scrap the data from the site. But scratching the data from their site is amazingly questionable since a simple alteration on the web page will break our whole scratching calculation. Moreover, the data we get may not be the one we need. Some sources may provide their data in CSV or other file formats. Still, most sources use an application programming interface (API) to allow users to access their data. However, when we were working on the final project proposal, it took us a long time to get data from the website. One reason is that most of the resources and tutorials on using APIs are obscure for people with limited knowledge. Another reason is that each source processes and distributes data in distinct ways. In addition, the data we receive from the API is most commonly a JSON file. It is not a tabular file format, so we need extra steps to clean it. This tutorial will guide you on using the httr package to request data from API and transcribe JSON files into a data frame or table.

## What is API and JSON?

API (application programming interface) is a method by which two programs share data. Usually, each API has its unique settings (parameters). Today API usually refers to web API, which programs communicate under Hypertext Transfer Protocol (HTTP). Online data sources typically use a web API that allows users to obtain their data remotely. Some APIs also require a personalized token to protect and monitor data transmittance. API uses designated URLs to make them unique on the Internet. Compared to data already in a file, API allows users only to download the parts they will work on. 

JSON (JavaScript Object Notation) is a file format that aims to exchange data more efficiently on the Internet. Because JSON is simple, human-readable and writable, and lightweight, it has been widely accepted and has become a standard. JSON stores data in key/value pairs. There are six value types in JSON: number, boolean, string, null, array, and object. An object is a collection of key/value pairs. Below is a sample JSON file:

```
{
  "department": "Technical",
  "location": "New York",
  "yearEst": 2016,
  "employees": [
    {
      "name": "Tom",
      "age": 34,
      "title": "Manager",
      "onDuty": true
    },
    {
      "name": "Kate",
      "age": 24,
      "title": "Backend Developer",
      "onDuty": true
    },
    {
      "name": "Wei",
      "age": 21,
      "title": null,
      "onDuty": false
    }
  ]
}
```

In this example, `department` and `location` are string variables, `yearEst` is a number variable, and `employees` is an array of objects. Each element of `employees` contains two string variables, `name` and `title`, a number variable, `age`, and a boolean variable, `onDuty`. The `null` in Wei's title is the same as NA, which means empty. Notice that this whole chunk of data is also an object. This nested structure of objects allows JSON files efficiently store data with complicated relations.

## Using `httr` package to request data from API

### Introduction to HTTP verb and `httr`

Since this tutorial faces people with limited CS/Internet knowledge, we will only dig a little bit into it. A key idea here is the HTTP verb, which is the action you perform on the server (we prefer HTTP method instead of HTTP verb). There are five mainly used HTTP verbs: POST, GET, PUT, PATCH, and DELETE. For our purpose of obtaining data, we will usually use GET (in some contexts, we will use POST), which is getting specific resources from the server.  

`httr` is a package developed by RStudio, and it is an easy but powerful tool for dealing with HTTP. It contains wrapper functions that allow you to make designated requests to the server and decode the response from the server.

### Example of use `httr::GET` to request data from API

WARNING: This is only an example illustrating the workflow of retrieving data from API. Since each API has its unique parameters, they work differently. Therefore, as you want to utilize an API, you first need to go through its reference or usage page to understand how to communicate with it correctly.

We will use an example of getting warships' information from the game World of Warships through Wargaming developer API. Notice that to download data from Wargaming API, you must register an account and create an application id. This id is unique to you, and you should not share your id with anyone else (others may use your id to do something illegal like DDOS). For demonstration purposes, we created a temporary id and stored it in a JSON file. This temporary id will be **DEACTIVATED** after Dec. 15, 2022. Please **DO NOT** use our id in your code.


```r
id_json <- read_json("resources/api_json_tutorial/application_id.json")
app_id <- id_json$id
```

Here we will use `GET()` function to obtain data from API. There are two fields we need to pass to the function: `url`, where is the address of the API, and `query`, where is the parameters need to pass to the API. Before parsing the response, checking the status code is a good habit to ensure you successfully get the data you want. For `GET()` method, code 200 means the server received your request and sent you the corresponding data. If you received other status codes, please check your setup or consult other resources.


```r
# The application id will be DEACTIVATED after Dec. 15, 2022 and will cause error in GET call.
api_response <- GET(url = "https://api.worldofwarships.eu/wows/encyclopedia/ships/",
                    query = list(application_id = app_id))
api_response$status_code
```

```
## [1] 200
```

After receiving the server's response, we need to decode and extract the data we want. Thankfully, `content()` will automatically dig out the data inside the response object.


```r
raw_json <- content(api_response)
glimpse(raw_json, list.len = 5)
```

```
## List of 3
##  $ status: chr "ok"
##  $ meta  :List of 5
##   ..$ count     : int 100
##   ..$ page_total: int 7
##   ..$ total     : int 608
##   ..$ limit     : int 100
##   ..$ page      : int 1
##  $ data  :List of 100
##   ..$ 3542005744:List of 19
##   .. ..$ description     : chr "Brave and energetic like her elder sister, Cleveland. Loves battles and stands up to even the strongest of foes"| __truncated__
##   .. ..$ price_gold      : int 11000
##   .. ..$ ship_id_str     : chr "PASC718"
##   .. ..$ has_demo_profile: logi FALSE
##   .. ..$ images          :List of 4
##   .. .. [list output truncated]
##   ..$ 3553572848:List of 19
##   .. ..$ description     : chr "A Tennessee-class battleship armed with twelve 356 mm guns and possessing quite modest speed characteristics. A"| __truncated__
##   .. ..$ price_gold      : int 9500
##   .. ..$ ship_id_str     : chr "PASB707"
##   .. ..$ has_demo_profile: logi FALSE
##   .. ..$ images          :List of 4
##   .. .. [list output truncated]
##   ..$ 3541972176:List of 19
##   .. ..$ description     : chr "Orks do not navigate the Warp. They need no Astronomican like pesky Umiez. Gork and Mork guide them to WAAAGH! "| __truncated__
##   .. ..$ price_gold      : int 10000
##   .. ..$ ship_id_str     : chr "PZSD718"
##   .. ..$ has_demo_profile: logi FALSE
##   .. ..$ images          :List of 4
##   .. .. [list output truncated]
##   ..$ 3741234640:List of 19
##   .. ..$ description     : chr "One of the versions of a project of a small light cruiser (MLK-8-152). Her main battery artillery consisted of "| __truncated__
##   .. ..$ price_gold      : int 11000
##   .. ..$ ship_id_str     : chr "PRSC528"
##   .. ..$ has_demo_profile: logi FALSE
##   .. ..$ images          :List of 4
##   .. .. [list output truncated]
##   ..$ 3655251408:List of 19
##   .. ..$ description     : chr "Developed after World War II, a project of a small light cruiser (MLK 16 x 130) equipped with sixteen dual-purp"| __truncated__
##   .. ..$ price_gold      : int 34650
##   .. ..$ ship_id_str     : chr "PRSC610"
##   .. ..$ has_demo_profile: logi FALSE
##   .. ..$ images          :List of 4
##   .. .. [list output truncated]
##   .. [list output truncated]
```

## Transform JSON to data frame 

### JSON structure analysis (list)

We learned in class how to deal with CSV data, and our most fixed approach is to convert the data into a data frame because that's the structure we're used to working with data (and that's our goal). However, data does not need to be stored in a table with columns and rows. This tabular format is inefficient, so many Internet companies never store raw data in this format. For example, let's say a store is following your buys. Your distinctive visits may be stamped by the entire sum of cash you went through, the length of the visit, taken after by point-by-point thing data (such as item name, brand, quantity, product id, etc.). There's a lot of detailed information, and putting away all this data in a single table isn't exceptionally productive since you have got to rehash the total information (add up to get to and time) for each point-by-point thing. While having different tables is one solution, consumers of this dataset typically prefer a single data source with all the information. This leads to the existence of hierarchical data types like lists. We use `read_json()` to read the JSON file and return the data type list. So, how to handle JSON files is equivalent to how to handle lists. 


```r
typeof(raw_json)
```

```
## [1] "list"
```

```r
summary(raw_json)
```

```
##        Length Class  Mode     
## status   1    -none- character
## meta     5    -none- list     
## data   100    -none- list
```

```r
summary(raw_json$meta)
```

```
##            Length Class  Mode   
## count      1      -none- numeric
## page_total 1      -none- numeric
## total      1      -none- numeric
## limit      1      -none- numeric
## page       1      -none- numeric
```

```r
print(raw_json$meta)
```

```
## $count
## [1] 100
## 
## $page_total
## [1] 7
## 
## $total
## [1] 608
## 
## $limit
## [1] 100
## 
## $page
## [1] 1
```

```r
names(raw_json$data)
```

```
##   [1] "3542005744" "3553572848" "3541972176" "3741234640" "3655251408"
##   [6] "3338548944" "3560912592" "3553572560" "3340744656" "3551475152"
##  [11] "3667834576" "3554555600" "3532568272" "3667802064" "3667900400"
##  [16] "3332323024" "3340711888" "3315513040" "3545183952" "3730749392"
##  [21] "3740153648" "3730749424" "3666818864" "3333404368" "3741202128"
##  [26] "3551442640" "3445536752" "3731830736" "3554588464" "3340678608"
##  [31] "3659445712" "3552491216" "3669964624" "3668916016" "3541972688"
##  [36] "3553539792" "3363780304" "3542005456" "3667900208" "3522082512"
##  [41] "3740219088" "3655251664" "3374266064" "3542005552" "3658397424"
##  [46] "3741267408" "3668883440" "3555636944" "3550394352" "3337500656"
##  [51] "3340678960" "3655284528" "3655218960" "3730748880" "3730782032"
##  [56] "3550360880" "3730782192" "3655251952" "3666786288" "3740186416"
##  [61] "3720263664" "3530504176" "3555670000" "3741267760" "3355359056"
##  [66] "3655218480" "3741267792" "3667867440" "3676223184" "3553540080"
##  [71] "3555669712" "3335501808" "3353294672" "3543054032" "3554621136"
##  [76] "3340711728" "3550393808" "3679369200" "3667900112" "3655251920"
##  [81] "3655317296" "3551410160" "3667801808" "3741235184" "3333371888"
##  [86] "3730814960" "3667801296" "3655284688" "3720263120" "3552524016"
##  [91] "3666818896" "3552524272" "3668850672" "3741235152" "3552523984"
##  [96] "3667867632" "3551409616" "3340645840" "3655219184" "3552458448"
```

We can see that the resulting data structure by applying the content function to the api_response is a list. Lists are the foremost adaptable data type that can contain other sorts of information. A list can contain distinctive diverse sorts of information in each component, indeed another list. Each element in the list does not have to be the same length as another element. This makes lists flexible but also relatively difficult to use. Notice that in our case, we found that our `raw_json` has three layers. The first layer contains the information on status, which has the type of character. The second layer is a list containing the elements of our meta data (summarized data) such as count, page, total... After applying `summary()` function on the second layer (`meta`), we get the detailed information inside the second layer (`meta`) of `raw_json`. For example, we know there are seven pages. The third layer is the most crucial part, which is a huge list containing our warship data that has 100 elements in it (meaning there are 100 warships). And each element is a list as well. We apply `names()` function on the third layer (`data`), and we get these id's above. If we explored further above, we would likely have deduced that the different "names" correspond to the different warships. So you can imagine that if we wanted to study warship, we could want to create a data frame where the rows correspond to different warships and the columns correspond to different features of the warships inside the third layer such as `name`, `nation`, `type`, and `tier`. 

### Process to extract target features from a list

#### Steps to create extraction function

Here's the code to grab some features (`name`, `nation`, `type`, and `tier`) out of a warship.
We will demo this step by step. After figuring out the structure of the huge list (`raw_json`), let's extract the information we need for the project. To clarify, let's pull the elements (`name`, `nation`, `type`, and `tier`) we need for the first warship. For example, if we want to get the name of the first warship, we do the following.


```r
raw_json$data$`3542005744`$name
```

```
## [1] "AL Montpelier"
```

```r
raw_json$data[[1]]$name
```

```
## [1] "AL Montpelier"
```

Note that both codes give the same result for the name of our first warship. But remember, we need to extract 100 names of warships. So the second approach would be our best choice.

Applying the `names()` function to the first (`data[[1]]`) of the third layers (`data`) of `raw_json` data, we found that our target features (`name`, `nation`, `type` and `tier`) are all in the same layer. 


```r
names(raw_json$data[[1]])
```

```
##  [1] "description"      "price_gold"       "ship_id_str"      "has_demo_profile"
##  [5] "images"           "modules"          "modules_tree"     "nation"          
##  [9] "is_premium"       "ship_id"          "price_credit"     "default_profile" 
## [13] "upgrades"         "tier"             "next_ships"       "mod_slots"       
## [17] "type"             "is_special"       "name"
```

Running the code below, we extract the target features of our first warship. What we're going to do is take the remaining 99 warships, each row is a warship, and each column is our target feature, and turn them into a more manageable data frame type. 


```r
name = raw_json$data[[1]]$name
nation = raw_json$data[[1]]$nation
type = raw_json$data[[1]]$type
tier = raw_json$data[[1]]$tier
name 
```

```
## [1] "AL Montpelier"
```

```r
nation 
```

```
## [1] "usa"
```

```r
type 
```

```
## [1] "Cruiser"
```

```r
tier
```

```
## [1] 8
```

However, as the amount of data you want to extract increases, creating a function that extracts the data given an individual "data" might be better. So, let's rewrite the code to define the function easily:


```r
data = raw_json$data[[1]]
result = data.frame(
  name = data$name,
  nation = data$nation,
  type = data$type,
  tier = data$tier)
result
```

```
##            name nation    type tier
## 1 AL Montpelier    usa Cruiser    8
```

Here we get our first row of the aimed data frame. The output is as expected. Right now, we would formally define the function:


```r
extract_data = function(data){
  result = data.frame(
    name = data$name,
    nation = data$nation,
    type = data$type,
    tier = data$tier)
  return(result)
}

extract_data(raw_json$data[[1]])
```

```
##            name nation    type tier
## 1 AL Montpelier    usa Cruiser    8
```

#### `lapply()` function

Our function works perfectly, returning the same results as the previous section. So now we can extract all the warship information using `lapply()` function: 


```r
data_features = raw_json$data
warship_list = lapply(data_features, extract_data)
typeof(warship_list)
```

```
## [1] "list"
```

```r
head(warship_list,2)
```

```
## $`3542005744`
##            name nation    type tier
## 1 AL Montpelier    usa Cruiser    8
## 
## $`3553572848`
##         name nation       type tier
## 1 California    usa Battleship    7
```

The first argument to `lapply()` is a list. The second input is a function. `lapply()` will apply the function on each element in the list provided and return the output in a list format. It applies a given function for each element in a list, so there will be several function calls. For example, in our case, our function is called `extract_data`, and the `lapply()` function applies the `extract_data` function to the list called `data_features,` and it also returns a list. Notice that for the `lapply()` function:

i. The input data is a list, the output data is a list 
ii. The length of the input is equal to the length of the output
iii. The same function is “distributed” across each element within the list

#### `do.call()` function

Our final step is combining the outputs with `do.call()`. The code above makes a list where each component contains an information outline of a single row. Right now, we need to make them as a single data frame. `do.call()` applies a given function to the list as a whole, so there is only one function call. In this case, we will use `rbind()` function to combine our rows. 


```r
warship = do.call(rbind,warship_list)
head(warship)
```

```
##                     name   nation       type tier
## 3542005744 AL Montpelier      usa    Cruiser    8
## 3553572848    California      usa Battleship    7
## 3541972176   Ship Smasha pan_asia  Destroyer    8
## 3741234640       Ochakov     ussr    Cruiser    8
## 3655251408      Smolensk     ussr    Cruiser   10
## 3338548944   [Shimakaze]    japan  Destroyer   10
```

### Why introducing `lappy()` and `do.call()`

From a programming perspective, using the `lapply()` and `do.call()` approaches can make your code easier to read. It is also more straightforward to modify if you want to add/remove parts from the data frame you want to create. It also would directly apply to a different dataset of warship data. In contrast, for the loop-based approach, you’d need to change every result occurrence in the for loop and when defining the original outcome variable too.

## Filter desired data by directly passing parameters to API

Above we showed you how to parse and extract useful data in a huge JSON file. However, one advantage of API is that we can only request the data we need from the server. API like Wargaming provides detailed information on reference page that tells you how their API works and what parameters it receives. But you cannot assume every API thoroughly documents its usage. In the context of a poorly described API, excavating useful information from a mess is needed. After figuring out the information you need, you can pass corresponding parameters and convert it to a data frame. Continuing with our example, after we read the reference page, we know that setting `fields` parameters will filter out the entry we want. 


```r
api_response_filtered <- GET(url = "https://api.worldofwarships.eu/wows/encyclopedia/ships/",
                    query = list(
                      application_id = app_id,
                      fields = "name, nation, tier, type"
                                 ))
raw_json_filtered <- content(api_response_filtered)
glimpse(raw_json_filtered, list.len = 5)
```

```
## List of 3
##  $ status: chr "ok"
##  $ meta  :List of 5
##   ..$ count     : int 100
##   ..$ page_total: int 7
##   ..$ total     : int 608
##   ..$ limit     : int 100
##   ..$ page      : int 1
##  $ data  :List of 100
##   ..$ 3542005744:List of 4
##   .. ..$ tier  : int 8
##   .. ..$ type  : chr "Cruiser"
##   .. ..$ name  : chr "AL Montpelier"
##   .. ..$ nation: chr "usa"
##   ..$ 3553572848:List of 4
##   .. ..$ tier  : int 7
##   .. ..$ type  : chr "Battleship"
##   .. ..$ name  : chr "California"
##   .. ..$ nation: chr "usa"
##   ..$ 3541972176:List of 4
##   .. ..$ tier  : int 8
##   .. ..$ type  : chr "Destroyer"
##   .. ..$ name  : chr "Ship Smasha"
##   .. ..$ nation: chr "pan_asia"
##   ..$ 3741234640:List of 4
##   .. ..$ tier  : int 8
##   .. ..$ type  : chr "Cruiser"
##   .. ..$ name  : chr "Ochakov"
##   .. ..$ nation: chr "ussr"
##   ..$ 3655251408:List of 4
##   .. ..$ tier  : int 10
##   .. ..$ type  : chr "Cruiser"
##   .. ..$ name  : chr "Smolensk"
##   .. ..$ nation: chr "ussr"
##   .. [list output truncated]
```

Here we saw that only `name`, `nation`, `type`, and `tier` entries are obtained for the same 100 warships. Because the data is relatively neat, we don't need to call `lapply()` or `do.call()` to convert it into a data frame. Instead, we will use `enframe()` and `unlist()` jointly to remove the nested structure. This will return us a very long list.


```r
denested_list <- enframe(unlist(raw_json_filtered$data))
head(denested_list, 8)
```

```
## # A tibble: 8 × 2
##   name              value        
##   <chr>             <chr>        
## 1 3542005744.tier   8            
## 2 3542005744.type   Cruiser      
## 3 3542005744.name   AL Montpelier
## 4 3542005744.nation usa          
## 5 3553572848.tier   7            
## 6 3553572848.type   Battleship   
## 7 3553572848.name   California   
## 8 3553572848.nation usa
```

This looks like a tidy data set where we combine two variables into one. Calling `separate()` on `name` will generate a tidy data set. Then we call `pivot_wider()` on the tidy data to obtain the desired data frame for further analysis.


```r
warship_dataframe <- denested_list %>%
  separate(name, into = c("id", "entry")) %>% 
  pivot_wider(names_from = entry, values_from = value)
head(warship_dataframe)
```

```
## # A tibble: 6 × 5
##   id         tier  type       name          nation  
##   <chr>      <chr> <chr>      <chr>         <chr>   
## 1 3542005744 8     Cruiser    AL Montpelier usa     
## 2 3553572848 7     Battleship California    usa     
## 3 3541972176 8     Destroyer  Ship Smasha   pan_asia
## 4 3741234640 8     Cruiser    Ochakov       ussr    
## 5 3655251408 10    Cruiser    Smolensk      ussr    
## 6 3338548944 10    Destroyer  [Shimakaze]   japan
```

## Evaluation

By writing the tutorial on this topic, we gained a clearer understanding of how to legally use the API to get data from the source website and how to understand the structure of JSON files and lists in r language. This tutorial can also be said to be the final project of students as a service, to help students how to get data and how to clean data. Getting the data and cleaning it up are the most time-consuming and unique steps in a project (because every data resource is different). The purpose of this tutorial is to cover these two steps in the most general way possible. Of course, we wanted to improve our tutorial further. In that case, we might insert more graphic images to explain the list structure in detail since we believe that architectural images are always the most intuitive. We should also talk a little bit more about `lapply()` and the other functions (the `apply()` family), and maybe mention the logic inherent in functions like mapping, which is also very important for understanding a function.

## Reference

https://cran.r-project.org/web/packages/httr/vignettes/quickstart.html

https://cran.r-project.org/web/packages/jsonlite/vignettes/json-aaquickstart.html

https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/lapply

https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/do.call

https://developers.wargaming.net/documentation/guide/getting-started/

https://developer.mozilla.org/en-US/docs/Web/HTTP/Status

https://www.json.org/json-en.html

https://nordicapis.com/ultimate-guide-to-all-9-standard-http-methods/

https://www.mulesoft.com/resources/api/what-is-an-api

https://leewtai.github.io/courses/stat_computing/lectures/learning_r_data_wrangle.html
