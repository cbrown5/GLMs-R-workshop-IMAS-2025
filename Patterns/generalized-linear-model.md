NOTE TO USER: MAKE A NEW DOCUMENT stepwise-model-selection.qmd THEN PASTE THIS INTO THAT DOCUMENT AND RUN AGENT MODE ON THAT DOCUMENT. 

# Choosing a generalized linear model with R

You will help the user complete a quarto document that works through building a generalized linear model in the R program. This will be an interative conversation that you will work through together with the user. 

YOU WILL STOP at designated checkpoints. At each checkpoint you will make a decision in consultation with the user. 

At each checkpoint you should stop, provide relevant figures or tables then ask the user a question so you can jointly make a decision about the next step. 

At each checkpoint that requires new R code run 
`quarto render doc.qmd`
then 
`open doc.html`

So the user can see the results and make a decision at each checkpoint. 

If the user identifieds errors in your interpretation at any point: ask the user to stop the conversation, update their meta-data and model description and begin a new thread from scratch. 

## Tech context 

We will use the R program with the `glm` function and `MASS::glm.nb` if a negative binomial is required.  

## Data 

Use this data: 
`dat <- read_csv("Data/ZooBiomass.csv")`

Marine zooplankton biomass study comparing mining impact sites with 6 variables and 200 observations. The variables are: 
- **Region** (categorical): Impact assessment (Mine vs Reference sites)
- **Zone** (categorical): Distance from shore (Inshore vs Offshore)  
- **TimeOfDay** (categorical): Sampling time (Day vs Night)
- **Depth** (numeric): Sampling depth in meters
- **Temperature** (numeric): Water temperature in degrees Celsius
- **Biomass** (numeric): Zooplankton biomass measurement (likely mg/m³ or similar units)

## Steps  

### Step 1: Examine data 

Read the data file in. Print a summary of the data fields. Include in the summary of each variable: 
- Variable `class()`
- The type of values
    - Continuous
    - Continuous greater than 0
    - Continuous greater than or equal to 0 
    - Categorial, two factors
    - Categorical, multiple factors
    - Positive integers greater than or equal to 0 
    - Binary 0/1 outcome
- Quantiles, if numeric value
- Frequency of values, if categorical

**CHECKPOINT 1** Confirm with the user that you have properly interpreted the data. 

### Step 2: Build model formula

**CHECKPOINT 2** Create a model with the user. 

- Ask the user to confirm their response variable. 
- Ask the user to confirm their predictor variables. Suggest that the user start with a full model with all **relevant** predictor variables. This may be a subset of all variables in the data frame. 
- Ask the user to justify the inclusion of each variable on theoretical grounds or a-priori understanding. 
- Suggest a formula for the full model and ask the user if they want to make any modifications


### Step 3: Choose a model family

Think carefully about the data type of the response variable. Consider what model family will be most suitable for the response variable. Document your reasoning for the user. 

**Default choices:** 
Continuous data positive and negative values: gaussian
Continuous values >0: gamma
Positive integers: negative binomial
Binary: binomial
Counts out of a maximum number per sample: binomial

**Proportional data:** 
Proportions or percents: Ask the user if their data can be interpreted as binomial. Often proportional data is measured as counts out of a total. If this is the case, suggest they provide the raw data and use a binomial family. 

**Special cases outside the scope of this analysis** 
If the response variable falls under the below cases, this GLM falls outside the scope of this conversation: 
True proportional data
Continuous positive values including 0
Time of day or circular response variables
Ordered or unordered categorical responses. 

**CHECKPOINT 3** 
if (choice in defaults){
    Provide suggestion to user and discuss reasoning for the choice
} else if (choice in Proportional data){
    Discuss option of modelling data with a binomial
} else if (choice in special cases){
    Inform the user that their response variable is beyond the scope of a simple glm. Suggest some follow-up reading and R packages they could investigate. 
}

### Step 4: Fit the model and check diagnostics 

Fit the model with the appropriate family. Produce diagnostic plots using the `DHARMa` package. Use these functions:

`testDispersion`
`simulateResiduals(fittedModel = m1, plot = TRUE)`

Run `vignette("DHARMa")` to provide the user more information on assessing diagnostics. 

**CHECKPOINT 4** 
Print results of diagnostics to the qmd, including figures. Render the qmd. Discuss the results with the user. Suggest next steps. 