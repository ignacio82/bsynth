% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_plot_df.R
\name{.get_plot_df2}
\alias{.get_plot_df2}
\title{Prepare Data Frame for Plotting with Multiple Treated Units}
\usage{
.get_plot_df2(y_synth_draws, data, treated_ids, id, time, outcome, ci = 0.75)
}
\arguments{
\item{y_synth_draws}{A data frame containing synthetic outcome draws for each treated unit and time period.}

\item{data}{A data frame with the original data, including outcomes for treated units.}

\item{treated_ids}{A vector of identifiers for the treated units.}

\item{id}{The name of the variable in \code{data} that identifies units (as a string).}

\item{time}{The name of the time period variable (as a string).}

\item{outcome}{The name of the outcome variable (as a string).}

\item{ci}{The width of the credible confidence interval (default: 0.75).}
}
\value{
A data frame containing:
\itemize{
\item \code{time}: The time period.
\item \code{id}: The unit identifier (including "Average" for the average treatment effect).
\item \code{outcome}: The observed outcome (for treated units).
\item \code{y_synth}: The mean synthetic outcome (for treated units and the average).
\item \code{LB}: The lower bound of the confidence interval for the synthetic outcome.
\item \code{UB}: The upper bound of the confidence interval for the synthetic outcome.
\item \code{tau}: The treatment effect (difference between observed and synthetic outcomes).
\item \code{tau_LB}: The lower bound of the confidence interval for the treatment effect.
\item \code{tau_UB}: The upper bound of the confidence interval for the treatment effect.
}
}
\description{
This function processes data for multiple treated units, calculating synthetic outcomes,
confidence intervals, and treatment effects. It combines this information into a data
frame suitable for plotting the results.
}
