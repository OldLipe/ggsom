# On load
.onAttach <- function(lib, pkg){
  packageStartupMessage("ggsom")
  packageStartupMessage(
    sprintf("Loaded ggsom v%s.
        See ?ggsom for help, citation(\"ggsom\") for use in publication.",
            utils::packageDescription("ggsom")$Version) )
}

# Include the following global variables in the sits package
utils::globalVariables(c(".", "%>%", ":=", "feature", "values", ".N", "x",
                         "y", "unit.class", "cluster", "x_n", "y_n",
                         "x_e", "y_e", "a", "classe", "valores", "soma",
                         "ggsom_gathered", "model_som", "id"))

