# googleVis in R

Sushant Prabhu and Kiyan Mohebbizadeh


## Introducing googleVis

> GoogleVis is a package in R that allows users of R to use the Google Charts API. 

The interface between R and Google Charts allows users to access Google Charts' interactive charts. `googleVis` allows users to use the data in R data frames to create Google Charts without uploading the data onto Google. 

Demonstrating using `googleVis` Library - Installation and Usage
```
install.packages('googleVis')
```

```r
library(googleVis)
```

## Why use googleVis ?

> `googleVis` package allows users to create interactive visualizations which R's most popular visualization package (ggplot) does not allow.

- Although there are packages that work in conjunction with ggplot to make interactive visualizations, `googleVis` offers a holistic package that allows for some unique and interactive visualizations.
- By using Google Charts, one is able to create a wide variety of visualizations ranging from typical bar and line graphs to mapping and timeline charts all from one package. 
- The visualizations created by `googleVis` add a level of interest to the consumer due to their interactive layer and viewers are able to gather specific bits of information by hovering over and clicking values in the visualizations. This not only allows for increased aesthetics, but also more information being transferred to the viewers.


## googleVis Rendering & Interaction

> The output of `googleVis` can either be embedded into an HTML file or read dynamically. These visualizations are most often rendered online and in a web format. Therefore, a browser and internet connection are required to view the interactive version of the output compared to `ggplot`

- For use in R, `googleVis` allows a user to render as a *Shiny* file that then allows a preview with interaction within R. This is used to preview a chart before a final render.
- `googleVis` is a package in R that allows users of R to use the Google Charts API.
- The interface between R and Google Charts allows users to access Google Charts' interactive charts.
- `googleVis` allows users to use the data in R data frames to create Google Charts without uploading the data onto Google.

### Basic Graphs (Line, Bar, Combo)


```r
df = data.frame(pet=c('cat', 'dog', 'hamster', 'snake'),
                food_cost_monthly=c(50, 100, 10, 40),
                medical_cost_monthly=c(30, 60, 5, 50))
Line <- gvisLineChart(df)

Bar <- gvisBarChart(df)

Column <- gvisColumnChart(df)

SteppedArea <- gvisSteppedAreaChart(df, xvar="pet", 
                                    yvar=c("food_cost_monthly", "medical_cost_monthly"),
                                    options=list(isStacked=TRUE))

Combo <- gvisComboChart(df, xvar="pet",
                        yvar=c("food_cost_monthly", "medical_cost_monthly"),
                        options=list(seriesType="bars",
                                     series='{1: {type:"line"}}'))
plot(Line)
```

<!-- LineChart generated in R 4.2.2 by googleVis 0.7.0 package -->
<!-- Sun Nov 13 17:55:30 2022 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataLineChartID2c3b1d127e2c () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
"cat",
50,
30
],
[
"dog",
100,
60
],
[
"hamster",
10,
5
],
[
"snake",
40,
50
] 
];
data.addColumn('string','pet');
data.addColumn('number','food_cost_monthly');
data.addColumn('number','medical_cost_monthly');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartLineChartID2c3b1d127e2c() {
var data = gvisDataLineChartID2c3b1d127e2c();
var options = {};
options["allowHtml"] = true;

    var chart = new google.visualization.LineChart(
    document.getElementById('LineChartID2c3b1d127e2c')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "corechart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartLineChartID2c3b1d127e2c);
})();
function displayChartLineChartID2c3b1d127e2c() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartLineChartID2c3b1d127e2c"></script>
 
<!-- divChart -->
  
<div id="LineChartID2c3b1d127e2c" 
  style="width: 500; height: automatic;">
</div>

```r
plot(Bar)
```

<!-- BarChart generated in R 4.2.2 by googleVis 0.7.0 package -->
<!-- Sun Nov 13 17:55:30 2022 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataBarChartID2c3b41397d1a () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
"cat",
50,
30
],
[
"dog",
100,
60
],
[
"hamster",
10,
5
],
[
"snake",
40,
50
] 
];
data.addColumn('string','pet');
data.addColumn('number','food_cost_monthly');
data.addColumn('number','medical_cost_monthly');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartBarChartID2c3b41397d1a() {
var data = gvisDataBarChartID2c3b41397d1a();
var options = {};
options["allowHtml"] = true;

    var chart = new google.visualization.BarChart(
    document.getElementById('BarChartID2c3b41397d1a')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "corechart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartBarChartID2c3b41397d1a);
})();
function displayChartBarChartID2c3b41397d1a() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartBarChartID2c3b41397d1a"></script>
 
<!-- divChart -->
  
<div id="BarChartID2c3b41397d1a" 
  style="width: 500; height: automatic;">
</div>

```r
plot(Column)
```

<!-- ColumnChart generated in R 4.2.2 by googleVis 0.7.0 package -->
<!-- Sun Nov 13 17:55:30 2022 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataColumnChartID2c3b1d0c19e7 () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
"cat",
50,
30
],
[
"dog",
100,
60
],
[
"hamster",
10,
5
],
[
"snake",
40,
50
] 
];
data.addColumn('string','pet');
data.addColumn('number','food_cost_monthly');
data.addColumn('number','medical_cost_monthly');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartColumnChartID2c3b1d0c19e7() {
var data = gvisDataColumnChartID2c3b1d0c19e7();
var options = {};
options["allowHtml"] = true;

    var chart = new google.visualization.ColumnChart(
    document.getElementById('ColumnChartID2c3b1d0c19e7')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "corechart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartColumnChartID2c3b1d0c19e7);
})();
function displayChartColumnChartID2c3b1d0c19e7() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartColumnChartID2c3b1d0c19e7"></script>
 
<!-- divChart -->
  
<div id="ColumnChartID2c3b1d0c19e7" 
  style="width: 500; height: automatic;">
</div>

```r
plot(SteppedArea)
```

<!-- SteppedAreaChart generated in R 4.2.2 by googleVis 0.7.0 package -->
<!-- Sun Nov 13 17:55:30 2022 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataSteppedAreaChartID2c3b20deb8db () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
"cat",
50,
30
],
[
"dog",
100,
60
],
[
"hamster",
10,
5
],
[
"snake",
40,
50
] 
];
data.addColumn('string','pet');
data.addColumn('number','food_cost_monthly');
data.addColumn('number','medical_cost_monthly');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartSteppedAreaChartID2c3b20deb8db() {
var data = gvisDataSteppedAreaChartID2c3b20deb8db();
var options = {};
options["allowHtml"] = true;
options["isStacked"] = true;

    var chart = new google.visualization.SteppedAreaChart(
    document.getElementById('SteppedAreaChartID2c3b20deb8db')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "corechart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartSteppedAreaChartID2c3b20deb8db);
})();
function displayChartSteppedAreaChartID2c3b20deb8db() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartSteppedAreaChartID2c3b20deb8db"></script>
 
<!-- divChart -->
  
<div id="SteppedAreaChartID2c3b20deb8db" 
  style="width: 500; height: automatic;">
</div>

```r
plot(Combo)
```

<!-- ComboChart generated in R 4.2.2 by googleVis 0.7.0 package -->
<!-- Sun Nov 13 17:55:30 2022 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataComboChartID2c3b2fd02d28 () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
"cat",
50,
30
],
[
"dog",
100,
60
],
[
"hamster",
10,
5
],
[
"snake",
40,
50
] 
];
data.addColumn('string','pet');
data.addColumn('number','food_cost_monthly');
data.addColumn('number','medical_cost_monthly');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartComboChartID2c3b2fd02d28() {
var data = gvisDataComboChartID2c3b2fd02d28();
var options = {};
options["allowHtml"] = true;
options["seriesType"] = "bars";
options["series"] = {1: {type:"line"}};

    var chart = new google.visualization.ComboChart(
    document.getElementById('ComboChartID2c3b2fd02d28')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "corechart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartComboChartID2c3b2fd02d28);
})();
function displayChartComboChartID2c3b2fd02d28() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartComboChartID2c3b2fd02d28"></script>
 
<!-- divChart -->
  
<div id="ComboChartID2c3b2fd02d28" 
  style="width: 500; height: automatic;">
</div>

The above charts are best used in comparisons between groups. As seen in the examples, there are comparisons between costs of owning different pets.

- The line graph shows how different variables flow within and among groups. The audience is able to determine within group trends by seeing where lines intersect within each group. Showing the up and down trends of these variables with lines between groups allows us to make comparisons among the various groups with clarity.By organizing the variables in a certain way, one is able to get a sense of population trends.
- The bar and column chart are essentially the same just rotated on an axis. They allow for great in group comparisons as well as comparisons among groups. However, These charts are best used for in-group comparisons.
- Combo charts are great for multiple variable comparisons and allow the user to get the best of both worlds. by carefully selecting which variables are represented in bars and which ones are lines, the user is able to best show the relationship within groups and trends of the population.

### googleVis Histogram Chart


```r
df <- iris
Histogram <- gvisHistogram(data.frame(Sepal_Width = df$Sepal.Width))

plot(Histogram)
```

<!-- Histogram generated in R 4.2.2 by googleVis 0.7.0 package -->
<!-- Sun Nov 13 17:55:30 2022 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataHistogramID2c3b7542f4f2 () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
3.5
],
[
3
],
[
3.2
],
[
3.1
],
[
3.6
],
[
3.9
],
[
3.4
],
[
3.4
],
[
2.9
],
[
3.1
],
[
3.7
],
[
3.4
],
[
3
],
[
3
],
[
4
],
[
4.4
],
[
3.9
],
[
3.5
],
[
3.8
],
[
3.8
],
[
3.4
],
[
3.7
],
[
3.6
],
[
3.3
],
[
3.4
],
[
3
],
[
3.4
],
[
3.5
],
[
3.4
],
[
3.2
],
[
3.1
],
[
3.4
],
[
4.1
],
[
4.2
],
[
3.1
],
[
3.2
],
[
3.5
],
[
3.6
],
[
3
],
[
3.4
],
[
3.5
],
[
2.3
],
[
3.2
],
[
3.5
],
[
3.8
],
[
3
],
[
3.8
],
[
3.2
],
[
3.7
],
[
3.3
],
[
3.2
],
[
3.2
],
[
3.1
],
[
2.3
],
[
2.8
],
[
2.8
],
[
3.3
],
[
2.4
],
[
2.9
],
[
2.7
],
[
2
],
[
3
],
[
2.2
],
[
2.9
],
[
2.9
],
[
3.1
],
[
3
],
[
2.7
],
[
2.2
],
[
2.5
],
[
3.2
],
[
2.8
],
[
2.5
],
[
2.8
],
[
2.9
],
[
3
],
[
2.8
],
[
3
],
[
2.9
],
[
2.6
],
[
2.4
],
[
2.4
],
[
2.7
],
[
2.7
],
[
3
],
[
3.4
],
[
3.1
],
[
2.3
],
[
3
],
[
2.5
],
[
2.6
],
[
3
],
[
2.6
],
[
2.3
],
[
2.7
],
[
3
],
[
2.9
],
[
2.9
],
[
2.5
],
[
2.8
],
[
3.3
],
[
2.7
],
[
3
],
[
2.9
],
[
3
],
[
3
],
[
2.5
],
[
2.9
],
[
2.5
],
[
3.6
],
[
3.2
],
[
2.7
],
[
3
],
[
2.5
],
[
2.8
],
[
3.2
],
[
3
],
[
3.8
],
[
2.6
],
[
2.2
],
[
3.2
],
[
2.8
],
[
2.8
],
[
2.7
],
[
3.3
],
[
3.2
],
[
2.8
],
[
3
],
[
2.8
],
[
3
],
[
2.8
],
[
3.8
],
[
2.8
],
[
2.8
],
[
2.6
],
[
3
],
[
3.4
],
[
3.1
],
[
3
],
[
3.1
],
[
3.1
],
[
3.1
],
[
2.7
],
[
3.2
],
[
3.3
],
[
3
],
[
2.5
],
[
3
],
[
3.4
],
[
3
] 
];
data.addColumn('number','Sepal_Width');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartHistogramID2c3b7542f4f2() {
var data = gvisDataHistogramID2c3b7542f4f2();
var options = {};
options["allowHtml"] = true;

    var chart = new google.visualization.Histogram(
    document.getElementById('HistogramID2c3b7542f4f2')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "corechart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartHistogramID2c3b7542f4f2);
})();
function displayChartHistogramID2c3b7542f4f2() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartHistogramID2c3b7542f4f2"></script>
 
<!-- divChart -->
  
<div id="HistogramID2c3b7542f4f2" 
  style="width: 500; height: automatic;">
</div>

The histogram allows users to represent the distribution of one particular group or variable by showing the frequency of the particular group or variable within a range. The charts by `googleVis` have an advantage over regular histograms because almost no histogram allows or recommends specific information regarding the counts at different points in the visualization, however, with `googleVis` the audience can not only look at the distribution but access specific metrics through interaction as well.

### googleVis Alluvial/Sankey Chart


```r
df <- data.frame(From=c(rep("Math",3), rep("Science", 3)),
                    To=c(rep(c('Lunch', 'Art', 'Music'),2)),
                    Weight=c(17,15,13,5,12,8))

Alluvial <- gvisSankey(df, from="From", to="To", weight="Weight")

plot(Alluvial)
```

<!-- Sankey generated in R 4.2.2 by googleVis 0.7.0 package -->
<!-- Sun Nov 13 17:55:30 2022 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataSankeyID2c3b57914baa () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
"Math",
"Lunch",
17
],
[
"Math",
"Art",
15
],
[
"Math",
"Music",
13
],
[
"Science",
"Lunch",
5
],
[
"Science",
"Art",
12
],
[
"Science",
"Music",
8
] 
];
data.addColumn('string','From');
data.addColumn('string','To');
data.addColumn('number','Weight');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartSankeyID2c3b57914baa() {
var data = gvisDataSankeyID2c3b57914baa();
var options = {};
options["width"] = 400;
options["height"] = 400;

    var chart = new google.visualization.Sankey(
    document.getElementById('SankeyID2c3b57914baa')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "sankey";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartSankeyID2c3b57914baa);
})();
function displayChartSankeyID2c3b57914baa() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartSankeyID2c3b57914baa"></script>
 
