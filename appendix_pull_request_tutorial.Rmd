# Tutorial for pull request mergers

## General

The following is a checklist of steps to perform before merging the pull request. At any point, if you're not sure what to do, request a review from one of the PR leaders.

## Check branch

PR should be submitted from a **non-main** branch.

<img src="resources/tutorial_pull_request_mergers/1.png" width="700">
<br/>

If PR was submitted from the **main** branch, provide these instructions on how to fix the problem:

1. Close this PR.

2. Follow the instructions here for forgetting to branch if you committed and pushed to GitHub: https://edav.info/github#fixing-mistakes

3. If you have trouble with 2., then delete the local folder of the project, delete your fork on GitHub, and *start over.*

4. Open a new PR.

<br/>
<img src="resources/tutorial_pull_request_mergers/2.png" width="700">



<br/>

##  Examine files that were added or modified
<img src="resources/tutorial_pull_request_mergers/files_changed.png" width="700">
<br/><br/>

- There should be only ONE `.Rmd` file. 

- All of the additional resources should be in the `resources/<project_name>/` folder.

- There should be no other files in the root directory besides the `.Rmd` file.

## Check `.Rmd` filename

- The `.Rmd` filename should be words only and joined with underscores, no white space. (Update: It does not need to be the same as the branch name.)
- The `.Rmd` filename can only contain **lowercase letters**. (Otherwise the filenames do not sort nicely on the repo home page.)

## Check `.Rmd` file contents

- The file should **not** contain a YAML header nor a `---` line.
- The second line should be blank, followed by the author name(s).
- The first line should start with a **single hashtag `#`**, followed by a **single whitespace**, and then the title.
- There should be no additional single hashtag headers in the chapter. (If there are, new chapters will be created.)
- Other hashtag headers should **not** be followed by numbers since the hashtags will create numbered subheadings. Correct: `## Subheading`. Incorrect: `## 3. Subheading`.
- If the file contains a setup chunk in `.Rmd` file, it should **not** contain a `setup` label. (The bookdown render will fail if there are duplicate chunk labels.)
<br/>i.e. use `{r, include=FALSE}` instead of `{r setup, include=FALSE}`.
<br/>[See sample `.Rmd`](https://github.com/jtr13/cc21/blob/main/sample_project.Rmd)
- Links to internal files must contain `resources/<project_name>/` in the path, such as: `![Test Photo](resources/sample_project/election.jpg)`
- The file should not contain any `install.packages()`, `write` functions, `setwd()`, or `getwd()`. 
- If there's anything else that looks odd but you're not sure, assign `jtr13` to review and explain the issue.


## Request changes 

If there are problems with any of the checks listed above, explain why the pull request cannot be merged and request changes by following these steps:

<img src="resources/tutorial_pull_request_mergers/check_format.png" width="700">
<img src="resources/tutorial_pull_request_mergers/request_change_lines.png" width="700">
<img src="resources/tutorial_pull_request_mergers/request_change_files.png" width="700">
<img src="resources/tutorial_pull_request_mergers/request_change_submit_review.png" width="700">

Then, add a `changes requested` label to this pull request.

Your job for this pull request is done for now. Once contributors fix their requests, review again and either move forward with the merge or explain what changes still need to be made.

<br/> 

## Steps to Merge the PR

Before we click "Merge" there are a few more things to do. 

### Update the branch

If an "Update Branch" is visible toward the end on the Conversation tab of the pull request, click on it. This will ensure that we are working with the most up-to-date versions of `_bookdown.yml` and `DESCRIPTION`.

Next we will make changes to these files on the contributor's branch.

### Add the filename of the chapter to `_bookdown.yml`

- Go to "Files Changed" and copy the filename of the `.Rmd` file.

<!-- - Open the branch of the submitted PR and open their _bookdown.yml file. -->
- Open the branch of the submitted PR by following these steps:

  + To access the PR branch:

  <img src="resources/tutorial_pull_request_mergers/3.png" width="700">

  + Make sure you are on the PR branch by checking that the PR branch name is shown (not `main`):

  <img src="resources/tutorial_pull_request_mergers/4.png" width="700">

- Add the name of the new file in single quotes followed by a comma under the labelled section (eg. Cheatsheets, Tutorials etc).

- Save the edited version.

### (Add part names to `.Rmd` for every first article in part)

Only do this if you are adding the first chapter in a PART.

One person should manage this, otherwise it will be hard to keep the project organized. 

For every first article of each part, add the chapter name on the top of the `.Rmd` file, then propose changes. The example is like this.
<img src="resources/tutorial_pull_request_mergers/chap_1.png" width="700">
<br/><br/>

### Add new libraries to `DESCRIPTION`.

- Check the `.Rmd` for libraries needed. If any are missing, add them to the `DESCRIPTION` file on the contributor's branch, in the same manner that we edited the `_bookdown.yml` file.


### Merge the pull request

**If you're not sure that you did things correctly, assign one of the other maintainers or @jtr13 to review before you merge the PR.**

- Return to the PR on the main page of the repo `www.github.com/jtr13/...`

- If necessary resolve merge conflicts by clicking on the resolve merge conflicts button:

<img src="resources/tutorial_pull_request_mergers/resolve_conflicts.png" width="700">

Then delete the lines with `<<<<<<< xxxx`, `=======` and `>>>>>>>> main` and edit the file as desired. Click the "Marked as resolved" button and then the green "Commit merge" button. -->

- Click "Merge pull request" and then "Confirm merge". Add a thank you note perhaps with an emoji such as `:tada:`.

### Check Actions

- After a few minutes, click on the Actions tabs and check whether the build has been successful: a green dot indicates a successful run, a red X indicates a failed run.

- Check the log to figure out what went wrong, and if you can, fix it. If you're not sure what to do, not a problem, just open up an issue linking to the failed run so others can help (this is important so we can fix problems quickly). (Do not click `revert merge`).
