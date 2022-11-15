# Ggplot2 plots in python cheat sheet tutorial

Braden Huffman



## Motivation

In R, ggplot2 is a powerful visualization tool that all data scientists should have knowledge of. Ggplot2 might even be the most useful visualization tool, but in the event that ggplot2 cannot be used, a data scientist needs to be able to visualize the data. I created a cheat sheet that provides documentation and examples to create some of the most popular R graphs according to http://r-statistics.co/Top50-Ggplot2-Visualizations-MasterList-R-Code.html, and what their equivalents are in Python. I also included a couple of other graphs that we discussed in class.

## Table



```r
data %>% 
  kbl(caption = "Cheat sheet", width=10) %>% 
  kable_material_dark(full_width=F, font_size=8)
```

<table class=" lightable-material-dark" style='font-size: 8px; font-family: "Source Sans Pro", helvetica, sans-serif; width: auto !important; margin-left: auto; margin-right: auto;'>
<caption style="font-size: initial !important;">(\#tab:unnamed-chunk-3)Cheat sheet</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Type of Graph </th>
   <th style="text-align:left;"> ggplot2 </th>
   <th style="text-align:left;"> Python </th>
   <th style="text-align:left;"> Python documentation/example </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Scatter Plot </td>
   <td style="text-align:left;"> geom_point </td>
   <td style="text-align:left;"> pyplot.scatter </td>
   <td style="text-align:left;"> https://matplotlib.org/stable/gallery/shapes_and_collections/scatter.html </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bubble Plot </td>
   <td style="text-align:left;"> geom_jitter </td>
   <td style="text-align:left;"> plotly.express.scatter </td>
   <td style="text-align:left;"> https://plotly.com/python/bubble-charts/ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Marginal Histogram </td>
   <td style="text-align:left;"> ggMarginal </td>
   <td style="text-align:left;"> seaborn.jointplot </td>
   <td style="text-align:left;"> https://seaborn.pydata.org/generated/seaborn.jointplot.html </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Correlogram </td>
   <td style="text-align:left;"> ggcorrplot </td>
   <td style="text-align:left;"> seaborn.diverging_palette </td>
   <td style="text-align:left;"> https://seaborn.pydata.org/examples/many_pairwise_correlations.html </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Diverging Bar Chart </td>
   <td style="text-align:left;"> ggbar </td>
   <td style="text-align:left;"> pyplot.hlines </td>
   <td style="text-align:left;"> https://www.geeksforgeeks.org/diverging-bar-chart-using-python/ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Diverging Dot Plot </td>
   <td style="text-align:left;"> geom_point </td>
   <td style="text-align:left;"> pyplot.scatter </td>
   <td style="text-align:left;"> https://www.machinelearningplus.com/plots/top-50-matplotlib-visualizations-the-master-plots-python/#12.-Diverging-Dot-Plot </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Area Plot </td>
   <td style="text-align:left;"> geom_area </td>
   <td style="text-align:left;"> pyplot.fill_between </td>
   <td style="text-align:left;"> https://www.python-graph-gallery.com/area-plot/ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bar Graph </td>
   <td style="text-align:left;"> geom_bar </td>
   <td style="text-align:left;"> pyplot.bar </td>
   <td style="text-align:left;"> https://matplotlib.org/stable/api/_as_gen/matplotlib.pyplot.bar.html </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Lolipop Chart </td>
   <td style="text-align:left;"> geom_point + geom_segment </td>
   <td style="text-align:left;"> pyplot.stem </td>
   <td style="text-align:left;"> https://matplotlib.org/stable/api/_as_gen/matplotlib.pyplot.stem.html </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dot Plot </td>
   <td style="text-align:left;"> geom_point </td>
   <td style="text-align:left;"> plotly.express.scatter </td>
   <td style="text-align:left;"> https://lifewithdata.com/2022/02/28/how-to-create-a-dot-plot-in-plotly-python/ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Slope Chart </td>
   <td style="text-align:left;"> geom_vline </td>
   <td style="text-align:left;"> plt.plot </td>
   <td style="text-align:left;"> https://towardsdatascience.com/slope-charts-with-pythons-matplotlib-2c3456c137b8 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dumbbell Plot </td>
   <td style="text-align:left;"> geom_dumbbell </td>
   <td style="text-align:left;"> plotly.express.scatter + fig.add_shape </td>
   <td style="text-align:left;"> https://medium.com/@ginoasuncion/creating-a-dumbbell-plot-with-plotly-python-570ff768ff7e </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Histogram </td>
   <td style="text-align:left;"> geom_histogram </td>
   <td style="text-align:left;"> pyplot.hist </td>
   <td style="text-align:left;"> https://matplotlib.org/stable/gallery/statistics/hist.html </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Density Plot </td>
   <td style="text-align:left;"> geom_density </td>
   <td style="text-align:left;"> seaborn.displot(kind="kde") </td>
   <td style="text-align:left;"> https://seaborn.pydata.org/tutorial/distributions.html#kernel-density-estimation </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Boxplot </td>
   <td style="text-align:left;"> geom_boxplot </td>
   <td style="text-align:left;"> pyplot.boxplot </td>
   <td style="text-align:left;"> https://matplotlib.org/stable/api/_as_gen/matplotlib.pyplot.boxplot.html </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Violin Plot </td>
   <td style="text-align:left;"> geom_violin </td>
   <td style="text-align:left;"> seaborn.violinplot </td>
   <td style="text-align:left;"> https://seaborn.pydata.org/generated/seaborn.violinplot.html </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Waffle Chart </td>
   <td style="text-align:left;"> geom_tile </td>
   <td style="text-align:left;"> pyplot.figure(FigureClass=Waffle) </td>
   <td style="text-align:left;"> https://github.com/gyli/PyWaffle </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Pie Chart </td>
   <td style="text-align:left;"> geom_bar + coord_polar </td>
   <td style="text-align:left;"> pyplot.pie </td>
   <td style="text-align:left;"> https://matplotlib.org/stable/gallery/pie_and_polar_charts/pie_features.html </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Treemap </td>
   <td style="text-align:left;"> treemapify + ggplotify </td>
   <td style="text-align:left;"> squarify.plot </td>
   <td style="text-align:left;"> https://www.python-graph-gallery.com/treemap/ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Categorywise Bar Chart </td>
   <td style="text-align:left;"> geom_bar </td>
   <td style="text-align:left;"> pyplot.bar </td>
   <td style="text-align:left;"> https://www.geeksforgeeks.org/bar-plot-in-matplotlib/ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Line graph </td>
   <td style="text-align:left;"> geom_line </td>
   <td style="text-align:left;"> pyplot.plot </td>
   <td style="text-align:left;"> https://matplotlib.org/stable/api/_as_gen/matplotlib.pyplot.plot.html </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Time Series Calendar Heatmap </td>
   <td style="text-align:left;"> geom_tile </td>
   <td style="text-align:left;"> calmap.yearplot </td>
   <td style="text-align:left;"> https://pythonhosted.org/calmap/ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Hierarchical Dendrogram </td>
   <td style="text-align:left;"> ggdendrogram </td>
   <td style="text-align:left;"> scipy.cluster.hierarchy.dendrogram </td>
   <td style="text-align:left;"> https://docs.scipy.org/doc/scipy/reference/generated/scipy.cluster.hierarchy.dendrogram.html </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Ridgeline Plot </td>
   <td style="text-align:left;"> geom_density_ridges2 </td>
   <td style="text-align:left;"> seaborn.FacetGrid.map(seaborn.kdeplot) </td>
   <td style="text-align:left;"> https://seaborn.pydata.org/examples/kde_ridgeplot </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Alluvium Graph </td>
   <td style="text-align:left;"> geom_alluvium </td>
   <td style="text-align:left;"> plotly.graphical_objects.Figure(data=[go.Sankey(…)]) </td>
   <td style="text-align:left;"> https://plotly.com/python/sankey-diagram/ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Radar Chart </td>
   <td style="text-align:left;"> ggradar </td>
   <td style="text-align:left;"> plotly.express.line_polar </td>
   <td style="text-align:left;"> https://plotly.com/python/radar-chart/ </td>
  </tr>
</tbody>
</table>
## Example

Consider the following time series data:

x: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

y: 5, 4, 7, 6, 6, 19, 20, 15, 10, 8

Imagine for a moment that your boss instructed you to create an Area Plot of the above data. You know how to do this easily. In fact, you can do it in five lines of code.


```r
x <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
y <- c(5, 4, 7, 6, 6, 19, 20, 15, 10, 8)
df <- data.frame(x,y)

ggplot(data = df) +
  geom_area(mapping=aes(x,y))
```

<img src="ggplot2_to_python_files/figure-html/unnamed-chunk-4-1.png" width="80%" style="display: block; margin: auto;" />

You smile for a moment, knowing that you will actually be home for dinner with the family today. You keep smiling until he utters the words, "in Python." While area plots are a fairly popular type of graph, you realize that you don't even know if python has a way to create an area chart, so you decide to consult the above cheat sheet.

The cheat sheet takes you to the following website https://www.python-graph-gallery.com/area-plot/. Fortune shine's down on you today. Creating an Area Plot in Python isn't as hard as you had thought it would have been.

https://colab.research.google.com/drive/1DxD5UZolQxcphI44kvK8w4YR-RkZNYgc#scrollTo=UdOui0Fhk24e.

You show your boss the graph linked in the above iPython notebook, and while he isn't impressed with your artistic ability, he is impressed by your speed.

Clearly Area Plots aren't the worlds hardest graphs to create, and many of the graphs in the table are more difficult to find and create in Python. I hope this tutorial and cheat sheet make it easier to start creating your favorite ggplot2 graphs in Python.
