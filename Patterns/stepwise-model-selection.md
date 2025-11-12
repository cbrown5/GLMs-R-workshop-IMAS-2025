NOTE TO USER: MAKE A NEW DOCUMENT stepwise-model-selection.qmd THEN PASTE THIS INTO THAT DOCUMENT AND RUN AGENT MODE ON THAT DOCUMENT. 

# Backwards stepswise model simplification with F ratios

I want you to template and help me complete a quarto document with a stepwise model selection. We will write this document interactively bit by bit. YOU WILL STOP at check points I designate. We will make a decision at each checkpoint then you can proceed with the analysis. 

At each checkpoint you should output tables and figures so we can make a decision. 

At each checkpoint run 
`quarto render stepwise-model-selection.qmd`
then 
`open stepwise-model-selection.html`

So I can see the results and make a decision at each checkpoint. 

## Data and modelling approach

Use this data: 
`dat <- read_csv("Data/ZooBiomass.csv")`

Start with this model 
`log10(Biomass) ~ Depth * Zone * Region`

Fit it with `lm()` function. 

## Steps 

### Step 1 

Fit the full model 

Check model diagnostics. Consider if there is non-normality or heterogeneity of variance in residuals. If there is, weight the pros and cons of: 
- response variable transformations
- use a glm() with appropriate family. 

**CHECKPOINT 1** Confirm model diagnostics and final model structure. 

### Step 2 

Begin backwards stepwise model simplification. Start by testing the 3-way interaction. 

**CHECKPOINT 2** Confirm whether we remove or keep the 3-way interaction. 

### for (n in Steps 3:N)

Continue backwards stepwise model simplification, confirm each term removal with me before we proceed.
Continue until no terms can be removed. 

**CHECKPOINT n** Confirm whether we remove or keep the term under consideration. 

### Step N + 1

Repeat model diagnostics tests

### Step N + 2

Create predictive plots using `marginaleffects` package. 