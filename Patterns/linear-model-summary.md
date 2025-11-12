# Write-up results of a linear regression model


#file:linear-model.R contains my linear regression model. Create a qmd document in `quarto-docs/` that has a nicely formatted summary table (use kable package). 
Create another version of this model in a qmd document. 

Then use `marginaleffects` package to plot predicted biomass against depth. 

In the qmd, write an explanation for statistical dummies of what the table shows. Then interpret the results for me. Include in the summary document the model verification plots. Include an interpretation of the verification plots. 

Suggest improvements to the model fitting. Consider  if there is non-normality or heterogeneity of variance in residuals. If there is, weight the pros and cons of: 
- response variable transformations
- use a glm() with appropriate family. 

Consider if there are any high leverage points (outliers). If there are high leverage points suggest sensitivty analyses to see how they affect conclusions. 

Think step-by-step and review provide a reflection on each of your suggestions. 

Once the qmd is complete, render it to check that there are no errors. Fix any errors you find. 