<!-- divChart -->
  
<div id="SankeyID2c3b57914baa" 
  style="width: 400; height: 400;">
</div>

Alluvial charts best show the movement of the sample or population among different variables. In the example above the movement of students within a school from class to class is represented. This visualization can be helpful with data that has an ordinal and timeline specific values. With `googleVis`, the audience is exposed to the general trends with a clean looking chart as well as the specifics of the graph through interaction.


### googleVis Geographic Chart


```r
df = data.frame(country=c('US', 'CN', 'BR', 'IS', 'RU', 'TH', 'TR', 'ID', 'MX', 'IR' ),
                incarceration_rate = c(2068800, 1690000, 811707, 478600, 471490, 309282, 291198, 266259, 220866, 189000))

G <- gvisGeoChart(df, locationvar = "country", colorvar = "incarceration_rate",
                  options=list(
                         gvis.editor="Edit the Geo Chart !"))

plot(G)
```

<!-- GeoChart generated in R 4.2.2 by googleVis 0.7.0 package -->
<!-- Sun Nov 13 17:55:30 2022 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataGeoChartID2c3b571b9634 () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
"US",
2068800
],
[
"CN",
1690000
],
[
"BR",
811707
],
[
"IS",
478600
],
[
"RU",
471490
],
[
"TH",
309282
],
[
"TR",
291198
],
[
"ID",
266259
],
[
"MX",
220866
],
[
"IR",
189000
] 
];
data.addColumn('string','country');
data.addColumn('number','incarceration_rate');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartGeoChartID2c3b571b9634() {
var data = gvisDataGeoChartID2c3b571b9634();
var options = {};
options["width"] = 556;
options["height"] = 347;

    chartGeoChartID2c3b571b9634 = new google.visualization.ChartWrapper({
    dataTable: data,       
    chartType: 'GeoChart',
    containerId: 'GeoChartID2c3b571b9634',
    options: options
    });
    chartGeoChartID2c3b571b9634.draw();
    

}

  function openEditorGeoChartID2c3b571b9634() {
  var editor = new google.visualization.ChartEditor();
  google.visualization.events.addListener(editor, 'ok',
  function() { 
  chartGeoChartID2c3b571b9634 = editor.getChartWrapper();  
  chartGeoChartID2c3b571b9634.draw(document.getElementById('GeoChartID2c3b571b9634')); 
  }); 
  editor.openDialog(chartGeoChartID2c3b571b9634);
  }
    
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "charteditor";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartGeoChartID2c3b571b9634);
})();
function displayChartGeoChartID2c3b571b9634() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartGeoChartID2c3b571b9634"></script>
 
<!-- divChart -->
<input type='button' onclick='openEditorGeoChartID2c3b571b9634()' value='Edit the Geo Chart !'/>  
<div id="GeoChartID2c3b571b9634" 
  style="width: 556; height: 347;">
</div>

Map visualizations by `googleVis` are incredibly easy to create and manipulate. They are useful for comparing different geographic areas to each other. `googleVis` automatically color scales the values and the interaction allows the map to be simple and clean, but get specific values when hovering over a particular geographic area. 


### googleVis Gauge Chart


```r
temperature <- data.frame(city=c('Las Vegas', 'Los Angeles', 'Pheonix', 'Dallas', 'Houston', 'Miami'),
                          temp=c(115, 103, 120, 110, 112, 101))
Gauge <-  gvisGauge(temperature, 
                    options=list(min=0, max=150, greenFrom=0,
                                 greenTo=50, yellowFrom=50, yellowTo=100,
                                 redFrom=100, redTo=150, width=400, height=300))

plot(Gauge)
```

<!-- Gauge generated in R 4.2.2 by googleVis 0.7.0 package -->
<!-- Sun Nov 13 17:55:30 2022 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataGaugeID2c3b1fc1984f () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
"Las Vegas",
115
],
[
"Los Angeles",
103
],
[
"Pheonix",
120
],
[
"Dallas",
110
],
[
"Houston",
112
],
[
"Miami",
101
] 
];
data.addColumn('string','city');
data.addColumn('number','temp');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartGaugeID2c3b1fc1984f() {
var data = gvisDataGaugeID2c3b1fc1984f();
var options = {};
options["allowHtml"] = true;
options["min"] = 0;
options["max"] = 150;
options["greenFrom"] = 0;
options["greenTo"] = 50;
options["yellowFrom"] = 50;
options["yellowTo"] = 100;
options["redFrom"] = 100;
options["redTo"] = 150;
options["width"] = 400;
options["height"] = 300;

    var chart = new google.visualization.Gauge(
    document.getElementById('GaugeID2c3b1fc1984f')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "gauge";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartGaugeID2c3b1fc1984f);
})();
function displayChartGaugeID2c3b1fc1984f() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartGaugeID2c3b1fc1984f"></script>
 
<!-- divChart -->
  
<div id="GaugeID2c3b1fc1984f" 
  style="width: 400; height: 300;">
</div>

The gauge charts are not interactive, however they do offer a unique way to model data that is always within a certain range. For example, temperatures, speeds, pressure, etc. This chart allows for quick comparison between groups and aesthetic value to any presentation.


### googleVis Tabular Chart


```r
## Tabular Data Un-Paged
Population_Tabular_Unpaged <- gvisTable(Population[1:30,],
                                        formats=list(Population="#,###",'% of World Population'='#.#%'))

plot(Population_Tabular_Unpaged)
```

<!-- Table generated in R 4.2.2 by googleVis 0.7.0 package -->
<!-- Sun Nov 13 17:55:30 2022 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataTableID2c3b7585a3f5 () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
"1",
"China",
1339940000,
0.195,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Flag_of_the_People%27s_Republic_of_China.svg/22px-Flag_of_the_People%27s_Republic_of_China.svg.png\">",
true,
new Date(2010,9,9)
],
[
"2",
"India",
1188650000,
0.173,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Flag_of_India.svg/22px-Flag_of_India.svg.png\">",
true,
new Date(2010,9,9)
],
[
"3",
"United States",
310438000,
0.0452,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/22px-Flag_of_the_United_States.svg.png\">",
true,
new Date(2010,9,9)
],
[
"4",
"Indonesia",
237556363,
0.0346,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Flag_of_Indonesia.svg/22px-Flag_of_Indonesia.svg.png\">",
true,
new Date(2010,9,9)
],
[
"5",
"Brazil",
193626000,
0.0282,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Flag_of_Brazil.svg/22px-Flag_of_Brazil.svg.png\">",
true,
new Date(2010,9,9)
],
[
"6",
"Pakistan",
170745000,
0.0248,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Flag_of_Pakistan.svg/22px-Flag_of_Pakistan.svg.png\">",
true,
new Date(2010,9,9)
],
[
"7",
"Bangladesh",
164425000,
0.0239,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Flag_of_Bangladesh.svg/22px-Flag_of_Bangladesh.svg.png\">",
true,
new Date(2010,9,9)
],
[
"8",
"Nigeria",
158259000,
0.023,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Flag_of_Nigeria.svg/22px-Flag_of_Nigeria.svg.png\">",
true,
new Date(2010,9,9)
],
[
"9",
"Russia",
141927297,
0.0206,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Flag_of_Russia.svg/22px-Flag_of_Russia.svg.png\">",
true,
new Date(2010,9,9)
],
[
"10",
"Japan",
127390000,
0.0185,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Flag_of_Japan.svg/22px-Flag_of_Japan.svg.png\">",
true,
new Date(2010,9,9)
],
[
"11",
"Mexico",
108396211,
0.0158,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Flag_of_Mexico.svg/22px-Flag_of_Mexico.svg.png\">",
true,
new Date(2010,9,9)
],
[
"12",
"Philippines",
94013200,
0.0137,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Flag_of_the_Philippines.svg/22px-Flag_of_the_Philippines.svg.png\">",
true,
new Date(2010,9,9)
],
[
"13",
"Vietnam",
85846997,
0.0125,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Flag_of_Vietnam.svg/22px-Flag_of_Vietnam.svg.png\">",
true,
new Date(2010,9,9)
],
[
"14",
"Ethiopia",
84976000,
0.0124,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/7/71/Flag_of_Ethiopia.svg/22px-Flag_of_Ethiopia.svg.png\">",
true,
new Date(2010,9,9)
],
[
"15",
"Germany",
81802257,
0.0119,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Flag_of_Germany.svg/22px-Flag_of_Germany.svg.png\">",
true,
new Date(2010,9,9)
],
[
"16",
"Egypt",
79135000,
0.0115,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Egypt.svg/22px-Flag_of_Egypt.svg.png\">",
true,
new Date(2010,9,9)
],
[
"17",
"Iran",
75078000,
0.0109,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Flag_of_Iran.svg/22px-Flag_of_Iran.svg.png\">",
true,
new Date(2010,9,9)
],
[
"18",
"Turkey",
72561312,
0.0106,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Flag_of_Turkey.svg/22px-Flag_of_Turkey.svg.png\">",
true,
new Date(2010,9,9)
],
[
"19",
"Dem. Rep. of Congo",
67827000,
0.0099,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Flag_of_the_Democratic_Republic_of_the_Congo.svg/22px-Flag_of_the_Democratic_Republic_of_the_Congo.svg.png\">",
true,
new Date(2010,9,9)
],
[
"20",
"Thailand",
67070000,
0.01,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Flag_of_Thailand.svg/22px-Flag_of_Thailand.svg.png\">",
true,
new Date(2010,9,9)
],
[
"21",
"France",
65447374,
0.0095,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Flag_of_France.svg/22px-Flag_of_France.svg.png\">",
true,
new Date(2010,9,9)
],
[
"22",
"United Kingdom",
62008049,
0.009,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Flag_of_the_United_Kingdom.svg/22px-Flag_of_the_United_Kingdom.svg.png\">",
true,
new Date(2010,9,9)
],
[
"23",
"Italy",
60402499,
0.0088,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Flag_of_Italy.svg/22px-Flag_of_Italy.svg.png\">",
true,
new Date(2010,9,9)
],
[
"24",
"Myanmar",
50496000,
0.0073,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Flag_of_Myanmar.svg/22px-Flag_of_Myanmar.svg.png\">",
true,
new Date(2010,9,9)
],
[
"25",
"South Africa",
49991300,
0.0073,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Flag_of_South_Africa.svg/22px-Flag_of_South_Africa.svg.png\">",
true,
new Date(2010,9,9)
],
[
"26",
"South Korea",
49773145,
0.0072,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Flag_of_South_Korea.svg/22px-Flag_of_South_Korea.svg.png\">",
true,
new Date(2010,9,9)
],
[
"27",
"Spain",
46072834,
0.0067,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Flag_of_Spain.svg/22px-Flag_of_Spain.svg.png\">",
true,
new Date(2010,9,9)
],
[
"28",
"Ukraine",
45871738,
0.0067,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Flag_of_Ukraine.svg/22px-Flag_of_Ukraine.svg.png\">",
true,
new Date(2010,9,9)
],
[
"29",
"Colombia",
45655000,
0.0066,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Flag_of_Colombia.svg/22px-Flag_of_Colombia.svg.png\">",
true,
new Date(2010,9,9)
],
[
"30",
"Tanzania",
45040000,
0.0066,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/3/38/Flag_of_Tanzania.svg/22px-Flag_of_Tanzania.svg.png\">",
true,
new Date(2010,9,9)
] 
];
data.addColumn('string','Rank');
data.addColumn('string','Country');
data.addColumn('number','Population');
data.addColumn('number','% of World Population');
data.addColumn('string','Flag');
data.addColumn('boolean','Mode');
data.addColumn('date','Date');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartTableID2c3b7585a3f5() {
var data = gvisDataTableID2c3b7585a3f5();
var options = {};
options["allowHtml"] = true;

  var dataFormat1 = new google.visualization.NumberFormat({pattern:"#,###"});
  dataFormat1.format(data, 2);
  var dataFormat2 = new google.visualization.NumberFormat({pattern:"#.#%"});
  dataFormat2.format(data, 3);

    var chart = new google.visualization.Table(
    document.getElementById('TableID2c3b7585a3f5')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "table";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartTableID2c3b7585a3f5);
})();
function displayChartTableID2c3b7585a3f5() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartTableID2c3b7585a3f5"></script>
 
<!-- divChart -->
  
<div id="TableID2c3b7585a3f5" 
  style="width: 500; height: automatic;">
</div>

```r
## Tabular Data Paged
Population_Tabular_paged <- gvisTable(Population[1:30,], 
                                      formats=list(Population="#,###",'% of World Population'='#.#%'),
                                      options=list(page='enable',
                                                   height='automatic',
                                                   width='automatic'))

plot(Population_Tabular_paged)
```

