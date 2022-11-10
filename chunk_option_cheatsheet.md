# (PART) Cheatsheets

# Rmd chunk option cheat sheet 

Yunchen Jiang

Motivation and Contribution

As a graduate student with an undergraduate degree in actuarial mathematics, this course was almost my first exposure to Rstudio. When I received the Pset, the very first thing that confused me was the code chunk in r markdown. So for this project, I will contribute to making a condensed cheat sheet for the commonly used chunk options to refine my understanding of rmd files while simultaneously help r beginners who are in a similar situation as me. 


Cheat sheet

Chunk options are written in chunk headers and in the form tag=value like this: 
{r my-chunk, echo=FALSE, fig.height=4, dev='jpeg'}
...

A special chunk option is the chunk label (e.g., my-chunk in the above example). Only the chunk label does not need a tag. If you prefer the form tag=value, you could also use the chunk option label explicitly: 
{r, label='my-chunk', echo=FALSE, fig.height=4, dev='jpeg'}
...

You can also write chunk options in the body of a code chunk after #| like this:
{r}
 #| my-chunk, echo = FALSE, 
 #| fig.height=4, dev='jpeg'
...
 
For this syntax, chunk options must be written on continuous lines at the beginning of the chunk body. You can break the options onto as many lines as you wish but all lines must start with the special comment prefix #|

You can also use the YAML syntax to write options inside a chunk in the form tag: value. Normally you have to provide only one option per line like this:
{r}
 #| echo: false
 #| fig.width: 4
 #| dev: 'jpeg'
...

The chunk label for each chunk is assumed to be unique within the document. This is especially important for cache and plot filenames, because these filenames are based on chunk labels. 


Below is a list of commonly used chunk options in knitr documented in the format “option: (default value; type of value)“.

Code evaluation:

eval: (TRUE; logical or numeric) Whether to evaluate the code chunk. It can also be a numeric vector to choose which R expression(s) to evaluate. 
e.g., eval = c(1, 3, 4) will evaluate the first, third, and fourth expressions, and eval = -(4:5) will evaluate all expressions except the fourth and fifth.

Text output:

echo: (TRUE; logical or numeric) Whether to display the source code in the output document. Besides TRUE/FALSE, which shows/hides the source code, we can also use a numeric vector to choose which R expression(s) to echo in a chunk.
e.g., echo = 2:3 means to echo only the 2nd and 3rd expressions, and echo = -4 means to exclude the 4th expression.

results:  ('markup') Mark up text output with the appropriate environments depending on the output format. For example, for R Markdown, if the text output is a character string "[1] 1 2 3", the actual output that knitr produces will be:
```
[1] 1 2 3
```
In this case, results='markup' means to put the text output in fenced code blocks.

warning: (TRUE; logical) Whether to preserve warnings (produced by warning()) in the output. If FALSE, all warnings will be printed in the console instead of the output document:
{r}
   withCallingHandlers(
        expr    = as.numeric(c("1", "A")), 
        warning = function(w) warn <<- paste("** warning:", w$message, "**\n\n")
   )
Warning: NAs introduced by coercion[1]  1 NA

{r, warning = false}
   withCallingHandlers(
        expr    = as.numeric(c("1", "A")), 
        warning = function(w) warn <<- paste("** warning:", w$message, "**\n\n")
   )
[1]  1 NA

It can also take numeric values as indices to select a subset of warnings to include in the output. Note that these values reference the indices of the warnings themselves (e.g., 3 means “the third warning thrown from this chunk”) and not the indices of which expressions are allowed to emit warnings.

error: (True; logical) Whether to preserve errors (from stop()). By default, errors in the code chunks of an Rmd document will halt R. If you want to show the errors without stopping R, you may use the chunk option error = TRUE:
{r,error = TRUE}
1 + "a"
You will see the error message in the output document after you compile the Rmd document: Error in 1 + "a": non-numeric argument to binary operator. In R Markdown, error = FALSE is the default, which means R should stop on error when running the code chunks.

include: (TRUE; logical) Whether to include the chunk output in the output document. If FALSE, nothing will be written into the output document, but the code is still evaluated and plot files are generated if there are any plots in the chunk, so you can manually insert figures later.

Code decoration:

comment: ('##'; character) The prefix to be added before each line of the text output. By default, the text output is commented out by ##, so if readers want to copy and run the source code from the output document, they can select and copy everything from the chunk, since the text output is masked in comments (and will be ignored when running the copied text). Set comment = '' remove the default ##.

prompt: (FALSE; logical) Whether to add the prompt characters in the R code. If TRUE, knitr will add > to the start of each line of code displayed in the final document. Note that adding prompts can make it difficult for readers to copy R code from the output, so prompt = FALSE may be a better choice.

highlight: (TRUE) Whether to syntax highlight the source code.

Cache:

cache: (FALSE; logical) Whether to cache a code chunk. When caching is turned on via the chunk option cache = TRUE, knitr will write R objects generated in a code chunk to a cache database, so they can be reloaded the next time. When evaluating code chunks for the second time, the cached chunks are skipped (unless they have been modified), but the objects created in these chunks are loaded from previously saved databases (.rdb and .rdx files), and these files are saved when a chunk is evaluated for the first time, or when cached files are not found (e.g., you may have removed them by hand). 

cache.path: ('cache/'; character) A prefix to be used to generate the paths of cache files. For R Markdown, the default value is based on the input filename, e.g., the cache paths for the chunk with the label FOO in the file INPUT.Rmd will be of the form INPUT_cache/FOO_*.*.

cache.lazy: (TRUE; logical) Whether to lazyLoad() or directly load() objects. For very large objects, lazyloading may not work, so cache.lazy = FALSE may be desirable

dependson: (NULL; character or numeric) A character vector of chunk labels to specify which other chunks this chunk depends on. This option applies to cached chunks only—sometimes the objects in a cached chunk may depend on other cached chunks, so when other chunks are changed, this chunk must be updated accordingly. If dependson is a numeric vector, it means the indices of chunk labels, e.g., dependson = 1 means this chunk depends on the first chunk in the document, and dependson = c(-1, -2) means it depends on the previous two chunks (negative indices stand for numbers of chunks before this chunk, and note they are always relative to the current chunk).

Plots:

fig.width, fig.height: (both are 7; numeric) Width and height of the plot (in inches), to be used in the graphics device.

fig.ext: (NULL; character) File extension of the figure output. If NULL, it will be derived from the graphical device; see knitr:::auto_exts for details.

fig.asp: (NULL; numeric) The aspect ratio of the plot, i.e., the ratio of height/width. When fig.asp is specified, the height of a plot (the chunk option fig.height) is calculated from fig.width * fig.asp.

fig.dim: (NULL; numeric) A numeric vector of length 2 to provide fig.width and fig.height, e.g., fig.dim = c(5, 7) is a shorthand of fig.width = 5, fig.height = 7. If both fig.asp and fig.dim are provided, fig.asp will be ignored (with a warning).

fig.align: ('default'; character) Alignment of figures in the output document. Possible values are default, left, right, and center. The default is not to make any alignment adjustments.

fig.path: ('figure/'; character) A prefix to be used to generate figure file paths. fig.path and chunk labels are concatenated to generate the full paths. It may contain a directory like figure/prefix-; the directory will be created if it does not exist.

fig.show: ('asis'; character) How to show/arrange the plots. Possible values are as follows:

asis: If 'hide', knitr will generate the plots created in the chunk, but not include them in the final document. If 'hold', knitr will delay displaying the plots created by the chunk until the end of the chunk. If 'animate', knitr will combine all of the plots created by the chunk into an animation.
