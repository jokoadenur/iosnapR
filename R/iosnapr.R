iosnapr <- function(file){
  iojatim <- readxl::read_excel(file, col_names = T)
  iojatim <- iojatim[-c(1, 3),]
  colnames(iojatim) <- iojatim[1,]
  iojatim <- iojatim[-1, ]

  Z <- iojatim[c(1:17), c(3:19)]
  Z <- matrix(Z)
  Z <- as.numeric(unlist(Z))
  Z <- matrix(unlist(Z), nrow = 17, byrow = TRUE)

  tot_output <- iojatim$`Total Output`[1:17]
  tot_output <- as.numeric(matrix(tot_output))
  end_demand <- iojatim$`Total Konsumsi Akhir`[1:17]
  end_demand <- as.numeric(matrix(end_demand))

  # Matriks koefisien teknis
  A <- sweep(Z, 1, tot_output, FUN = "/")

  # Matriks identitas
  I <- diag(nrow(Z))

  # Matriks Leontief
  L <- solve(I - A)

  # Matriks Daya Penyebaran dan Daya Kepekaan
  Daya_Penyebaran <- colSums(L) / mean(colSums(L))
  Daya_Kepekaan <- rowSums(L) / mean(rowSums(L))
  Total_Daya <- Daya_Penyebaran + Daya_Kepekaan

  # Matriks F diambil dari data end_demand
  F <- matrix(end_demand, ncol = 1)

  # Matriks total output X
  X <- L %*% F

  # Total Tambahan Output
  Total_Tambahan_Output <- sum(X)

  # Input kontribusi sektor dari user
  kontribusi <- numeric(17)
  for (i in 1:17) {
    kontribusi[i] <- as.numeric(readline(paste("Masukkan kontribusi sektor", i, ": ")))
  }
  kontribusi <- matrix(kontribusi, ncol = 1)

  # Input matriks injeksi oleh user
  injeksi <- numeric(17)
  for (i in 1:17) {
    injeksi[i] <- as.numeric(readline(paste("Masukkan injeksi untuk sektor", i, "(0 jika tetap): ")))
  }
  injeksi <- matrix(injeksi, ncol = 1)

  # Hitungan dampak langsung, tidak langsung, dan totalnya
  Dampak_Langsung <- Z %*% injeksi
  Dampak_TidakLangsung <- (L - I) %*% injeksi
  Dampak_Total <- Dampak_Langsung + Dampak_TidakLangsung

  # Input PDRB dan tenaga kerja dari user
  PDRB <- numeric(17)
  Tenaga_Kerja <- numeric(17)
  for (i in 1:17) {
    PDRB[i] <- as.numeric(readline(paste("Masukkan PDRB ADHB sektor", i, " sebelumnya: ")))
    Tenaga_Kerja[i] <- as.numeric(readline(paste("Masukkan jumlah tenaga kerja sektor", i, ": ")))
  }
  PDRB <- matrix(PDRB, ncol = 1)
  Tenaga_Kerja <- matrix(Tenaga_Kerja, ncol = 1)
  Output_Per_Kapita <- PDRB / Tenaga_Kerja

  # Input inflasi dan PDRB ADHK sebelumnya
  values <- c("inflasi periode sebelumnya (%)", "PDRB ADHK sebelumnya")
  inflasi_sebelumnya <- as.numeric(readline(paste("Masukkan", values[1], ": "))) / 100
  PDRB_ADHK_sebelumnya <- as.numeric(readline(paste("Masukkan", values[2], ": ")))
  Pertumbuhan_Ekonomi <- (Total_Tambahan_Output * (1 - inflasi_sebelumnya) / PDRB_ADHK_sebelumnya) * 100
  cat("\nPertumbuhan Ekonomi: ", Pertumbuhan_Ekonomi, "%\n")

  # Matriks pengganda kesempatan kerja
  Lapangan_Kerja_Baru <- X / Output_Per_Kapita
  Pengganda_Kesempatan_Kerja <- Lapangan_Kerja_Baru / X

  # Input data pengangguran
  values <- c("TPT sebelumnya (%)", "jumlah pengangguran sebelumnya", "jumlah angkatan kerja sebelumnya")
  TPT_sebelumnya <- as.numeric(readline(paste("Masukkan", values[1], ": ")))
  Jumlah_Pengangguran_sebelumnya <- as.numeric(readline(paste("Masukkan", values[2], ": ")))
  Jumlah_Angkatan_Kerja_sebelumnya <- as.numeric(readline(paste("Masukkan", values[3], ": ")))
  Pengurangan_Pengangguran <- TPT_sebelumnya - ((Jumlah_Pengangguran_sebelumnya - sum(Lapangan_Kerja_Baru)) / Jumlah_Angkatan_Kerja_sebelumnya) * 100
  cat("\nPerkiraan Pengurangan Pengangguran: ", Pengurangan_Pengangguran, "%\n")

  # Tampilkan hasil estimasi dalam bentuk data frame
  hasil_estimasi <- data.frame(
    Sektor = iojatim$Deskripsi[1:17],
    Daya_Penyebaran = Daya_Penyebaran[1:17],
    Daya_Kepekaan = Daya_Kepekaan[1:17],
    Total_Daya = Total_Daya[1:17],
    Output_Total = X,
    Kontribusi_Sektor = kontribusi,
    Investasi_atau_Konsumsi = injeksi,
    PDRB_Sektor = PDRB,
    TenagaKerja_Sektor = Tenaga_Kerja,
    OutputperKapita = Output_Per_Kapita,
    Lapangan_Kerja_Baru = Lapangan_Kerja_Baru,
    Pengganda_KesempatanKerja = Pengganda_Kesempatan_Kerja,
    Pertumbuhan_Ekonomi = Pertumbuhan_Ekonomi,
    Pengurangan_Pengangguran = Pengurangan_Pengangguran
  )
  assign("hasil_estimasi", hasil_estimasi, envir = .GlobalEnv)
  return(hasil_estimasi)
}
