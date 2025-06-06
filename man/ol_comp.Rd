% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ol_comp.R
\name{ol_comp}
\alias{ol_comp}
\title{Calculate Overload Compensation for One Instructor}
\usage{
ol_comp(
  instructor_schedule,
  L = 4,
  U = 9,
  rate_per_cr = 2500/3,
  reg_load = 12,
  favor_institution = TRUE
)
}
\arguments{
\item{instructor_schedule}{A data frame of the instructor's courses, with columns \code{INSTRUCTOR}, \code{ENRLD}, and \code{HRS}.}

\item{L}{Lower enrollment threshold for overload pay qualification (default = 4).}

\item{U}{Upper limit of proration; courses with ENRLD > U get full-rate pay (default = 9).}

\item{rate_per_cr}{Base overload pay per credit hour (default = 2500/3).}

\item{reg_load}{Regular teaching load in credit hours (default = 12).}

\item{favor_institution}{Logical: if TRUE (default), prioritizes high-enrollment courses for regular load.}
}
\value{
A tibble with course-level compensation and a human-readable summary block.
}
\description{
Computes prorated overload pay and qualified credit hours for a single instructor
based on course credit hours, enrollment, and institutional overload rules.
}
\details{
If \code{favor_institution = TRUE} (default), the function assigns \strong{high-enrollment}
qualified courses to the \strong{regular load first}, resulting in lower compensation
because only \strong{low-enrollment} courses are left for overload pay — this favors the institution.

If \code{favor_institution = FALSE}, the function assigns \strong{low-enrollment} qualified
courses to the regular load first, preserving \strong{high-enrollment} courses for compensation —
this favors the instructor.

\strong{Note:} This function assumes that \code{instructor_schedule} is already filtered for one instructor.
Use \code{get_instructor_schedule()} to extract an instructor’s schedule using
flexible, case-insensitive pattern matching (regex supported, e.g., \code{"smith|jones"}).
}