<!-- Table generated in R 4.2.2 by googleVis 0.7.0 package -->
<!-- Sun Nov 13 17:55:30 2022 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataTableID2c3b7085a0ce () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
"1",
"China",
1339940000,
0.195,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Flag_of_the_People%27s_Republic_of_China.svg/22px-Flag_of_the_People%27s_Republic_of_China.svg.png\">",
true,
new Date(2010,9,9)
],
[
"2",
"India",
1188650000,
0.173,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Flag_of_India.svg/22px-Flag_of_India.svg.png\">",
true,
new Date(2010,9,9)
],
[
"3",
"United States",
310438000,
0.0452,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/22px-Flag_of_the_United_States.svg.png\">",
true,
new Date(2010,9,9)
],
[
"4",
"Indonesia",
237556363,
0.0346,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Flag_of_Indonesia.svg/22px-Flag_of_Indonesia.svg.png\">",
true,
new Date(2010,9,9)
],
[
"5",
"Brazil",
193626000,
0.0282,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Flag_of_Brazil.svg/22px-Flag_of_Brazil.svg.png\">",
true,
new Date(2010,9,9)
],
[
"6",
"Pakistan",
170745000,
0.0248,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Flag_of_Pakistan.svg/22px-Flag_of_Pakistan.svg.png\">",
true,
new Date(2010,9,9)
],
[
"7",
"Bangladesh",
164425000,
0.0239,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Flag_of_Bangladesh.svg/22px-Flag_of_Bangladesh.svg.png\">",
true,
new Date(2010,9,9)
],
[
"8",
"Nigeria",
158259000,
0.023,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Flag_of_Nigeria.svg/22px-Flag_of_Nigeria.svg.png\">",
true,
new Date(2010,9,9)
],
[
"9",
"Russia",
141927297,
0.0206,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Flag_of_Russia.svg/22px-Flag_of_Russia.svg.png\">",
true,
new Date(2010,9,9)
],
[
"10",
"Japan",
127390000,
0.0185,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Flag_of_Japan.svg/22px-Flag_of_Japan.svg.png\">",
true,
new Date(2010,9,9)
],
[
"11",
"Mexico",
108396211,
0.0158,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Flag_of_Mexico.svg/22px-Flag_of_Mexico.svg.png\">",
true,
new Date(2010,9,9)
],
[
"12",
"Philippines",
94013200,
0.0137,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Flag_of_the_Philippines.svg/22px-Flag_of_the_Philippines.svg.png\">",
true,
new Date(2010,9,9)
],
[
"13",
"Vietnam",
85846997,
0.0125,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Flag_of_Vietnam.svg/22px-Flag_of_Vietnam.svg.png\">",
true,
new Date(2010,9,9)
],
[
"14",
"Ethiopia",
84976000,
0.0124,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/7/71/Flag_of_Ethiopia.svg/22px-Flag_of_Ethiopia.svg.png\">",
true,
new Date(2010,9,9)
],
[
"15",
"Germany",
81802257,
0.0119,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Flag_of_Germany.svg/22px-Flag_of_Germany.svg.png\">",
true,
new Date(2010,9,9)
],
[
"16",
"Egypt",
79135000,
0.0115,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Egypt.svg/22px-Flag_of_Egypt.svg.png\">",
true,
new Date(2010,9,9)
],
[
"17",
"Iran",
75078000,
0.0109,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Flag_of_Iran.svg/22px-Flag_of_Iran.svg.png\">",
true,
new Date(2010,9,9)
],
[
"18",
"Turkey",
72561312,
0.0106,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Flag_of_Turkey.svg/22px-Flag_of_Turkey.svg.png\">",
true,
new Date(2010,9,9)
],
[
"19",
"Dem. Rep. of Congo",
67827000,
0.0099,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Flag_of_the_Democratic_Republic_of_the_Congo.svg/22px-Flag_of_the_Democratic_Republic_of_the_Congo.svg.png\">",
true,
new Date(2010,9,9)
],
[
"20",
"Thailand",
67070000,
0.01,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Flag_of_Thailand.svg/22px-Flag_of_Thailand.svg.png\">",
true,
new Date(2010,9,9)
],
[
"21",
"France",
65447374,
0.0095,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Flag_of_France.svg/22px-Flag_of_France.svg.png\">",
true,
new Date(2010,9,9)
],
[
"22",
"United Kingdom",
62008049,
0.009,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Flag_of_the_United_Kingdom.svg/22px-Flag_of_the_United_Kingdom.svg.png\">",
true,
new Date(2010,9,9)
],
[
"23",
"Italy",
60402499,
0.0088,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Flag_of_Italy.svg/22px-Flag_of_Italy.svg.png\">",
true,
new Date(2010,9,9)
],
[
"24",
"Myanmar",
50496000,
0.0073,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Flag_of_Myanmar.svg/22px-Flag_of_Myanmar.svg.png\">",
true,
new Date(2010,9,9)
],
[
"25",
"South Africa",
49991300,
0.0073,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Flag_of_South_Africa.svg/22px-Flag_of_South_Africa.svg.png\">",
true,
new Date(2010,9,9)
],
[
"26",
"South Korea",
49773145,
0.0072,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Flag_of_South_Korea.svg/22px-Flag_of_South_Korea.svg.png\">",
true,
new Date(2010,9,9)
],
[
"27",
"Spain",
46072834,
0.0067,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Flag_of_Spain.svg/22px-Flag_of_Spain.svg.png\">",
true,
new Date(2010,9,9)
],
[
"28",
"Ukraine",
45871738,
0.0067,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Flag_of_Ukraine.svg/22px-Flag_of_Ukraine.svg.png\">",
true,
new Date(2010,9,9)
],
[
"29",
"Colombia",
45655000,
0.0066,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Flag_of_Colombia.svg/22px-Flag_of_Colombia.svg.png\">",
true,
new Date(2010,9,9)
],
[
"30",
"Tanzania",
45040000,
0.0066,
"<img src=\"http://upload.wikimedia.org/wikipedia/commons/thumb/3/38/Flag_of_Tanzania.svg/22px-Flag_of_Tanzania.svg.png\">",
true,
new Date(2010,9,9)
] 
];
data.addColumn('string','Rank');
data.addColumn('string','Country');
data.addColumn('number','Population');
data.addColumn('number','% of World Population');
data.addColumn('string','Flag');
data.addColumn('boolean','Mode');
data.addColumn('date','Date');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartTableID2c3b7085a0ce() {
var data = gvisDataTableID2c3b7085a0ce();
var options = {};
options["allowHtml"] = true;
options["page"] = "enable";

  var dataFormat1 = new google.visualization.NumberFormat({pattern:"#,###"});
  dataFormat1.format(data, 2);
  var dataFormat2 = new google.visualization.NumberFormat({pattern:"#.#%"});
  dataFormat2.format(data, 3);

    var chart = new google.visualization.Table(
    document.getElementById('TableID2c3b7085a0ce')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "table";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartTableID2c3b7085a0ce);
})();
function displayChartTableID2c3b7085a0ce() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartTableID2c3b7085a0ce"></script>
 
<!-- divChart -->
  
<div id="TableID2c3b7085a0ce" 
  style="width: automatic; height: automatic;">
</div>

The data formatted as a table can be paged and sorted. It has a flexible option to select single rows either with the keyboard or the mouse. It also powers sorting on rows across all dimensions in the columns of the dataset. The navigation through paged tabular information is smooth and simple.


### googleVis Tree Map Chart


```r
Country_Tree <- gvisTreeMap(Regions, "Region", "Parent", "Val", "Fac", 
                     options=list(width=800, height=500, fontSize=15,
                                  minColor='#cfe2f3',midColor='#6fa8dc',maxColor='#0b5394',
                                  headerHeight=10,fontColor='black',showScale=TRUE))

plot(Country_Tree)
```

<!-- TreeMap generated in R 4.2.2 by googleVis 0.7.0 package -->
<!-- Sun Nov 13 17:55:30 2022 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataTreeMapID2c3b160a80b3 () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
"Global",
null,
10,
2
],
[
"America",
"Global",
2,
4
],
[
"Europe",
"Global",
99,
11
],
[
"Asia",
"Global",
10,
8
],
[
"France",
"Europe",
71,
2
],
[
"Sweden",
"Europe",
89,
3
],
[
"Germany",
"Europe",
58,
10
],
[
"Mexico",
"America",
2,
9
],
[
"USA",
"America",
38,
11
],
[
"China",
"Asia",
5,
1
],
[
"Japan",
"Asia",
48,
11
] 
];
data.addColumn('string','Region');
data.addColumn('string','Parent');
data.addColumn('number','Val');
data.addColumn('number','Fac');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartTreeMapID2c3b160a80b3() {
var data = gvisDataTreeMapID2c3b160a80b3();
var options = {};
options["width"] = 800;
options["height"] = 500;
options["fontSize"] = 15;
options["minColor"] = "#cfe2f3";
options["midColor"] = "#6fa8dc";
options["maxColor"] = "#0b5394";
options["headerHeight"] = 10;
options["fontColor"] = "black";
options["showScale"] = true;

    var chart = new google.visualization.TreeMap(
    document.getElementById('TreeMapID2c3b160a80b3')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "treemap";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartTreeMapID2c3b160a80b3);
})();
function displayChartTreeMapID2c3b160a80b3() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartTreeMapID2c3b160a80b3"></script>
 
<!-- divChart -->
  
<div id="TreeMapID2c3b160a80b3" 
  style="width: 800; height: 500;">
</div>

The `googleVis` tree map is a visual representation of a data tree, where each node has 0 or more children, and 1 parent barring the root node. One can specify how many levels to display simultaneously, and optionally to display deeper levels. One can move down the tree when the person left-clicks a node, and moves back up the tree when the person right-clicks the graph.The total size of the graph is determined by the size of the elements contained in the graph.

This `googleVis` tree map chart captures the relative sizes of data categories, that helps for quick insight of the datapoints that are bigger contributors to each category. Color helps scrutinize datapoints that are underperforming / overperforming) compared to their siblings from the same category.


### googleVis Annotation Chart


```r
Stock_Annotation <- gvisAnnotationChart(Stock, datevar="Date",numvar="Value", idvar="Device", titlevar="Title",
                                        annotationvar="Annotation",
                                        options=list(displayAnnotations=TRUE,
                                        chart="{chartArea:{backgroundColor:'#ebf0f7'}}",
                                        legendPosition='newRow',width=800, height=450,
                                        scaleColumns='[0,1]',scaleType='allmaximized'))

plot(Stock_Annotation)
```

<!-- AnnotationChart generated in R 4.2.2 by googleVis 0.7.0 package -->
<!-- Sun Nov 13 17:55:30 2022 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataAnnotationChartID2c3b1b351bce () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
new Date(2008,0,1),
3000,
null,
null,
40645,
null,
null
],
[
new Date(2008,0,2),
14045,
null,
null,
20374,
null,
null
],
[
new Date(2008,0,3),
5502,
null,
null,
50766,
null,
null
],
[
new Date(2008,0,4),
75284,
null,
null,
14334,
"Out of stock",
"Ran out of stock of pens at 4pm"
],
[
new Date(2008,0,5),
41476,
"Bought pencils",
"Bought 200k pencils",
66467,
null,
null
],
[
new Date(2008,0,6),
333222,
null,
null,
39463,
null,
null
] 
];
data.addColumn('date','Date');
data.addColumn('number','Pencils');
data.addColumn('string','Title.Pencils');
data.addColumn('string','Annotation.Pencils');
data.addColumn('number','Pens');
data.addColumn('string','Title.Pens');
data.addColumn('string','Annotation.Pens');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartAnnotationChartID2c3b1b351bce() {
var data = gvisDataAnnotationChartID2c3b1b351bce();
var options = {};
options["width"] = 800;
options["height"] = 450;
options["displayAnnotations"] = true;
options["chart"] = {chartArea:{backgroundColor:'#ebf0f7'}};
options["legendPosition"] = "newRow";
options["scaleColumns"] = [0,1];
options["scaleType"] = "allmaximized";

    var chart = new google.visualization.AnnotationChart(
    document.getElementById('AnnotationChartID2c3b1b351bce')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "annotationchart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartAnnotationChartID2c3b1b351bce);
})();
function displayChartAnnotationChartID2c3b1b351bce() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartAnnotationChartID2c3b1b351bce"></script>
 
<!-- divChart -->
  
<div id="AnnotationChartID2c3b1b351bce" 
  style="width: 800; height: 450;">
</div>

Annotation charts are useful, interactive time series like line charts that enable annotations.These annotated charts are leveraged to highlight specific data or value-add the contextual notes within the visualization.

To answer the "so what ?" kind of questions, such well defined annotations highlight the significance of data in the chart, with keen detail in the textual description / annotation.

One can also slice through the interactive timeline chart to look for a snapshot of data which is aesthetically pleasing and also provides great detail insights within the same visualization. These annotation charts are SVG (scalable vector graphics) /VML (vector graphics rendering ).


### googleVis Calendar Chart


```r
Calendar_Temp <- gvisCalendar(Cairo, datevar="Date", numvar="Temp",
                    options=list(title="Cairo's variation in Daily
                                 temperature",height=400,width=1000,
                                 calendar="{yearLabel: { fontName:'sans-serif',
                                 fontSize: 20, color: 'black', bold: true},
                                 cellSize: 10,cellColor:{stroke: 'black', strokeOpacity: 0.2},
                                 focusedCellColor: {stroke:'red'}}"), chartid="Calendar")

plot(Calendar_Temp)
```

