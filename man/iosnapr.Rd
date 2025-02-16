\name{iosnapr}
\alias{iosnapr}
\title{iosnapr}
\usage{
iosnapr(file)
}
\arguments{
  \item{file}{Path ke file Excel yang berisi Tabel Input-Output.}
}
\description{
iosnapr adalah fungsi untuk analisis Tabel Input-Output dalam ekonomi.
}
\details{
Fungsi ini membaca Tabel Input-Output dari file Excel dan melakukan perhitungan dampak ekonomi berdasarkan matriks Leontief.
}
\examples{
\dontrun{
    iosnapr("data/io_jatim.xlsx")
}
}
