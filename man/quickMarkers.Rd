% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/quickMarkers.R
\name{quickMarkers}
\alias{quickMarkers}
\title{Gets top N markers for each cluster}
\usage{
quickMarkers(toc, clusters, N = 10, expressCut = 0)
}
\arguments{
\item{toc}{Table of counts.  Must be a sparse matrix.}

\item{clusters}{Vector of length \code{ncol(toc)} giving cluster membership.}

\item{N}{Number of marker genes to return per cluster.}

\item{expressCut}{Value above which a gene is considered expressed.}
}
\value{
data.frame with top N markers (or all that pass the hypergeometric test) and their statistics for each cluster.
}
\description{
Uses tf-idf ordering to get the top N markers of each cluster.  For each cluster, either the top N or all genes passing the hypergeometric test with an FDR of 0.01 are returned.
}
\details{
Term Frequency - Inverse Document Frequency is used in natural language processing to identify terms specific to documents.  This function uses the same idea to order genes within a group by how predictive of that group they are.  The main advantage of this is that it is extremely fast and gives reasonable results.

To do this, gene expression is binarised in each cell so each cell is either considered to express or not each gene.  That is, we replace the counts with \code{toc > zeroCut}.  The frequency with which a gene is expressed within the target group is compared to the global frequency to calculate the tf-idf score.  We also calculate a multiple hypothesis corrected p-value based on a hypergeometric test, but this is extremely permissive.
}
