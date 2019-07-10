## How does this repo work?

The course repository works with two components: Gatsby (front-end), and Binder (back-end). We'll go over both of these to understand how it works as a whole.

## What is Gatsby?

[Gatsby](https://www.gatsbyjs.org/) is a JavaScript/react.js based web page building framework, like Hugo, or Jekyll. The nice thing about it being JavaScript is that JavaScript widgets that you build are tightly integrated.

You can think of Gatsby as being the client side of the lesson framework. All code, solutions, tests, and chapter.md files are handled by Gatsby.

## What is Binder?

[Binder](https://gke.mybinder.org/) is a way of building Docker containers from repositories that can be launched on a remote server/cluster (such as mybinder.org). This Docker container can be based on a Dockerfile, or R image. The thing about Binder is that the containers are ephemeral - if they're not used, they're deleted off the Binder servers. The main applications of Binder are:

1) Reproducible Research (shareable notebooks) and
2) Education (shareable notebooks)

You can think of Binder as being the server side of the lesson framework. It needs the instructions on how to build the docker container (which is in the `binder/` folder), and the data you want to use for the lessons (in the `data/` folder).

The only thing you need to get started with R and Binder is a repo that has a `runtime.txt` file, or a Dockerfile. The rest, such as datafiles, are optional, but are usually contained in a Binder repository.

## How does Gatsby work with Binder?

![code-execution](https://user-images.githubusercontent.com/3315629/60834090-b49d5980-a174-11e9-9d69-966084ba97b9.png)

Ines was super clever and designed a JavaScript plugin for Gatsby called [Juniper](https://github.com/ines/juniper) to handle communication to and from the Binder container using Jupyter kernels. That's how code gets executed on the Binder container, and how code output (such as terminal messages, images, etc) are received from the Binder container.

## Branches of this repo

![Course-repo](https://user-images.githubusercontent.com/3315629/60834054-a18a8980-a174-11e9-930d-c61df5faba7b.png)

There are two branches of this repo, which are used for different tasks:

- **master** - this is what the course is served out of via netlify: http://r-bootcamp.netlify.com - any changes to exercises in this branch will show up on the netlify page. The netlify page uses a JavaScript framework called Gatsby to build the pages. Gatsby submits code to binder and receives the output. It also handles the code checking. The parts of the repo that are handled by Gatsby include:

1. exercises/solutions/tests
2. chapter.md files
3. slides (using reveal.js)

- **binder** - this is what the Binder image is built from. The reason they're different is that binder forces a Docker container rebuild when a branch is updated. So, if we served our container out of master, it would rebuild everytime we modified a `chapter.md` or an exercise.  If you need to add packages, you will add them to the `binder/install.R` for this branch, and if you need to add datasets, you can add them to the `data/` folder. The parts of the repo handled by Binder include:

1. datasets in data/ folder (the container needs access to these to load data from submitted code)
2. installation instructions in the binder/ folder for installing dependencies

I would say that the easiest thing to do is to occasionally merge `master` into `binder` when you need to update the data:

Note that rebuilding the binder container can take a little bit of time (usually on the order of 5 or 10 minutes or so), since it is installing/compiling `tidyverse` for the container. You can always check the build status of the container by clicking the badge below and looking at the log.

You can view the binder container here: [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/ines/course-starter-r/binder) or at: https://mybinder.org/v2/gh/ines/course-starter-r/binder
 - you can launch an Rstudio instance to test the container by using the "new" tab in the top right corner, and selecting 'Rstudio'. This is super helpful if you want to test if code will work in the binder container.

## Adding Packages

If you need to add packages, add the appropriate `install.packages()` statement into `binder/install.R`. When you do, check that the container was built properly by clicking the binder link above. 

Currently, `tidyverse` is installed in the binder container.

## `data/` folder

If you want to access datasets in the data folder, you can always refer to this folder as `data/`. For example, to use `data/pets.csv`:

```
pets <- read.csv("data/pets.csv")
```

Remember, if you need to add a dataset to the repo, it needs to be done in the `binder` branch into the `data/` folder.


## Using `decampr` to transfer your DataCamp repository

If you would like to transfer your courses from DataCamp, there is a package made for that: [`decampr`](http://github.com/laderast/decampr). It will scan your repository and attempt to extract exercise instructions, quizzes, exercise code, and solutions and write them to the appropriate directory for your project. For more info, please check out the `decampr` repo: http://github.com/laderast/decampr