<!-- Calendar generated in R 4.2.2 by googleVis 0.7.0 package -->
<!-- Sun Nov 13 17:55:30 2022 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataCalendar () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
new Date(2002,0,1),
13.61111111
],
[
new Date(2002,0,2),
15.16666667
],
[
new Date(2002,0,3),
12
],
[
new Date(2002,0,4),
12
],
[
new Date(2002,0,5),
13.05555556
],
[
new Date(2002,0,6),
10.05555556
],
[
new Date(2002,0,7),
9.277777778
],
[
new Date(2002,0,8),
10.5
],
[
new Date(2002,0,9),
9.888888889
],
[
new Date(2002,0,10),
8.666666667
],
[
new Date(2002,0,11),
10.83333333
],
[
new Date(2002,0,12),
10.94444444
],
[
new Date(2002,0,13),
11.72222222
],
[
new Date(2002,0,14),
11.44444444
],
[
new Date(2002,0,15),
13.16666667
],
[
new Date(2002,0,16),
12.88888889
],
[
new Date(2002,0,17),
12.88888889
],
[
new Date(2002,0,18),
13
],
[
new Date(2002,0,19),
13.66666667
],
[
new Date(2002,0,20),
13.5
],
[
new Date(2002,0,21),
13.66666667
],
[
new Date(2002,0,22),
13.66666667
],
[
new Date(2002,0,23),
13.83333333
],
[
new Date(2002,0,24),
13
],
[
new Date(2002,0,25),
13.27777778
],
[
new Date(2002,0,26),
13.77777778
],
[
new Date(2002,0,27),
13.33333333
],
[
new Date(2002,0,28),
14.66666667
],
[
new Date(2002,0,29),
14.5
],
[
new Date(2002,0,30),
14.33333333
],
[
new Date(2002,0,31),
14.05555556
],
[
new Date(2002,1,1),
14.11111111
],
[
new Date(2002,1,2),
15.16666667
],
[
new Date(2002,1,3),
15.66666667
],
[
new Date(2002,1,4),
16.16666667
],
[
new Date(2002,1,5),
16
],
[
new Date(2002,1,6),
14.55555556
],
[
new Date(2002,1,7),
16.33333333
],
[
new Date(2002,1,8),
16.55555556
],
[
new Date(2002,1,9),
18.22222222
],
[
new Date(2002,1,10),
15.88888889
],
[
new Date(2002,1,11),
14.05555556
],
[
new Date(2002,1,12),
15.16666667
],
[
new Date(2002,1,13),
15.33333333
],
[
new Date(2002,1,14),
15.38888889
],
[
new Date(2002,1,15),
16.05555556
],
[
new Date(2002,1,16),
16
],
[
new Date(2002,1,17),
15.83333333
],
[
new Date(2002,1,18),
15.44444444
],
[
new Date(2002,1,19),
15.05555556
],
[
new Date(2002,1,20),
15.88888889
],
[
new Date(2002,1,21),
18.22222222
],
[
new Date(2002,1,22),
18.77777778
],
[
new Date(2002,1,23),
23.27777778
],
[
new Date(2002,1,24),
17.27777778
],
[
new Date(2002,1,25),
17.88888889
],
[
new Date(2002,1,26),
15.77777778
],
[
new Date(2002,1,27),
14.5
],
[
new Date(2002,1,28),
15
],
[
new Date(2002,2,1),
15.94444444
],
[
new Date(2002,2,2),
16.5
],
[
new Date(2002,2,3),
17.27777778
],
[
new Date(2002,2,4),
18.11111111
],
[
new Date(2002,2,5),
17.55555556
],
[
new Date(2002,2,6),
19.72222222
],
[
new Date(2002,2,7),
22.83333333
],
[
new Date(2002,2,8),
22.94444444
],
[
new Date(2002,2,9),
22.66666667
],
[
new Date(2002,2,10),
24
],
[
new Date(2002,2,11),
24.55555556
],
[
new Date(2002,2,12),
20.22222222
],
[
new Date(2002,2,13),
18.44444444
],
[
new Date(2002,2,14),
17.5
],
[
new Date(2002,2,15),
17.55555556
],
[
new Date(2002,2,16),
17.11111111
],
[
new Date(2002,2,17),
17.33333333
],
[
new Date(2002,2,18),
19.44444444
],
[
new Date(2002,2,19),
18.27777778
],
[
new Date(2002,2,20),
17.44444444
],
[
new Date(2002,2,21),
19.05555556
],
[
new Date(2002,2,22),
19.88888889
],
[
new Date(2002,2,23),
22.61111111
],
[
new Date(2002,2,24),
23.72222222
],
[
new Date(2002,2,25),
19.22222222
],
[
new Date(2002,2,26),
16.16666667
],
[
new Date(2002,2,27),
16.33333333
],
[
new Date(2002,2,28),
15.88888889
],
[
new Date(2002,2,29),
15.72222222
],
[
new Date(2002,2,30),
18.55555556
],
[
new Date(2002,2,31),
20.38888889
],
[
new Date(2002,3,1),
17.94444444
],
[
new Date(2002,3,2),
15.83333333
],
[
new Date(2002,3,3),
17.88888889
],
[
new Date(2002,3,4),
22.05555556
],
[
new Date(2002,3,5),
27.83333333
],
[
new Date(2002,3,6),
24.16666667
],
[
new Date(2002,3,7),
19.33333333
],
[
new Date(2002,3,8),
18.5
],
[
new Date(2002,3,9),
18.88888889
],
[
new Date(2002,3,10),
19.33333333
],
[
new Date(2002,3,11),
20.66666667
],
[
new Date(2002,3,12),
22.55555556
],
[
new Date(2002,3,13),
26.5
],
[
new Date(2002,3,14),
31.38888889
],
[
new Date(2002,3,15),
30.83333333
],
[
new Date(2002,3,16),
25.61111111
],
[
new Date(2002,3,17),
21
],
[
new Date(2002,3,18),
19.16666667
],
[
new Date(2002,3,19),
19.33333333
],
[
new Date(2002,3,20),
19.05555556
],
[
new Date(2002,3,21),
19.27777778
],
[
new Date(2002,3,22),
19.88888889
],
[
new Date(2002,3,23),
22.22222222
],
[
new Date(2002,3,24),
20.16666667
],
[
new Date(2002,3,25),
19.61111111
],
[
new Date(2002,3,26),
18.72222222
],
[
new Date(2002,3,27),
18.94444444
],
[
new Date(2002,3,28),
19.5
],
[
new Date(2002,3,29),
19.27777778
],
[
new Date(2002,3,30),
20.22222222
],
[
new Date(2002,4,1),
21.44444444
],
[
new Date(2002,4,2),
21.16666667
],
[
new Date(2002,4,3),
21.66666667
],
[
new Date(2002,4,4),
23.27777778
],
[
new Date(2002,4,5),
25.88888889
],
[
new Date(2002,4,6),
25.66666667
],
[
new Date(2002,4,7),
24.33333333
],
[
new Date(2002,4,8),
24.88888889
],
[
new Date(2002,4,9),
26
],
[
new Date(2002,4,10),
27.33333333
],
[
new Date(2002,4,11),
24.83333333
],
[
new Date(2002,4,12),
27.77777778
],
[
new Date(2002,4,13),
29.72222222
],
[
new Date(2002,4,14),
22.88888889
],
[
new Date(2002,4,15),
22.27777778
],
[
new Date(2002,4,16),
22.61111111
],
[
new Date(2002,4,17),
22.55555556
],
[
new Date(2002,4,18),
23.22222222
],
[
new Date(2002,4,19),
23.16666667
],
[
new Date(2002,4,20),
24.22222222
],
[
new Date(2002,4,21),
27.72222222
],
[
new Date(2002,4,22),
24
],
[
new Date(2002,4,23),
24.83333333
],
[
new Date(2002,4,24),
24.44444444
],
[
new Date(2002,4,25),
25.5
],
[
new Date(2002,4,26),
27.66666667
],
[
new Date(2002,4,27),
26.61111111
],
[
new Date(2002,4,28),
24.94444444
],
[
new Date(2002,4,29),
26.05555556
],
[
new Date(2002,4,30),
29.33333333
],
[
new Date(2002,4,31),
25.44444444
],
[
new Date(2002,5,1),
24.66666667
],
[
new Date(2002,5,2),
24.83333333
],
[
new Date(2002,5,3),
25.44444444
],
[
new Date(2002,5,4),
25.77777778
],
[
new Date(2002,5,5),
25.05555556
],
[
new Date(2002,5,6),
25.66666667
],
[
new Date(2002,5,7),
26.88888889
],
[
new Date(2002,5,8),
29.88888889
],
[
new Date(2002,5,9),
30.88888889
],
[
new Date(2002,5,10),
31.5
],
[
new Date(2002,5,11),
28.22222222
],
[
new Date(2002,5,12),
25.77777778
],
[
new Date(2002,5,13),
25.66666667
],
[
new Date(2002,5,14),
26.44444444
],
[
new Date(2002,5,15),
26.88888889
],
[
new Date(2002,5,16),
26.88888889
],
[
new Date(2002,5,17),
27.66666667
],
[
new Date(2002,5,22),
27.44444444
],
[
new Date(2002,5,23),
27.5
],
[
new Date(2002,5,24),
28.11111111
],
[
new Date(2002,5,25),
28.72222222
],
[
new Date(2002,5,26),
28.44444444
],
[
new Date(2002,5,27),
28.16666667
],
[
new Date(2002,5,28),
27.11111111
],
[
new Date(2002,5,29),
27.16666667
],
[
new Date(2002,5,30),
28.27777778
],
[
new Date(2002,6,1),
29
],
[
new Date(2002,6,2),
28.5
],
[
new Date(2002,6,3),
27.61111111
],
[
new Date(2002,6,4),
28.5
],
[
new Date(2002,6,5),
30.33333333
],
[
new Date(2002,6,6),
29.66666667
],
[
new Date(2002,6,7),
29.5
],
[
new Date(2002,6,8),
28.77777778
],
[
new Date(2002,6,9),
32.33333333
],
[
new Date(2002,6,10),
29.05555556
],
[
new Date(2002,6,11),
28.66666667
],
[
new Date(2002,6,12),
29.88888889
],
[
new Date(2002,6,13),
31
],
[
new Date(2002,6,14),
30.66666667
],
[
new Date(2002,6,15),
29.5
],
[
new Date(2002,6,16),
30.72222222
],
[
new Date(2002,6,17),
31.61111111
],
[
new Date(2002,6,18),
31.33333333
],
[
new Date(2002,6,19),
30.27777778
],
[
new Date(2002,6,20),
29.44444444
],
[
new Date(2002,6,21),
28.44444444
],
[
new Date(2002,6,22),
28.27777778
],
[
new Date(2002,6,23),
29.27777778
],
[
new Date(2002,6,24),
29.66666667
],
[
new Date(2002,6,25),
29.11111111
],
[
new Date(2002,6,26),
31.94444444
],
[
new Date(2002,6,27),
34
],
[
new Date(2002,6,28),
33.77777778
],
[
new Date(2002,6,29),
36.55555556
],
[
new Date(2002,6,30),
35.44444444
],
[
new Date(2002,6,31),
33.22222222
],
[
new Date(2002,7,1),
31
],
[
new Date(2002,7,2),
29
],
[
new Date(2002,7,3),
28.77777778
],
[
new Date(2002,7,4),
29.66666667
],
[
new Date(2002,7,5),
30.16666667
],
[
new Date(2002,7,6),
30.44444444
],
[
new Date(2002,7,7),
30.5
],
[
new Date(2002,7,8),
31.61111111
],
[
new Date(2002,7,9),
29.05555556
],
[
new Date(2002,7,10),
28.83333333
],
[
new Date(2002,7,11),
29.33333333
],
[
new Date(2002,7,12),
31.77777778
],
[
new Date(2002,7,13),
31.83333333
],
[
new Date(2002,7,14),
29.66666667
],
[
new Date(2002,7,15),
28.94444444
],
[
new Date(2002,7,16),
28.77777778
],
[
new Date(2002,7,17),
28.55555556
],
[
new Date(2002,7,18),
28.61111111
],
[
new Date(2002,7,19),
28.38888889
],
[
new Date(2002,7,20),
28.88888889
],
[
new Date(2002,7,21),
28.83333333
],
[
new Date(2002,7,22),
28.27777778
],
[
new Date(2002,7,23),
27.55555556
],
[
new Date(2002,7,24),
27.55555556
],
[
new Date(2002,7,25),
27.77777778
],
[
new Date(2002,7,26),
28.5
],
[
new Date(2002,7,27),
29
],
[
new Date(2002,7,28),
28.66666667
],
[
new Date(2002,7,29),
28.11111111
],
[
new Date(2002,7,30),
28.22222222
],
[
new Date(2002,7,31),
29.5
],
[
new Date(2002,8,1),
31.77777778
],
[
new Date(2002,8,2),
27.33333333
],
[
new Date(2002,8,3),
29.77777778
],
[
new Date(2002,8,4),
28.61111111
],
[
new Date(2002,8,5),
27.38888889
],
[
new Date(2002,8,6),
27.44444444
],
[
new Date(2002,8,7),
27.88888889
],
[
new Date(2002,8,8),
28.05555556
],
[
new Date(2002,8,9),
29.27777778
],
[
new Date(2002,8,10),
31.22222222
],
[
new Date(2002,8,11),
27.72222222
],
[
new Date(2002,8,12),
28.22222222
],
[
new Date(2002,8,13),
28.83333333
],
[
new Date(2002,8,14),
28.11111111
],
[
new Date(2002,8,15),
29.94444444
],
[
new Date(2002,8,16),
33.66666667
],
[
new Date(2002,8,17),
34.55555556
],
[
new Date(2002,8,18),
27.94444444
],
[
new Date(2002,8,19),
26.22222222
],
[
new Date(2002,8,20),
25.27777778
],
[
new Date(2002,8,21),
25.55555556
],
[
new Date(2002,8,22),
26.38888889
],
[
new Date(2002,8,23),
26.05555556
],
[
new Date(2002,8,24),
26.61111111
],
[
new Date(2002,8,25),
26.05555556
],
[
new Date(2002,8,26),
28
],
[
new Date(2002,8,27),
29
],
[
new Date(2002,8,28),
28.44444444
],
[
new Date(2002,8,29),
30
],
[
new Date(2002,8,30),
29.16666667
],
[
new Date(2002,9,1),
28.5
],
[
new Date(2002,9,2),
26
],
[
new Date(2002,9,3),
23.33333333
],
[
new Date(2002,9,4),
23.77777778
],
[
new Date(2002,9,5),
23.83333333
],
[
new Date(2002,9,6),
24.11111111
],
[
new Date(2002,9,7),
25.16666667
],
[
new Date(2002,9,8),
25.94444444
],
[
new Date(2002,9,9),
24.88888889
],
[
new Date(2002,9,10),
24.66666667
],
[
new Date(2002,9,11),
25
],
[
new Date(2002,9,12),
26.11111111
],
[
new Date(2002,9,13),
27.05555556
],
[
new Date(2002,9,14),
26.66666667
],
[
new Date(2002,9,15),
25
],
[
new Date(2002,9,16),
22.83333333
],
[
new Date(2002,9,17),
24.05555556
],
[
new Date(2002,9,18),
24.27777778
],
[
new Date(2002,9,19),
24.5
],
[
new Date(2002,9,20),
24.05555556
],
[
new Date(2002,9,21),
23.88888889
],
[
new Date(2002,9,22),
22.66666667
],
[
new Date(2002,9,23),
22.88888889
],
[
new Date(2002,9,24),
23.55555556
],
[
new Date(2002,9,25),
24.05555556
],
[
new Date(2002,9,26),
25.22222222
],
[
new Date(2002,9,27),
23.44444444
],
[
new Date(2002,9,28),
22.44444444
],
[
new Date(2002,9,29),
22.11111111
],
[
new Date(2002,9,30),
21.83333333
],
[
new Date(2002,9,31),
21.66666667
],
[
new Date(2002,10,1),
21.44444444
],
[
new Date(2002,10,2),
21.61111111
],
[
new Date(2002,10,3),
22.33333333
],
[
new Date(2002,10,4),
22.61111111
],
[
new Date(2002,10,5),
22.27777778
],
[
new Date(2002,10,6),
21.55555556
],
[
new Date(2002,10,7),
21.44444444
],
[
new Date(2002,10,8),
24.22222222
],
[
new Date(2002,10,9),
22.5
],
[
new Date(2002,10,10),
20.61111111
],
[
new Date(2002,10,11),
20.16666667
],
[
new Date(2002,10,12),
20.33333333
],
[
new Date(2002,10,13),
19.44444444
],
[
new Date(2002,10,14),
19.72222222
],
[
new Date(2002,10,15),
19.55555556
],
[
new Date(2002,10,16),
20.83333333
],
[
new Date(2002,10,17),
20.66666667
],
[
new Date(2002,10,18),
19.72222222
],
[
new Date(2002,10,19),
18.44444444
],
[
new Date(2002,10,20),
18.22222222
],
[
new Date(2002,10,21),
19.44444444
],
[
new Date(2002,10,22),
19.88888889
],
[
new Date(2002,10,23),
19.72222222
],
[
new Date(2002,10,24),
19.61111111
],
[
new Date(2002,10,25),
18.83333333
],
[
new Date(2002,10,26),
17.88888889
],
[
new Date(2002,10,27),
18.11111111
],
[
new Date(2002,10,28),
16.72222222
],
[
new Date(2002,10,29),
19.05555556
],
[
new Date(2002,10,30),
18.33333333
],
[
new Date(2002,11,1),
17.94444444
],
[
new Date(2002,11,2),
18.61111111
],
[
new Date(2002,11,3),
17.88888889
],
[
new Date(2002,11,4),
16.61111111
],
[
new Date(2002,11,5),
18.16666667
],
[
new Date(2002,11,6),
18.83333333
],
[
new Date(2002,11,7),
18.27777778
],
[
new Date(2002,11,8),
20.61111111
],
[
new Date(2002,11,9),
17.66666667
],
[
new Date(2002,11,10),
16.11111111
],
[
new Date(2002,11,11),
16.16666667
],
[
new Date(2002,11,12),
15.72222222
],
[
new Date(2002,11,13),
15.11111111
],
[
new Date(2002,11,14),
15.05555556
],
[
new Date(2002,11,15),
16.66666667
],
[
new Date(2002,11,16),
16.88888889
],
[
new Date(2002,11,17),
16.5
],
[
new Date(2002,11,18),
16.66666667
],
[
new Date(2002,11,19),
17.05555556
],
[
new Date(2002,11,20),
13.94444444
],
[
new Date(2002,11,21),
11.83333333
],
[
new Date(2002,11,22),
12.27777778
],
[
new Date(2002,11,23),
13.16666667
],
[
new Date(2002,11,24),
14.88888889
],
[
new Date(2002,11,25),
15.5
],
[
new Date(2002,11,26),
17.27777778
],
[
new Date(2002,11,27),
16.38888889
],
[
new Date(2002,11,28),
15.5
],
[
new Date(2002,11,29),
15.88888889
],
[
new Date(2002,11,30),
16.44444444
],
[
new Date(2002,11,31),
16.22222222
],
[
new Date(2003,0,1),
16.5
],
[
new Date(2003,0,2),
16.11111111
],
[
new Date(2003,0,3),
16.22222222
],
[
new Date(2003,0,4),
17.05555556
],
[
new Date(2003,0,5),
17.88888889
],
[
new Date(2003,0,6),
19.44444444
],
[
new Date(2003,0,7),
18.16666667
],
[
new Date(2003,0,8),
17.61111111
],
[
new Date(2003,0,9),
16.11111111
],
[
new Date(2003,0,10),
16.27777778
],
[
new Date(2003,0,11),
16.94444444
],
[
new Date(2003,0,12),
20.44444444
],
[
new Date(2003,0,13),
16.55555556
],
[
new Date(2003,0,14),
16.11111111
],
[
new Date(2003,0,15),
14.44444444
],
[
new Date(2003,0,16),
14.83333333
],
[
new Date(2003,0,17),
14.94444444
],
[
new Date(2003,0,18),
15.27777778
],
[
new Date(2003,0,19),
14.33333333
],
[
new Date(2003,0,20),
15.22222222
],
[
new Date(2003,0,21),
15.5
],
[
new Date(2003,0,22),
15.83333333
],
[
new Date(2003,0,23),
15.66666667
],
[
new Date(2003,0,24),
15.94444444
],
[
new Date(2003,0,25),
15.77777778
],
[
new Date(2003,0,26),
17.27777778
],
[
new Date(2003,0,27),
15.55555556
],
[
new Date(2003,0,28),
14.61111111
],
[
new Date(2003,0,29),
15.38888889
],
[
new Date(2003,0,30),
15.61111111
],
[
new Date(2003,0,31),
15.72222222
],
[
new Date(2003,1,1),
17.66666667
],
[
new Date(2003,1,2),
16.61111111
],
[
new Date(2003,1,3),
14.22222222
],
[
new Date(2003,1,4),
14.16666667
],
[
new Date(2003,1,5),
14.22222222
],
[
new Date(2003,1,6),
15.27777778
],
[
new Date(2003,1,7),
18.55555556
],
[
new Date(2003,1,8),
13.66666667
],
[
new Date(2003,1,9),
13.27777778
],
[
new Date(2003,1,10),
13.05555556
],
[
new Date(2003,1,11),
14
],
[
new Date(2003,1,12),
15.5
],
[
new Date(2003,1,13),
13.83333333
],
[
new Date(2003,1,14),
13.83333333
],
[
new Date(2003,1,15),
14.05555556
],
[
new Date(2003,1,16),
14.88888889
],
[
new Date(2003,1,17),
19.72222222
],
[
new Date(2003,1,18),
21.5
],
[
new Date(2003,1,19),
15.83333333
],
[
new Date(2003,1,20),
14.55555556
],
[
new Date(2003,1,21),
15.66666667
],
[
new Date(2003,1,22),
13.61111111
],
[
new Date(2003,1,23),
15.11111111
],
[
new Date(2003,1,24),
10.83333333
],
[
new Date(2003,1,25),
10.44444444
],
[
new Date(2003,1,26),
11.27777778
],
[
new Date(2003,1,27),
12.38888889
],
[
new Date(2003,1,28),
13.33333333
],
[
new Date(2003,2,1),
16.83333333
],
[
new Date(2003,2,2),
20.44444444
],
[
new Date(2003,2,3),
16.5
],
[
new Date(2003,2,4),
16.66666667
],
[
new Date(2003,2,5),
18.94444444
],
[
new Date(2003,2,6),
15.94444444
],
[
new Date(2003,2,7),
15.77777778
],
[
new Date(2003,2,8),
15.5
],
[
new Date(2003,2,9),
16.22222222
],
[
new Date(2003,2,10),
15.72222222
],
[
new Date(2003,2,11),
14.11111111
],
[
new Date(2003,2,12),
14
],
[
new Date(2003,2,13),
15.94444444
],
[
new Date(2003,2,14),
18.5
],
[
new Date(2003,2,15),
18.16666667
],
[
new Date(2003,2,16),
16.61111111
],
[
new Date(2003,2,17),
19.38888889
],
[
new Date(2003,2,18),
16.05555556
],
[
new Date(2003,2,19),
14.88888889
],
[
new Date(2003,2,20),
14.72222222
],
[
new Date(2003,2,21),
14.38888889
],
[
new Date(2003,2,22),
15.16666667
],
[
new Date(2003,2,23),
15.44444444
],
[
new Date(2003,2,24),
12.11111111
],
[
new Date(2003,2,25),
8.777777778
],
[
new Date(2003,2,26),
14.16666667
],
[
new Date(2003,2,27),
16.38888889
],
[
new Date(2003,2,28),
16.16666667
],
[
new Date(2003,2,29),
16.05555556
],
[
new Date(2003,2,30),
16.72222222
],
[
new Date(2003,2,31),
19.55555556
],
[
new Date(2003,3,1),
21.38888889
],
[
new Date(2003,3,2),
28.33333333
],
[
new Date(2003,3,3),
25.05555556
],
[
new Date(2003,3,5),
31.55555556
],
[
new Date(2003,3,6),
22.11111111
],
[
new Date(2003,3,7),
21
],
[
new Date(2003,3,8),
20.5
],
[
new Date(2003,3,9),
19.27777778
],
[
new Date(2003,3,10),
18
],
[
new Date(2003,3,11),
18.11111111
],
[
new Date(2003,3,12),
19.66666667
],
[
new Date(2003,3,13),
19.61111111
],
[
new Date(2003,3,14),
20.22222222
],
[
new Date(2003,3,15),
18.61111111
],
[
new Date(2003,3,16),
19.05555556
],
[
new Date(2003,3,17),
23.88888889
],
[
new Date(2003,3,18),
26.44444444
],
[
new Date(2003,3,19),
21.83333333
],
[
new Date(2003,3,20),
18.61111111
],
[
new Date(2003,3,21),
17.77777778
],
[
new Date(2003,3,22),
18.72222222
],
[
new Date(2003,3,23),
26.38888889
],
[
new Date(2003,3,24),
31.77777778
],
[
new Date(2003,3,25),
23.22222222
],
[
new Date(2003,3,26),
18.5
],
[
new Date(2003,3,27),
18.22222222
],
[
new Date(2003,3,28),
19.27777778
],
[
new Date(2003,3,29),
20.16666667
],
[
new Date(2003,3,30),
20.05555556
],
[
new Date(2003,4,1),
21.05555556
],
[
new Date(2003,4,2),
23.27777778
],
[
new Date(2003,4,3),
25.11111111
],
[
new Date(2003,4,4),
26.05555556
],
[
new Date(2003,4,5),
25.77777778
],
[
new Date(2003,4,6),
24.38888889
],
[
new Date(2003,4,7),
24
],
[
new Date(2003,4,8),
25.55555556
],
[
new Date(2003,4,9),
25.27777778
],
[
new Date(2003,4,10),
24.38888889
],
[
new Date(2003,4,11),
24.77777778
],
[
new Date(2003,4,12),
26.27777778
],
[
new Date(2003,4,13),
27.66666667
],
[
new Date(2003,4,14),
28.11111111
],
[
new Date(2003,4,15),
31.27777778
],
[
new Date(2003,4,16),
29.11111111
],
[
new Date(2003,4,17),
26.27777778
],
[
new Date(2003,4,18),
27.5
],
[
new Date(2003,4,19),
27.83333333
],
[
new Date(2003,4,20),
26.44444444
],
[
new Date(2003,4,21),
27.44444444
],
[
new Date(2003,4,22),
27.66666667
],
[
new Date(2003,4,23),
30.11111111
],
[
new Date(2003,4,24),
27.66666667
],
[
new Date(2003,4,25),
27
],
[
new Date(2003,4,26),
26.38888889
],
[
new Date(2003,4,27),
25.38888889
],
[
new Date(2003,4,28),
30.88888889
],
[
new Date(2003,4,29),
34.38888889
],
[
new Date(2003,4,30),
27.33333333
],
[
new Date(2003,4,31),
26.27777778
],
[
new Date(2003,5,1),
25.44444444
],
[
new Date(2003,5,2),
26.72222222
],
[
new Date(2003,5,3),
26.38888889
],
[
new Date(2003,5,4),
25.61111111
],
[
new Date(2003,5,5),
27
],
[
new Date(2003,5,6),
28.05555556
],
[
new Date(2003,5,7),
28.94444444
],
[
new Date(2003,5,8),
27.72222222
],
[
new Date(2003,5,9),
27.72222222
],
[
new Date(2003,5,10),
28
],
[
new Date(2003,5,11),
27.27777778
],
[
new Date(2003,5,12),
27.83333333
],
[
new Date(2003,5,13),
28.05555556
],
[
new Date(2003,5,14),
28.66666667
],
[
new Date(2003,5,15),
30.44444444
],
[
new Date(2003,5,16),
32.5
],
[
new Date(2003,5,17),
31.72222222
],
[
new Date(2003,5,18),
28.83333333
],
[
new Date(2003,5,19),
28.61111111
],
[
new Date(2003,5,20),
28.5
],
[
new Date(2003,5,21),
29.77777778
],
[
new Date(2003,5,22),
29.94444444
],
[
new Date(2003,5,23),
28.72222222
],
[
new Date(2003,5,24),
28.77777778
],
[
new Date(2003,5,25),
29.27777778
],
[
new Date(2003,5,26),
29.33333333
],
[
new Date(2003,5,27),
28.72222222
],
[
new Date(2003,5,28),
29.27777778
],
[
new Date(2003,5,29),
28.94444444
],
[
new Date(2003,5,30),
29.44444444
],
[
new Date(2003,6,1),
29.38888889
],
[
new Date(2003,6,2),
29.5
],
[
new Date(2003,6,3),
30.83333333
],
[
new Date(2003,6,4),
30.94444444
],
[
new Date(2003,6,5),
30.05555556
],
[
new Date(2003,6,6),
31.77777778
],
[
new Date(2003,6,7),
28.88888889
],
[
new Date(2003,6,8),
27.77777778
],
[
new Date(2003,6,9),
27.22222222
],
[
new Date(2003,6,10),
26.77777778
],
[
new Date(2003,6,11),
26.88888889
],
[
new Date(2003,6,12),
27.22222222
],
[
new Date(2003,6,13),
27.72222222
],
[
new Date(2003,6,14),
27
],
[
new Date(2003,6,15),
27.33333333
],
[
new Date(2003,6,16),
27.77777778
],
[
new Date(2003,6,17),
28.16666667
],
[
new Date(2003,6,18),
29.33333333
],
[
new Date(2003,6,19),
30.38888889
],
[
new Date(2003,6,20),
30.38888889
],
[
new Date(2003,6,21),
28.16666667
],
[
new Date(2003,6,22),
27.77777778
],
[
new Date(2003,6,23),
28.77777778
],
[
new Date(2003,6,24),
28.44444444
],
[
new Date(2003,6,25),
28.61111111
],
[
new Date(2003,6,26),
29.38888889
],
[
new Date(2003,6,27),
28.61111111
],
[
new Date(2003,6,28),
28.33333333
],
[
new Date(2003,6,29),
28.72222222
],
[
new Date(2003,6,30),
28.72222222
],
[
new Date(2003,6,31),
29.05555556
],
[
new Date(2003,7,1),
29.44444444
],
[
new Date(2003,7,2),
30.27777778
],
[
new Date(2003,7,3),
30.61111111
],
[
new Date(2003,7,4),
29.83333333
],
[
new Date(2003,7,5),
28.88888889
],
[
new Date(2003,7,6),
29
],
[
new Date(2003,7,7),
28.38888889
],
[
new Date(2003,7,8),
28.94444444
],
[
new Date(2003,7,9),
28.83333333
],
[
new Date(2003,7,10),
28.5
],
[
new Date(2003,7,11),
27.27777778
],
[
new Date(2003,7,12),
27.38888889
],
[
new Date(2003,7,13),
28.11111111
],
[
new Date(2003,7,14),
27.77777778
],
[
new Date(2003,7,15),
27.94444444
],
[
new Date(2003,7,16),
28.38888889
],
[
new Date(2003,7,17),
29.05555556
],
[
new Date(2003,7,18),
29
],
[
new Date(2003,7,19),
29.66666667
],
[
new Date(2003,7,20),
29.83333333
],
[
new Date(2003,7,21),
29.16666667
],
[
new Date(2003,7,22),
29.22222222
],
[
new Date(2003,7,23),
28.88888889
],
[
new Date(2003,7,24),
28.88888889
],
[
new Date(2003,7,25),
29.22222222
],
[
new Date(2003,7,26),
28.94444444
],
[
new Date(2003,7,27),
28.94444444
],
[
new Date(2003,7,28),
30.44444444
],
[
new Date(2003,7,29),
29.5
],
[
new Date(2003,7,30),
29.05555556
],
[
new Date(2003,7,31),
29
],
[
new Date(2003,8,1),
29.66666667
],
[
new Date(2003,8,2),
31.27777778
],
[
new Date(2003,8,3),
30.11111111
],
[
new Date(2003,8,4),
29.27777778
],
[
new Date(2003,8,5),
26.66666667
],
[
new Date(2003,8,6),
25
],
[
new Date(2003,8,7),
25.33333333
],
[
new Date(2003,8,8),
26.27777778
],
[
new Date(2003,8,9),
25.44444444
],
[
new Date(2003,8,10),
28.83333333
],
[
new Date(2003,8,11),
31.66666667
],
[
new Date(2003,8,12),
28.22222222
],
[
new Date(2003,8,13),
27.27777778
],
[
new Date(2003,8,14),
27.05555556
],
[
new Date(2003,8,15),
26.77777778
],
[
new Date(2003,8,16),
27.27777778
],
[
new Date(2003,8,17),
30.44444444
],
[
new Date(2003,8,18),
28.05555556
],
[
new Date(2003,8,19),
25.72222222
],
[
new Date(2003,8,20),
25.66666667
],
[
new Date(2003,8,21),
26.05555556
],
[
new Date(2003,8,22),
25.44444444
],
[
new Date(2003,8,23),
25.83333333
],
[
new Date(2003,8,24),
26.22222222
],
[
new Date(2003,8,25),
25.11111111
],
[
new Date(2003,8,26),
25.05555556
],
[
new Date(2003,8,27),
24.88888889
],
[
new Date(2003,8,28),
24.16666667
],
[
new Date(2003,8,29),
24.22222222
],
[
new Date(2003,8,30),
26.11111111
],
[
new Date(2003,9,1),
26.11111111
],
[
new Date(2003,9,2),
24.88888889
],
[
new Date(2003,9,3),
25.05555556
],
[
new Date(2003,9,4),
25.27777778
],
[
new Date(2003,9,5),
25.38888889
],
[
new Date(2003,9,6),
26.16666667
],
[
new Date(2003,9,7),
26
],
[
new Date(2003,9,8),
25.77777778
],
[
new Date(2003,9,9),
26
],
[
new Date(2003,9,10),
25.72222222
],
[
new Date(2003,9,11),
23.05555556
],
[
new Date(2003,9,12),
21.72222222
],
[
new Date(2003,9,13),
22.55555556
],
[
new Date(2003,9,14),
23
],
[
new Date(2003,9,15),
22.55555556
],
[
new Date(2003,9,16),
22.55555556
],
[
new Date(2003,9,17),
22.66666667
],
[
new Date(2003,9,18),
24.11111111
],
[
new Date(2003,9,19),
23.55555556
],
[
new Date(2003,9,20),
24.5
],
[
new Date(2003,9,21),
26
],
[
new Date(2003,9,22),
26.61111111
],
[
new Date(2003,9,23),
26.5
],
[
new Date(2003,9,24),
26.88888889
],
[
new Date(2003,9,25),
25.05555556
],
[
new Date(2003,9,26),
26.16666667
],
[
new Date(2003,9,27),
23.77777778
],
[
new Date(2003,9,28),
24.44444444
],
[
new Date(2003,9,29),
21.5
],
[
new Date(2003,9,30),
20.33333333
],
[
new Date(2003,9,31),
24.5
],
[
new Date(2003,10,1),
28
],
[
new Date(2003,10,2),
25.66666667
],
[
new Date(2003,10,3),
24.44444444
],
[
new Date(2003,10,4),
24.27777778
],
[
new Date(2003,10,5),
22.66666667
],
[
new Date(2003,10,6),
23.55555556
],
[
new Date(2003,10,7),
23.05555556
],
[
new Date(2003,10,8),
21.16666667
],
[
new Date(2003,10,9),
20.27777778
],
[
new Date(2003,10,10),
18.38888889
],
[
new Date(2003,10,11),
17.83333333
],
[
new Date(2003,10,12),
17.5
],
[
new Date(2003,10,13),
17.77777778
],
[
new Date(2003,10,14),
18.61111111
],
[
new Date(2003,10,15),
18.83333333
],
[
new Date(2003,10,16),
18.88888889
],
[
new Date(2003,10,17),
18.83333333
],
[
new Date(2003,10,18),
19.22222222
],
[
new Date(2003,10,19),
18.77777778
],
[
new Date(2003,10,20),
19.22222222
],
[
new Date(2003,10,21),
19.11111111
],
[
new Date(2003,10,22),
19.66666667
],
[
new Date(2003,10,23),
19.72222222
],
[
new Date(2003,10,24),
19.27777778
],
[
new Date(2003,10,25),
19.27777778
],
[
new Date(2003,10,26),
18.61111111
],
[
new Date(2003,10,27),
17.77777778
],
[
new Date(2003,10,28),
17.5
],
[
new Date(2003,10,29),
17.72222222
],
[
new Date(2003,10,30),
17.66666667
],
[
new Date(2003,11,1),
17.72222222
],
[
new Date(2003,11,2),
17.11111111
],
[
new Date(2003,11,3),
17.11111111
],
[
new Date(2003,11,4),
15.27777778
],
[
new Date(2003,11,5),
15.77777778
],
[
new Date(2003,11,6),
16.22222222
],
[
new Date(2003,11,7),
16.38888889
],
[
new Date(2003,11,8),
16.44444444
],
[
new Date(2003,11,9),
18.33333333
],
[
new Date(2003,11,10),
16.94444444
],
[
new Date(2003,11,11),
17.44444444
],
[
new Date(2003,11,12),
18.11111111
],
[
new Date(2003,11,13),
18.38888889
],
[
new Date(2003,11,14),
18.88888889
],
[
new Date(2003,11,15),
18.61111111
],
[
new Date(2003,11,16),
18
],
[
new Date(2003,11,17),
17.38888889
],
[
new Date(2003,11,18),
12.5
],
[
new Date(2003,11,19),
12.88888889
],
[
new Date(2003,11,20),
12.77777778
],
[
new Date(2003,11,21),
12.5
],
[
new Date(2003,11,22),
12.38888889
],
[
new Date(2003,11,23),
13.33333333
],
[
new Date(2003,11,24),
12.72222222
],
[
new Date(2003,11,25),
13.38888889
],
[
new Date(2003,11,26),
12
],
[
new Date(2003,11,27),
11.94444444
],
[
new Date(2003,11,28),
13.72222222
],
[
new Date(2003,11,29),
13.88888889
],
[
new Date(2003,11,30),
13.27777778
],
[
new Date(2003,11,31),
13.88888889
],
[
new Date(2004,0,1),
14.94444444
],
[
new Date(2004,0,2),
15.94444444
],
[
new Date(2004,0,3),
13.83333333
],
[
new Date(2004,0,4),
15.94444444
],
[
new Date(2004,0,5),
15.77777778
],
[
new Date(2004,0,6),
14.66666667
],
[
new Date(2004,0,7),
13.27777778
],
[
new Date(2004,0,8),
11.77777778
],
[
new Date(2004,0,9),
13.22222222
],
[
new Date(2004,0,10),
13.83333333
],
[
new Date(2004,0,11),
15.72222222
],
[
new Date(2004,0,12),
12.16666667
],
[
new Date(2004,0,13),
14.05555556
],
[
new Date(2004,0,14),
15
],
[
new Date(2004,0,15),
16.72222222
],
[
new Date(2004,0,16),
17
],
[
new Date(2004,0,17),
15.38888889
],
[
new Date(2004,0,18),
13.94444444
],
[
new Date(2004,0,19),
13.38888889
],
[
new Date(2004,0,20),
15
],
[
new Date(2004,0,21),
16.94444444
],
[
new Date(2004,0,22),
17.44444444
],
[
new Date(2004,0,23),
12.61111111
],
[
new Date(2004,0,24),
12.05555556
],
[
new Date(2004,0,25),
14.22222222
],
[
new Date(2004,0,26),
12.72222222
],
[
new Date(2004,0,27),
14.55555556
],
[
new Date(2004,0,28),
14.33333333
],
[
new Date(2004,0,29),
16
],
[
new Date(2004,0,30),
17.16666667
],
[
new Date(2004,0,31),
14.55555556
],
[
new Date(2004,1,1),
13.61111111
],
[
new Date(2004,1,2),
14.05555556
],
[
new Date(2004,1,3),
13.66666667
],
[
new Date(2004,1,4),
12.38888889
],
[
new Date(2004,1,5),
13
],
[
new Date(2004,1,6),
13.72222222
],
[
new Date(2004,1,7),
15.16666667
],
[
new Date(2004,1,8),
15.88888889
],
[
new Date(2004,1,9),
15.05555556
],
[
new Date(2004,1,10),
15.44444444
],
[
new Date(2004,1,11),
14.77777778
],
[
new Date(2004,1,12),
16.38888889
],
[
new Date(2004,1,13),
15.94444444
],
[
new Date(2004,1,14),
10.05555556
],
[
new Date(2004,1,15),
11.5
],
[
new Date(2004,1,16),
13.94444444
],
[
new Date(2004,1,17),
15.16666667
],
[
new Date(2004,1,18),
15.61111111
],
[
new Date(2004,1,19),
13.16666667
],
[
new Date(2004,1,20),
13.33333333
],
[
new Date(2004,1,21),
14.33333333
],
[
new Date(2004,1,22),
13.05555556
],
[
new Date(2004,1,23),
14.16666667
],
[
new Date(2004,1,24),
20.83333333
],
[
new Date(2004,1,25),
19.38888889
],
[
new Date(2004,1,26),
21
],
[
new Date(2004,1,27),
22.66666667
],
[
new Date(2004,1,28),
24.88888889
],
[
new Date(2004,1,29),
26.44444444
],
[
new Date(2004,2,1),
21.22222222
],
[
new Date(2004,2,2),
20.61111111
],
[
new Date(2004,2,3),
25.38888889
],
[
new Date(2004,2,4),
31.44444444
],
[
new Date(2004,2,5),
20.77777778
],
[
new Date(2004,2,6),
15.88888889
],
[
new Date(2004,2,7),
13.22222222
],
[
new Date(2004,2,8),
13.27777778
],
[
new Date(2004,2,9),
14.61111111
],
[
new Date(2004,2,10),
17.88888889
],
[
new Date(2004,2,11),
18.05555556
],
[
new Date(2004,2,12),
16.83333333
],
[
new Date(2004,2,13),
16.16666667
],
[
new Date(2004,2,14),
15.55555556
],
[
new Date(2004,2,15),
15.05555556
],
[
new Date(2004,2,16),
14.83333333
],
[
new Date(2004,2,17),
15
],
[
new Date(2004,2,18),
16
],
[
new Date(2004,2,19),
16.61111111
],
[
new Date(2004,2,20),
16.33333333
],
[
new Date(2004,2,21),
16.55555556
],
[
new Date(2004,2,22),
18
],
[
new Date(2004,2,23),
19.05555556
],
[
new Date(2004,2,24),
19
],
[
new Date(2004,2,25),
18.94444444
],
[
new Date(2004,2,26),
17.61111111
],
[
new Date(2004,2,27),
18.11111111
],
[
new Date(2004,2,28),
20.33333333
],
[
new Date(2004,2,29),
23.77777778
],
[
new Date(2004,2,30),
23.66666667
],
[
new Date(2004,2,31),
23.05555556
],
[
new Date(2004,3,1),
27.33333333
],
[
new Date(2004,3,2),
21.72222222
],
[
new Date(2004,3,3),
18.11111111
],
[
new Date(2004,3,4),
18.44444444
],
[
new Date(2004,3,5),
17.77777778
],
[
new Date(2004,3,6),
16.77777778
],
[
new Date(2004,3,7),
17.22222222
],
[
new Date(2004,3,8),
17.61111111
],
[
new Date(2004,3,9),
18
],
[
new Date(2004,3,10),
19.94444444
],
[
new Date(2004,3,11),
22.27777778
],
[
new Date(2004,3,12),
23.27777778
],
[
new Date(2004,3,13),
24.44444444
],
[
new Date(2004,3,14),
25.05555556
],
[
new Date(2004,3,15),
20.61111111
],
[
new Date(2004,3,16),
18.16666667
],
[
new Date(2004,3,17),
19.94444444
],
[
new Date(2004,3,18),
25.05555556
],
[
new Date(2004,3,19),
22.05555556
],
[
new Date(2004,3,20),
25.11111111
],
[
new Date(2004,3,21),
21.61111111
],
[
new Date(2004,3,22),
20.55555556
],
[
new Date(2004,3,23),
19.22222222
],
[
new Date(2004,3,24),
19.94444444
],
[
new Date(2004,3,25),
21.88888889
],
[
new Date(2004,3,26),
25.88888889
],
[
new Date(2004,3,27),
25.66666667
],
[
new Date(2004,3,28),
26
],
[
new Date(2004,3,29),
21.22222222
],
[
new Date(2004,3,30),
21.38888889
],
[
new Date(2004,4,1),
24.38888889
],
[
new Date(2004,4,2),
23.83333333
],
[
new Date(2004,4,3),
21.66666667
],
[
new Date(2004,4,4),
22.05555556
],
[
new Date(2004,4,5),
26
],
[
new Date(2004,4,6),
30.83333333
],
[
new Date(2004,4,7),
27.55555556
],
[
new Date(2004,4,8),
27.11111111
],
[
new Date(2004,4,9),
30.33333333
],
[
new Date(2004,4,10),
30.38888889
],
[
new Date(2004,4,11),
23.27777778
],
[
new Date(2004,4,12),
22.33333333
],
[
new Date(2004,4,13),
26.61111111
],
[
new Date(2004,4,14),
29.16666667
],
[
new Date(2004,4,15),
22.55555556
],
[
new Date(2004,4,16),
22.27777778
],
[
new Date(2004,4,17),
24.5
],
[
new Date(2004,4,18),
26.77777778
],
[
new Date(2004,4,19),
26.11111111
],
[
new Date(2004,4,20),
22.38888889
],
[
new Date(2004,4,21),
22
],
[
new Date(2004,4,22),
23.11111111
],
[
new Date(2004,4,23),
22.83333333
],
[
new Date(2004,4,24),
23.44444444
],
[
new Date(2004,4,25),
24.22222222
],
[
new Date(2004,4,26),
24.94444444
],
[
new Date(2004,4,27),
26.72222222
],
[
new Date(2004,4,28),
25.33333333
],
[
new Date(2004,4,29),
28.5
],
[
new Date(2004,4,30),
30.11111111
],
[
new Date(2004,4,31),
24.77777778
],
[
new Date(2004,5,1),
23.5
],
[
new Date(2004,5,2),
23.72222222
],
[
new Date(2004,5,3),
24.05555556
],
[
new Date(2004,5,4),
24.66666667
],
[
new Date(2004,5,5),
25.55555556
],
[
new Date(2004,5,6),
28.55555556
],
[
new Date(2004,5,7),
31.27777778
],
[
new Date(2004,5,8),
26.72222222
],
[
new Date(2004,5,9),
24.61111111
],
[
new Date(2004,5,10),
25.05555556
],
[
new Date(2004,5,11),
26.33333333
],
[
new Date(2004,5,12),
27.27777778
],
[
new Date(2004,5,13),
27.72222222
],
[
new Date(2004,5,14),
27.5
],
[
new Date(2004,5,15),
28.72222222
],
[
new Date(2004,5,16),
28.27777778
],
[
new Date(2004,5,17),
28.5
],
[
new Date(2004,5,18),
30.55555556
],
[
new Date(2004,5,19),
32.05555556
],
[
new Date(2004,5,20),
27.05555556
],
[
new Date(2004,5,21),
27.05555556
],
[
new Date(2004,5,22),
27.38888889
],
[
new Date(2004,5,23),
27.66666667
],
[
new Date(2004,5,24),
27.22222222
],
[
new Date(2004,5,25),
26.66666667
],
[
new Date(2004,5,26),
27.5
],
[
new Date(2004,5,27),
28.38888889
],
[
new Date(2004,5,28),
28
],
[
new Date(2004,5,29),
28
],
[
new Date(2004,5,30),
29.22222222
],
[
new Date(2004,6,1),
29.11111111
],
[
new Date(2004,6,2),
27.16666667
],
[
new Date(2004,6,3),
27.5
],
[
new Date(2004,6,4),
28.11111111
],
[
new Date(2004,6,5),
29.5
],
[
new Date(2004,6,6),
29.88888889
],
[
new Date(2004,6,7),
29.55555556
],
[
new Date(2004,6,8),
28.77777778
],
[
new Date(2004,6,9),
28.61111111
],
[
new Date(2004,6,10),
29.5
],
[
new Date(2004,6,11),
29.44444444
],
[
new Date(2004,6,12),
30.11111111
],
[
new Date(2004,6,13),
31.38888889
],
[
new Date(2004,6,14),
33.27777778
],
[
new Date(2004,6,15),
30.44444444
],
[
new Date(2004,6,16),
28.55555556
],
[
new Date(2004,6,17),
27.05555556
],
[
new Date(2004,6,18),
26.94444444
],
[
new Date(2004,6,19),
27.66666667
],
[
new Date(2004,6,20),
27.27777778
],
[
new Date(2004,6,21),
27.44444444
],
[
new Date(2004,6,22),
28.16666667
],
[
new Date(2004,6,23),
28.44444444
],
[
new Date(2004,6,24),
28.66666667
],
[
new Date(2004,6,25),
29.22222222
],
[
new Date(2004,6,26),
30.5
],
[
new Date(2004,6,27),
30.83333333
],
[
new Date(2004,6,28),
30.61111111
],
[
new Date(2004,6,29),
31.33333333
],
[
new Date(2004,6,30),
31.11111111
],
[
new Date(2004,6,31),
29.05555556
],
[
new Date(2004,7,1),
27.61111111
],
[
new Date(2004,7,2),
27.44444444
],
[
new Date(2004,7,3),
28.11111111
],
[
new Date(2004,7,4),
28.33333333
],
[
new Date(2004,7,5),
28.22222222
],
[
new Date(2004,7,6),
29.22222222
],
[
new Date(2004,7,7),
29.22222222
],
[
new Date(2004,7,8),
30.94444444
],
[
new Date(2004,7,9),
29.94444444
],
[
new Date(2004,7,10),
28.66666667
],
[
new Date(2004,7,11),
29.55555556
],
[
new Date(2004,7,12),
28.22222222
],
[
new Date(2004,7,13),
28.72222222
],
[
new Date(2004,7,14),
29.22222222
],
[
new Date(2004,7,15),
29.66666667
],
[
new Date(2004,7,16),
30.94444444
],
[
new Date(2004,7,17),
30.22222222
],
[
new Date(2004,7,18),
27.94444444
],
[
new Date(2004,7,19),
26.83333333
],
[
new Date(2004,7,20),
27.5
],
[
new Date(2004,7,21),
29.22222222
],
[
new Date(2004,7,22),
29.94444444
],
[
new Date(2004,7,23),
29.44444444
],
[
new Date(2004,7,24),
28.88888889
],
[
new Date(2004,7,25),
28.05555556
],
[
new Date(2004,7,26),
27.33333333
],
[
new Date(2004,7,27),
28.05555556
],
[
new Date(2004,7,28),
29.77777778
],
[
new Date(2004,7,29),
28
],
[
new Date(2004,7,30),
26.61111111
],
[
new Date(2004,7,31),
26.83333333
],
[
new Date(2004,8,1),
26.94444444
],
[
new Date(2004,8,2),
27.94444444
],
[
new Date(2004,8,3),
27.77777778
],
[
new Date(2004,8,4),
28
],
[
new Date(2004,8,5),
28.61111111
],
[
new Date(2004,8,6),
28.55555556
],
[
new Date(2004,8,7),
28.44444444
],
[
new Date(2004,8,8),
27.83333333
],
[
new Date(2004,8,9),
26.22222222
],
[
new Date(2004,8,10),
25.61111111
],
[
new Date(2004,8,11),
25
],
[
new Date(2004,8,12),
24.44444444
],
[
new Date(2004,8,13),
24.83333333
],
[
new Date(2004,8,14),
24.66666667
],
[
new Date(2004,8,15),
24.61111111
],
[
new Date(2004,8,16),
24.33333333
],
[
new Date(2004,8,17),
25.38888889
],
[
new Date(2004,8,18),
25.61111111
],
[
new Date(2004,8,19),
26.38888889
],
[
new Date(2004,8,20),
27.61111111
],
[
new Date(2004,8,21),
26.61111111
],
[
new Date(2004,8,22),
26.22222222
],
[
new Date(2004,8,23),
26.27777778
],
[
new Date(2004,8,24),
25.61111111
],
[
new Date(2004,8,25),
27.11111111
],
[
new Date(2004,8,26),
28.83333333
],
[
new Date(2004,8,27),
27.61111111
],
[
new Date(2004,8,28),
28.05555556
],
[
new Date(2004,8,29),
28.77777778
],
[
new Date(2004,8,30),
28.88888889
],
[
new Date(2004,9,1),
27.66666667
],
[
new Date(2004,9,2),
26.44444444
],
[
new Date(2004,9,3),
25.27777778
],
[
new Date(2004,9,4),
25.22222222
],
[
new Date(2004,9,5),
24.77777778
],
[
new Date(2004,9,6),
24.44444444
],
[
new Date(2004,9,7),
24
],
[
new Date(2004,9,8),
23.55555556
],
[
new Date(2004,9,9),
23.16666667
],
[
new Date(2004,9,10),
23.11111111
],
[
new Date(2004,9,11),
22.94444444
],
[
new Date(2004,9,12),
23.44444444
],
[
new Date(2004,9,13),
23.83333333
],
[
new Date(2004,9,14),
23.77777778
],
[
new Date(2004,9,15),
24.11111111
],
[
new Date(2004,9,16),
24.88888889
],
[
new Date(2004,9,17),
25.55555556
],
[
new Date(2004,9,18),
26.22222222
],
[
new Date(2004,9,19),
26.55555556
],
[
new Date(2004,9,20),
25.44444444
],
[
new Date(2004,9,21),
25.44444444
],
[
new Date(2004,9,22),
25.38888889
],
[
new Date(2004,9,23),
25.27777778
],
[
new Date(2004,9,24),
24.5
],
[
new Date(2004,9,25),
25.11111111
],
[
new Date(2004,9,26),
25.27777778
],
[
new Date(2004,9,27),
24.27777778
],
[
new Date(2004,9,28),
23.61111111
],
[
new Date(2004,9,29),
23.55555556
],
[
new Date(2004,9,30),
25.5
],
[
new Date(2004,9,31),
24.05555556
],
[
new Date(2004,10,1),
23.83333333
],
[
new Date(2004,10,2),
24.55555556
],
[
new Date(2004,10,3),
25.11111111
],
[
new Date(2004,10,4),
24.55555556
],
[
new Date(2004,10,5),
24.55555556
],
[
new Date(2004,10,6),
24.33333333
],
[
new Date(2004,10,7),
23
],
[
new Date(2004,10,8),
24.38888889
],
[
new Date(2004,10,9),
24.38888889
],
[
new Date(2004,10,10),
24.33333333
],
[
new Date(2004,10,11),
24.05555556
],
[
new Date(2004,10,12),
23.33333333
],
[
new Date(2004,10,13),
22.11111111
],
[
new Date(2004,10,14),
22.11111111
],
[
new Date(2004,10,15),
24.61111111
],
[
new Date(2004,10,16),
23.33333333
],
[
new Date(2004,10,17),
21.16666667
],
[
new Date(2004,10,18),
19.27777778
],
[
new Date(2004,10,19),
18.61111111
],
[
new Date(2004,10,20),
19
],
[
new Date(2004,10,21),
19.94444444
],
[
new Date(2004,10,22),
15.27777778
],
[
new Date(2004,10,23),
13.33333333
],
[
new Date(2004,10,24),
15.05555556
],
[
new Date(2004,10,25),
17
],
[
new Date(2004,10,26),
14.66666667
],
[
new Date(2004,10,27),
13.94444444
],
[
new Date(2004,10,28),
14.72222222
],
[
new Date(2004,10,29),
16
],
[
new Date(2004,10,30),
16.11111111
],
[
new Date(2004,11,1),
16.11111111
],
[
new Date(2004,11,2),
16.38888889
],
[
new Date(2004,11,3),
16.44444444
],
[
new Date(2004,11,4),
15.72222222
],
[
new Date(2004,11,5),
16.05555556
],
[
new Date(2004,11,6),
16.83333333
],
[
new Date(2004,11,7),
17.11111111
],
[
new Date(2004,11,8),
17
],
[
new Date(2004,11,9),
15.38888889
],
[
new Date(2004,11,10),
15.33333333
],
[
new Date(2004,11,11),
16
],
[
new Date(2004,11,12),
15.66666667
],
[
new Date(2004,11,13),
14.94444444
],
[
new Date(2004,11,14),
14.44444444
],
[
new Date(2004,11,15),
14.88888889
],
[
new Date(2004,11,16),
13.61111111
],
[
new Date(2004,11,17),
12.11111111
],
[
new Date(2004,11,18),
12.38888889
],
[
new Date(2004,11,19),
15.38888889
],
[
new Date(2004,11,20),
15.33333333
],
[
new Date(2004,11,21),
15.27777778
],
[
new Date(2004,11,22),
14.83333333
],
[
new Date(2004,11,23),
15.22222222
],
[
new Date(2004,11,24),
15
],
[
new Date(2004,11,25),
13.27777778
],
[
new Date(2004,11,26),
14.22222222
],
[
new Date(2004,11,27),
14.27777778
],
[
new Date(2004,11,28),
14.55555556
],
[
new Date(2004,11,29),
16.16666667
],
[
new Date(2004,11,30),
16.83333333
],
[
new Date(2004,11,31),
18.33333333
] 
];
data.addColumn('date','Date');
data.addColumn('number','Temp');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartCalendar() {
var data = gvisDataCalendar();
var options = {};
options["width"] = 1000;
options["height"] = 400;
options["title"] = "Cairo's variation in Daily\n                                 temperature";
options["calendar"] = {yearLabel: { fontName:'sans-serif',
                                 fontSize: 20, color: 'black', bold: true},
                                 cellSize: 10,cellColor:{stroke: 'black', strokeOpacity: 0.2},
                                 focusedCellColor: {stroke:'red'}};

    var chart = new google.visualization.Calendar(
    document.getElementById('Calendar')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "calendar";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartCalendar);
})();
function displayChartCalendar() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartCalendar"></script>
 
