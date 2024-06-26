% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_synth_draws.R
\name{.get_synth_draws_predictor_match}
\alias{.get_synth_draws_predictor_match}
\title{Get Synthetic Draws in Tidy Format for Single Treated Unit (Predictor Match Model)}
\usage{
.get_synth_draws_predictor_match(fit, pre_data, post_data, time, outcome)
}
\arguments{
\item{fit}{A Stan fit object containing the model results.}

\item{pre_data}{A data frame with outcome data before the intervention.}

\item{post_data}{A data frame with outcome data after the intervention.}

\item{time}{The name of the time period variable (as a string).}

\item{outcome}{The name of the outcome variable (as a string).}
}
\value{
A data frame containing:
\itemize{
\item \code{draw}: The index of the synthetic draw.
\item \code{time}: The time period.
\item \code{y_synth}: The synthetic outcome for the given draw and time period.
\item \code{outcome}: The observed outcome for the given time period.
}
}
\description{
This internal helper function extracts synthetic draws from a Stan fit object
generated by a predictor match model. It combines these draws with observed
outcome data and returns a tidy data frame suitable for analysis or plotting.
It specifically works with variable definitions from the predictor match model.
}
