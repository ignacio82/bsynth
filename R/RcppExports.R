# Generated by using Rcpp::compileAttributes() -> do not edit by hand
# Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

make_F <- function(T, diagonal_loadings, lower_tri_loadings, pstream__ = 0L) {
    .Call(`_bsynth_make_F`, T, diagonal_loadings, lower_tri_loadings, pstream__)
}

make_beta <- function(J, off, lambda, eta, tau, pstream__ = 0L) {
    .Call(`_bsynth_make_beta`, J, off, lambda, eta, tau, pstream__)
}