<!-- divChart -->
  
<div id="Calendar" 
  style="width: 1000; height: 400;">
</div>

The `googleVis` calendar chart is a definitive visualization that can be used to show activity over the course of a longer duration of time, example in months or years or decades. One can illustrate the variation of 1 quantity depending on the days of the given week, or trends over the timeline period.

Such calendar charts demonstrate data records, or events, on a daily, weekly, monthly, yearly calendar. It is highly interactive and one can view the value on hovering on any particular time of the entire timeperiod.


### googleVis Timeline Chart


```r
Position_Timeline_Data <- data.frame(Position=c(rep("President", 4), rep("Vice", 4)),
                    Name=c("William Clinton","George Bush", "Barack Obama", "	Donald Trump",
                          "	Albert Gore","Dick Cheney", "Biden, Jr.", "Michael Pence"),
                    start=as.Date(x=rep(c("1993-01-20","2001-01-20", "2009-01-20","2017-01-20"),2)),
                    end=as.Date(x=rep(c("2001-01-20","2009-01-20", "2017-01-20", "2021-01-20"),2)))

Timeline <- gvisTimeline(data=Position_Timeline_Data, 
                         rowlabel="Name",
                         barlabel="Position",
                         start="start", 
                         end="end",
                         options=list(timeline="{groupByRowLabel:false}",
                                      backgroundColor='#e3f4ff', 
                                      height=400,colors="['#0e407d', '#78b2ff', '#3737ab']"))

plot(Timeline)
```

