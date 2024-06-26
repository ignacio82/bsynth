% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/factory.R
\name{bayesianSynth}
\alias{bayesianSynth}
\title{Create a Bayesian Synthetic Control Object Using Panel Data}
\value{
vizdraws object with the relative bias with offset.
}
\description{
A Bayesian Synthetic Control has raw data and draws from the posterior
distribution. This is represented by an R6 Class.

public methods:
\itemize{
\item \code{initialize()} initializes the variables and model parameters
\item \code{fit()}  fits the stan model and returns a fit object
\item \code{updateWidth} updates the width of the credible interval
\item \code{placeboPlot} generates a counterfactual placebo plot
\item \code{effectPlot} returns a plot of the treatment effect over time
\item \code{summarizeLift}returns descriptive statistics of the lift estimate
\item \code{biasDraws} returns a plot of the relative bias in a LFM
\item \code{liftDraws} returns a plot of the posterior lift distribution
\item \code{liftBias} returns a plot of the relative bias given a lift offset
Data structure:
}
}
\section{Active bindings}{
\if{html}{\out{<div class="r6-active-bindings">}}
\describe{
\item{\code{timeTiles}}{ggplot2 object that shows when
the intervention happened.}

\item{\code{plotData}}{returns tibble with the observed outcome and the
counterfactual data.}

\item{\code{interventionTime}}{returns intervention time period (e.g., year)
in which the treatment occurred.}

\item{\code{synthetic}}{returns ggplot2 object that shows the
observed and counterfactual outcomes over time.}

\item{\code{checks}}{returns MCMC checks.}

\item{\code{lift}}{draws from the posterior distribution of the lift.}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-bayesianSynth-new}{\code{bayesianSynth$new()}}
\item \href{#method-bayesianSynth-fit}{\code{bayesianSynth$fit()}}
\item \href{#method-bayesianSynth-updateWidth}{\code{bayesianSynth$updateWidth()}}
\item \href{#method-bayesianSynth-summarizeLift}{\code{bayesianSynth$summarizeLift()}}
\item \href{#method-bayesianSynth-effectPlot}{\code{bayesianSynth$effectPlot()}}
\item \href{#method-bayesianSynth-placeboPlot}{\code{bayesianSynth$placeboPlot()}}
\item \href{#method-bayesianSynth-biasDraws}{\code{bayesianSynth$biasDraws()}}
\item \href{#method-bayesianSynth-liftDraws}{\code{bayesianSynth$liftDraws()}}
\item \href{#method-bayesianSynth-liftBias}{\code{bayesianSynth$liftBias()}}
\item \href{#method-bayesianSynth-weightDraws}{\code{bayesianSynth$weightDraws()}}
\item \href{#method-bayesianSynth-weightCorr}{\code{bayesianSynth$weightCorr()}}
\item \href{#method-bayesianSynth-clone}{\code{bayesianSynth$clone()}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-bayesianSynth-new"></a>}}
\if{latex}{\out{\hypertarget{method-bayesianSynth-new}{}}}
\subsection{Method \code{new()}}{
Create a new bayesianSynth object.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{bayesianSynth$new(
  data,
  time,
  id,
  treated,
  outcome,
  ci_width = 0.75,
  gp = FALSE,
  covariates = NULL,
  predictor_match = FALSE,
  predictor_match_covariates0 = NULL,
  predictor_match_covariates1 = NULL,
  vs = NULL
)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{data}}{Long data.frame object with fields outcome, time, id,
and treatment indicator.}

\item{\code{time}}{Name of the variable in the data frame that
identifies the time period (e.g. year, month, week etc).}

\item{\code{id}}{Name of the variable in the data frame that
identifies the units (e.g. country, region etc).}

\item{\code{treated}}{Name of the variable in the data frame that contains
the treatment assignment of the intervention.}

\item{\code{outcome}}{Name of the outcome variable.}

\item{\code{ci_width}}{Credible interval's width.  This number is in the
(0,1) interval.}

\item{\code{gp}}{Logical that indicates whether or not to include a
Gaussian Process as part of the model.}

\item{\code{covariates}}{Data.frame with time dependent covariates for
for each unit and time field.
Defaults to NULL if no covariates should be included in the model.}

\item{\code{predictor_match}}{Logical that indicates whether or not to run
the matching version of the Bayesian Synthetic Control. This option can
not be used with gp, covariates or multiple treated units.}

\item{\code{predictor_match_covariates0}}{data.frame with time independent
covariates on each row and column indicating the control unit names
(dim k x J+1).}

\item{\code{predictor_match_covariates1}}{Vector with time independent
covariates for the treated unit (dim k x 1).}

\item{\code{vs}}{Vector of weights for the importance of the predictors used
in creating the synthetic control.
Defaults to equal weight for all predictors.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
A new \code{bayesianSynth} object.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-bayesianSynth-fit"></a>}}
\if{latex}{\out{\hypertarget{method-bayesianSynth-fit}{}}}
\subsection{Method \code{fit()}}{
Fit Stan model.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{bayesianSynth$fit(...)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{...}}{other arguments passed to \code{\link[rstan:stanmodel-method-sampling]{rstan::sampling()}}.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-bayesianSynth-updateWidth"></a>}}
\if{latex}{\out{\hypertarget{method-bayesianSynth-updateWidth}{}}}
\subsection{Method \code{updateWidth()}}{
Update the width of the credible interval.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{bayesianSynth$updateWidth(ci_width = 0.75)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{ci_width}}{New width for the credible interval. This number should
be in the (0,1) interval.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-bayesianSynth-summarizeLift"></a>}}
\if{latex}{\out{\hypertarget{method-bayesianSynth-summarizeLift}{}}}
\subsection{Method \code{summarizeLift()}}{
returns descriptive statistics of the lift estimate.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{bayesianSynth$summarizeLift()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-bayesianSynth-effectPlot"></a>}}
\if{latex}{\out{\hypertarget{method-bayesianSynth-effectPlot}{}}}
\subsection{Method \code{effectPlot()}}{
effect ggplot2 object that shows the
effect of the intervention over time.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{bayesianSynth$effectPlot(facet = TRUE, subset = NULL)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{facet}}{Boolean that is TRUE if we want to divide the plot for each
unit.}

\item{\code{subset}}{Set of units to use in the effect plot.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-bayesianSynth-placeboPlot"></a>}}
\if{latex}{\out{\hypertarget{method-bayesianSynth-placeboPlot}{}}}
\subsection{Method \code{placeboPlot()}}{
Plot placebo intervention.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{bayesianSynth$placeboPlot(periods, ...)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{periods}}{Positive number of periods for the placebo intervention.}

\item{\code{...}}{other arguments passed to \code{\link[rstan:stanmodel-method-sampling]{rstan::sampling()}}.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
ggplot2 object for placebo treatment effect.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-bayesianSynth-biasDraws"></a>}}
\if{latex}{\out{\hypertarget{method-bayesianSynth-biasDraws}{}}}
\subsection{Method \code{biasDraws()}}{
Plots relative upper bias / tau for a time period (firstT, lastT).
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{bayesianSynth$biasDraws(small_bias = 0.3, firstT, lastT)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{small_bias}}{Threshold value for considering the bias "small".}

\item{\code{firstT}}{Start of the time period to compute relative bias over.
Must be after the intervention.}

\item{\code{lastT}}{End of the time period to compute relative bias over.
Must be after the intervention.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
vizdraw object with the posterior distribution of relative bias.
Bias is scaled by the time periods.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-bayesianSynth-liftDraws"></a>}}
\if{latex}{\out{\hypertarget{method-bayesianSynth-liftDraws}{}}}
\subsection{Method \code{liftDraws()}}{
Plots lift.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{bayesianSynth$liftDraws(from, to, ...)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{from}}{First period to consider when calculating lift. If infinite,
set to the time of the intervention.}

\item{\code{to}}{Last period to consider when calculating lift. If infinite, set
to the last period.}

\item{\code{...}}{other arguments passed to vizdraws::vizdraws().}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
vizdraws object with the posterior distribution of the lift.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-bayesianSynth-liftBias"></a>}}
\if{latex}{\out{\hypertarget{method-bayesianSynth-liftBias}{}}}
\subsection{Method \code{liftBias()}}{
Plot Bias magnitude in terms of lift for period (firstT, lastT)
pre_MADs / y0 relative to lift thresholds.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{bayesianSynth$liftBias(firstT, lastT, offset, ...)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{firstT}}{start of the time period to compute relative bias
over. They must be after the intervention.}

\item{\code{lastT}}{end of the Time period to compute relative bias
over. They must be after the intervention.}

\item{\code{offset}}{Target lift \%.}

\item{\code{...}}{other arguments passed to vizdraws::vizdraws().}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-bayesianSynth-weightDraws"></a>}}
\if{latex}{\out{\hypertarget{method-bayesianSynth-weightDraws}{}}}
\subsection{Method \code{weightDraws()}}{
Plot implicit weight distribution across draws.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{bayesianSynth$weightDraws()}\if{html}{\out{</div>}}
}

\subsection{Returns}{
ggplot object with weight distribution per unit.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-bayesianSynth-weightCorr"></a>}}
\if{latex}{\out{\hypertarget{method-bayesianSynth-weightCorr}{}}}
\subsection{Method \code{weightCorr()}}{
Plots correlations between weights across draws.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{bayesianSynth$weightCorr()}\if{html}{\out{</div>}}
}

\subsection{Returns}{
ggplot heatmap object with correlations.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-bayesianSynth-clone"></a>}}
\if{latex}{\out{\hypertarget{method-bayesianSynth-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{bayesianSynth$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