<!-- Timeline generated in R 4.2.2 by googleVis 0.7.0 package -->
<!-- Sun Nov 13 17:55:30 2022 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataTimelineID2c3b42963882 () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
"William Clinton",
"President",
new Date(1993,0,20),
new Date(2001,0,20)
],
[
"George Bush",
"President",
new Date(2001,0,20),
new Date(2009,0,20)
],
[
"Barack Obama",
"President",
new Date(2009,0,20),
new Date(2017,0,20)
],
[
"	Donald Trump",
"President",
new Date(2017,0,20),
new Date(2021,0,20)
],
[
"	Albert Gore",
"Vice",
new Date(1993,0,20),
new Date(2001,0,20)
],
[
"Dick Cheney",
"Vice",
new Date(2001,0,20),
new Date(2009,0,20)
],
[
"Biden, Jr.",
"Vice",
new Date(2009,0,20),
new Date(2017,0,20)
],
[
"Michael Pence",
"Vice",
new Date(2017,0,20),
new Date(2021,0,20)
] 
];
data.addColumn('string','Name');
data.addColumn('string','Position');
data.addColumn('date','start');
data.addColumn('date','end');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartTimelineID2c3b42963882() {
var data = gvisDataTimelineID2c3b42963882();
var options = {};
options["width"] = 600;
options["height"] = 400;
options["timeline"] = {groupByRowLabel:false};
options["backgroundColor"] = "#e3f4ff";
options["colors"] = ['#0e407d', '#78b2ff', '#3737ab'];

    var chart = new google.visualization.Timeline(
    document.getElementById('TimelineID2c3b42963882')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "timeline";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartTimelineID2c3b42963882);
})();
function displayChartTimelineID2c3b42963882() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartTimelineID2c3b42963882"></script>
 
<!-- divChart -->
  
<div id="TimelineID2c3b42963882" 
  style="width: 600; height: 400;">
</div>

This `googleVis` Timeline chart is a great and fascinating way of visualizing the different dates / events. Here is an example, showing duration of Presidents & Vice Presidents / Sessions of Congress over the timeline period. The exact times and durations are given when one interactively hovers over the bars.

These timeline charts are versatile visuals for illustrating a sequence of events chronologically. It provides an amazing aid to conceptualize event sequences / processes to gain valuable insights, sometimes maybe summarize historical events, or time frame of minutes, hours, years or datewise.


### googleVis Gantt Chart


```r
daysToMilliseconds <- function(days){days * 24 * 60 * 60 * 1000}
dat <- data.frame(taskID = c("PS", "EDA", "R", "ML", "DP"),
                 taskName = c("Identify Problem Statement", "EDA Analysis", "Research",
                              "Machine Learning Modelling", "Data Preprocessing"),
                 resource = c(NA, "write", "write", "complete", "write"),
                 start = c(as.Date("2022-10-01"), NA, as.Date("2022-10-02"), as.Date("2022-10-08"), NA),
                 end = as.Date(c("2022-10-04", "2022-10-08", "2022-10-08",
                                 "2022-10-13", "2022-10-05")),
                 duration = c(NA, daysToMilliseconds(c(3, 1, 1, 1))),
                 percentComplete = c(100, 25, 20, 0, 100),
                 dependencies = c(NA, "PS, DP", NA,
                 "EDA", "PS"))

Gantt_Tasks <- gvisGantt(dat, taskID = "taskID",taskName = "taskName",resource = "resource",
                         start = "start",end = "end",duration = "duration",percentComplete = "percentComplete",
                         dependencies = "dependencies",
                         options = list(height = 300,
                         gantt = "{criticalPathEnabled:true,innerGridHorizLine: {
                         stroke: '#e3f4ff',strokeWidth: 2},innerGridTrack: {fill: '#e8f3fa'},innerGridDarkTrack:
                         {fill: '#c7e9ff'},labelStyle: {fontName: 'sans-serif',fontSize: 16}}"))

plot(Gantt_Tasks)
```

<!-- Gantt generated in R 4.2.2 by googleVis 0.7.0 package -->
<!-- Sun Nov 13 17:55:30 2022 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataGanttID2c3bc5240eb () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
"PS",
"Identify Problem Statement",
null,
new Date(2022,9,1),
new Date(2022,9,4),
null,
100,
null
],
[
"EDA",
"EDA Analysis",
"write",
null,
new Date(2022,9,8),
259200000,
25,
"PS, DP"
],
[
"R",
"Research",
"write",
new Date(2022,9,2),
new Date(2022,9,8),
86400000,
20,
null
],
[
"ML",
"Machine Learning Modelling",
"complete",
new Date(2022,9,8),
new Date(2022,9,13),
86400000,
0,
"EDA"
],
[
"DP",
"Data Preprocessing",
"write",
null,
new Date(2022,9,5),
86400000,
100,
"PS"
] 
];
data.addColumn('string','taskID');
data.addColumn('string','taskName');
data.addColumn('string','resource');
data.addColumn('date','start');
data.addColumn('date','end');
data.addColumn('number','duration');
data.addColumn('number','percentComplete');
data.addColumn('string','dependencies');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartGanttID2c3bc5240eb() {
var data = gvisDataGanttID2c3bc5240eb();
var options = {};
options["width"] = 600;
options["height"] = 300;
options["gantt"] = {criticalPathEnabled:true,innerGridHorizLine: {
                         stroke: '#e3f4ff',strokeWidth: 2},innerGridTrack: {fill: '#e8f3fa'},innerGridDarkTrack:
                         {fill: '#c7e9ff'},labelStyle: {fontName: 'sans-serif',fontSize: 16}};

    var chart = new google.visualization.Gantt(
    document.getElementById('GanttID2c3bc5240eb')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "gantt";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartGanttID2c3bc5240eb);
})();
function displayChartGanttID2c3bc5240eb() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartGanttID2c3bc5240eb"></script>
 
<!-- divChart -->
  
<div id="GanttID2c3bc5240eb" 
  style="width: 600; height: 300;">
</div>

`googleVis` Gantt charts would help teams to plan work around deadlines and allocate resources efficiently. 

Project planners also leverage Gantt charts to maintain a bird's eye high level view of projects and track them. These depict the relationship between the start and end dates of tasks, milestones, and dependent tasks for each of them over the entire timeline of the project. This Gantt chart illustrates the breakdown of a project into its component tasks very effectively.


### googleVis Merging Charts


```r
Geographic <- gvisGeoChart(Exports,
                           locationvar="Country",colorvar="Profit",
                           options=list(width=400, height=200))

Tabular <- gvisTable(Exports,
                     options=list(width=400, height=400))

Merged_Charts <- gvisMerge(Geographic, Tabular, horizontal=FALSE, tableOptions="bgcolor=\"#7cdeb5\"")

plot(Merged_Charts)
```

<!-- GeoChart generated in R 4.2.2 by googleVis 0.7.0 package -->
<!-- Sun Nov 13 17:55:31 2022 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataGeoChartID2c3b1b91787d () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
"Germany",
3
],
[
"Brazil",
4
],
[
"United States",
5
],
[
"France",
4
],
[
"Hungary",
3
],
[
"India",
2
],
[
"Iceland",
1
],
[
"Norway",
4
],
[
"Spain",
5
],
[
"Turkey",
1
] 
];
data.addColumn('string','Country');
data.addColumn('number','Profit');
data.addRows(datajson);
return(data);
}


// jsData 
function gvisDataTableID2c3b262c0c69 () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
"Germany",
3,
true
],
[
"Brazil",
4,
false
],
[
"United States",
5,
true
],
[
"France",
4,
true
],
[
"Hungary",
3,
false
],
[
"India",
2,
true
],
[
"Iceland",
1,
false
],
[
"Norway",
4,
true
],
[
"Spain",
5,
true
],
[
"Turkey",
1,
false
] 
];
data.addColumn('string','Country');
data.addColumn('number','Profit');
data.addColumn('boolean','Online');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartGeoChartID2c3b1b91787d() {
var data = gvisDataGeoChartID2c3b1b91787d();
var options = {};
options["width"] = 400;
options["height"] = 200;

    var chart = new google.visualization.GeoChart(
    document.getElementById('GeoChartID2c3b1b91787d')
    );
    chart.draw(data,options);
    

}
  


// jsDrawChart
function drawChartTableID2c3b262c0c69() {
var data = gvisDataTableID2c3b262c0c69();
var options = {};
options["allowHtml"] = true;
options["width"] = 400;
options["height"] = 400;

    var chart = new google.visualization.Table(
    document.getElementById('TableID2c3b262c0c69')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "geochart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartGeoChartID2c3b1b91787d);
})();
function displayChartGeoChartID2c3b1b91787d() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}


// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "table";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartTableID2c3b262c0c69);
})();
function displayChartTableID2c3b262c0c69() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartGeoChartID2c3b1b91787d"></script>


<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartTableID2c3b262c0c69"></script>
 
<table bgcolor="#7cdeb5">
<tr>
<td>

<!-- divChart -->
  
<div id="GeoChartID2c3b1b91787d" 
  style="width: 400; height: 200;">
</div>

</td>
</tr>
<tr>
<td>

<!-- divChart -->
  
<div id="TableID2c3b262c0c69" 
  style="width: 400; height: 400;">
</div>

</td>
</tr>
</table>

`googleVis` Merge chart provides the flexibility of merging two gvis-objects, either next or below each other into one gvis-object. These objects are arranged in a HTML table format.

The multiples charts view allows to split up the individual charts Bar, Column, Line or Geographic, Tabular etc. charts into multiple charts, separated. There are numerous use cases like showing your product sales per region and then providing more information about it. It gives a lot of flexibility in the report creation and delivery aesthetically.


## Use googleVis in RStudio

Using googleVis in RStudio is straightforward. By default, the RStudio renders the charts in a new webpage -

```
plot(Chart)
```
On the other hand, to view it within RStudio,
> To View in RStudio Viewer just use to view it locally

```
plot(Chart, browser=rstudioapi::viewer)
```

> To Knit the Rmd Markdown file to HTML, to perform the following command set the Chunk option results to `asis` with `{r ChartExample, results='asis', tidy=FALSE}` and `plot(Chart, 'chart')`

### googleVis References

* [Documentation](https://mages.github.io/googleVis/)
* [Google Charts](https://developers.google.com/chart/interactive/docs/quick_start)
* [Demo](https://cran.r-project.org/web/packages/googleVis/vignettes/googleVis_examples.html)
* [Paper](https://journal.r-project.org/archive/2011-2/RJournal_2011-2_Gesmann+de~Castillo.pdf)
* [CRAN-Stable Version](https://cran.r-project.org/web/packages/googleVis/index.html)

> Thank you for learning `googleVis` with us !
