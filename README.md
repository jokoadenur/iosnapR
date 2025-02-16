![Build Status](https://img.shields.io/badge/build-passing-brightgreen.svg)
![CRAN Version](https://img.shields.io/badge/CRAN-7.3.2-brightgreen)
![Open Issues](https://img.shields.io/badge/open%20issues-0-brightgreen)
![License](https://img.shields.io/badge/License-MIT-blue)
![License](https://img.shields.io/badge/blog-jokoding.com-blue)

![WhatsApp_Image_2025-02-16_at_08 51 47-removebg-preview](https://github.com/user-attachments/assets/3f970ba9-c9b3-4495-82b3-00dd3fb3e8c6)


# iosnapR

`iosnapR` is an R package designed to analyze Indonesia's Input-Output Table. For instance, the I-O Table of East Java can be obtained from (https://jatim.bps.go.id/id/statistics-table/1/MjE0OCMx/tabel-input-output-provinsi-jawa-timur-transaksi-domestik-atas-dasar-harga-produsen-17-lapanganusaha-2016-ju) or the National I-O Table from (https://www.bps.go.id/id/statistics-table/1/MjI3MSMx/tabel-input-output-indonesia-transaksi-total-atas-dasar-harga-dasar--17-produk---2020--juta-rupiah-.html). This package is designed to calculate backward linkage, forward linkage, total linkage, total output, investment or consumption based on user input, employment predictions, and economic growth projections using the Input-Output Table.

# features
Before using this package, you should first know the sector numbers and sector names included in it, which are:
```R
Nomor_Sektor  Nama_Sektor
   1 Pertanian, Kehutanan, dan Perikanan
   2 Pertambangan dan Penggalian
   3 Industri Pengolahan
   4 Pengadaan Listrik dan Gas
   5 Pengadaan Air, Pengelolaan Sampah, Limbah dan Daur Ulang
   6 Konstruksi
   7 Perdagangan Besar dan Eceran; Reparasi Mobil dan Sepeda Motor
   8 Transportasi dan Pergudangan
   9 Penyediaan Akomodasi dan Makan Minum
   10 Informasi dan Komunikasi
   11 Jasa Keuangan dan Asuransi
   12 Real Estate
   13 Jasa Perusahaan
   14 Administrasi Pemerintahan, Pertahanan dan Jaminan Sosial Wajib
   15 Jasa Pendidikan
   16 Jasa Kesehatan dan Kegiatan Sosial
   17 Jasa Lainnya
```
Run the `iosnapR` function in R to start the analysis.
Select the downloaded file and copy-paste its directory.
Input the estimated investment or consumption for each sector.
Receive an automatic prediction of the Input-Output analysis, including the economic impact on all sectors, economic growth, and unemployment reduction.

## Installation

To install the `iosnapR` package, run the following code in your R script:

```R
# Install package from GitHub
devtools::install_github("jokoadenur/iosnapR")
```

> **Note:** If prompted to update certain packages (options like 1. All, 2. CRAN, etc.), simply press **ENTER** to skip. Wait until the installation process is complete and the message `DONE (iosnapR)` appears.

After installation, activate the package with the following code:

```R
# Activate the package
library(iosnapR)
```

## Usage

After loading the package, simply run the iosnapr("file_path") function in your R script. This will allow you to analyze your Input-Output data based on your investment or consumption inputs. The system will then automatically perform an Input-Output analysis and generate predictions for economic growth and unemployment reduction.

```R
iosnapr("file_path")
```

### Simulation:
   ```R
  iosnapr("C:\\Users\\Statistics Indonesia\\Downloads\\Tabel Input-Output Indonesia Transaksi Domestik Atas Dasar Harga Produsen (17 Lapangan Usaha), 2016 (Juta Rupiah).xlsx") # file_path is directory of file where Input Output Table saved
  New names:
  Masukkan kontribusi sektor 1 : 0.1
  Masukkan kontribusi sektor 2 : 0.2
  Masukkan kontribusi sektor 3 : 0.3
  Masukkan kontribusi sektor 4 : 0.4
  Masukkan kontribusi sektor 5 : 0.5
  Masukkan kontribusi sektor 6 : 0.1
  Masukkan kontribusi sektor 7 : 0.2
  Masukkan kontribusi sektor 8 : 1
  Masukkan kontribusi sektor 9 : 3
  Masukkan kontribusi sektor 10 : 4
  Masukkan kontribusi sektor 11 : 5
  Masukkan kontribusi sektor 12 : 10
  Masukkan kontribusi sektor 13 : 2
  Masukkan kontribusi sektor 14 : 3
  Masukkan kontribusi sektor 15 : 2
  Masukkan kontribusi sektor 16 : 1
  Masukkan kontribusi sektor 17 : 0.003
  Masukkan injeksi untuk sektor 1 (0 jika tetap): 10
  Masukkan injeksi untuk sektor 2 (0 jika tetap): 0
  Masukkan injeksi untuk sektor 3 (0 jika tetap): 0
  Masukkan injeksi untuk sektor 4 (0 jika tetap): 0
  Masukkan injeksi untuk sektor 5 (0 jika tetap): 0
  Masukkan injeksi untuk sektor 6 (0 jika tetap): 0
  Masukkan injeksi untuk sektor 7 (0 jika tetap): 0
  Masukkan injeksi untuk sektor 8 (0 jika tetap): 0
  Masukkan injeksi untuk sektor 9 (0 jika tetap): 0
  Masukkan injeksi untuk sektor 10 (0 jika tetap): 0
  Masukkan injeksi untuk sektor 11 (0 jika tetap): 0
  Masukkan injeksi untuk sektor 12 (0 jika tetap): 0
  Masukkan injeksi untuk sektor 13 (0 jika tetap): 0
  Masukkan injeksi untuk sektor 14 (0 jika tetap): 0
  Masukkan injeksi untuk sektor 15 (0 jika tetap): 0
  Masukkan injeksi untuk sektor 16 (0 jika tetap): 0
  Masukkan injeksi untuk sektor 17 (0 jika tetap): 0
  Masukkan PDRB ADHB sektor 1  sebelumnya: 10
  Masukkan jumlah tenaga kerja sektor 1 : 2
  Masukkan PDRB ADHB sektor 2  sebelumnya: 1
  Masukkan jumlah tenaga kerja sektor 2 : 3
  Masukkan PDRB ADHB sektor 3  sebelumnya: 4
  Masukkan jumlah tenaga kerja sektor 3 : 2
  Masukkan PDRB ADHB sektor 4  sebelumnya: 4
  Masukkan jumlah tenaga kerja sektor 4 : 5
  Masukkan PDRB ADHB sektor 5  sebelumnya: 5
  Masukkan jumlah tenaga kerja sektor 5 : 3
  Masukkan PDRB ADHB sektor 6  sebelumnya: 4
  Masukkan jumlah tenaga kerja sektor 6 : 5
  Masukkan PDRB ADHB sektor 7  sebelumnya: 3
  Masukkan jumlah tenaga kerja sektor 7 : 6
  Masukkan PDRB ADHB sektor 8  sebelumnya: 1
  Masukkan jumlah tenaga kerja sektor 8 : 3
  Masukkan PDRB ADHB sektor 9  sebelumnya: 2
  Masukkan jumlah tenaga kerja sektor 9 : 4
  Masukkan PDRB ADHB sektor 10  sebelumnya: 2
  Masukkan jumlah tenaga kerja sektor 10 : 4
  Masukkan PDRB ADHB sektor 11  sebelumnya: 2
  Masukkan jumlah tenaga kerja sektor 11 : 4
  Masukkan PDRB ADHB sektor 12  sebelumnya: 3
  Masukkan jumlah tenaga kerja sektor 12 : 55
  Masukkan PDRB ADHB sektor 13  sebelumnya: 4
  Masukkan jumlah tenaga kerja sektor 13 : 3
  Masukkan PDRB ADHB sektor 14  sebelumnya: 2
  Masukkan jumlah tenaga kerja sektor 14 : 4
  Masukkan PDRB ADHB sektor 15  sebelumnya: 2
  Masukkan jumlah tenaga kerja sektor 15 : 4
  Masukkan PDRB ADHB sektor 16  sebelumnya: 5
  Masukkan jumlah tenaga kerja sektor 16 : 3
  Masukkan PDRB ADHB sektor 17  sebelumnya: 5
  Masukkan jumlah tenaga kerja sektor 17 : 2
  Masukkan inflasi periode sebelumnya (%) : 0.06
  Masukkan PDRB ADHK sebelumnya : 42536737267
  
  Pertumbuhan Ekonomi:  73.15546 %
  Masukkan TPT sebelumnya (%) : 0.24
  Masukkan jumlah pengangguran sebelumnya : 5262738
  Masukkan jumlah angkatan kerja sebelumnya : 52526367
  
  Perkiraan Pengurangan Pengangguran:  119025.4 %
                                                             Sektor Daya_Penyebaran
  1                             Pertanian, Kehutanan, dan Perikanan       1.0829115
  2                                     Pertambangan dan Penggalian       1.2133231
  3                                             Industri Pengolahan       2.3578466
  4                                       Pengadaan Listrik dan Gas       1.5215812
  5        Pengadaan Air, Pengelolaan Sampah, Limbah dan Daur Ulang       0.6253621
  6                                                      Konstruksi       0.8024928
  7   Perdagangan Besar dan Eceran; Reparasi Mobil dan Sepeda Motor       1.1582868
  8                                    Transportasi dan Pergudangan       1.0720500
  9                            Penyediaan Akomodasi dan Makan Minum       0.7411262
  10                                       Informasi dan Komunikasi       1.0153541
  11                                     Jasa Keuangan dan Asuransi       0.9942161
  12                                                    Real Estate       0.7566795
  13                                                Jasa Perusahaan       1.0298296
  14 Administrasi Pemerintahan, Pertahanan dan Jaminan Sosial Wajib       0.6691039
  15                                                Jasa Pendidikan       0.6302600
  16                             Jasa Kesehatan dan Kegiatan Sosial       0.6336640
  17                                                   Jasa Lainnya       0.6959126
     Daya_Kepekaan Total_Daya Output_Total Kontribusi_Sektor Investasi_atau_Konsumsi
  1      0.7710352   1.853947   1292509361             1e-01                      10
  2      0.8799619   2.093285   1078324644             2e-01                       0
  3      1.0430147   3.400861   5448463846             3e-01                       0
  4      1.7708186   3.292400   1259642794             4e-01                       0
  5      0.9831387   1.608501   1132176960             5e-01                       0
  6      1.0921133   1.894606   4402945731             1e-01                       0
  7      0.8617505   2.020037   2070276198             2e-01                       0
  8      1.0707997   2.142850   2281100170             1e+00                       0
  9      1.0541932   1.795319   2477967946             3e+00                       0
  10     0.9539042   1.969258    859610088             4e+00                       0
  11     0.8335408   1.827757    692139568             5e+00                       0
  12     0.8177623   1.574442   1133425776             1e+01                       0
  13     0.9573521   1.987182    985492957             2e+00                       0
  14     1.0219122   1.691016   1828374768             3e+00                       0
  15     0.9088034   1.539063   1469289351             2e+00                       0
  16     1.0422820   1.675946   1512245240             1e+00                       0
  17     0.9376171   1.633530   1212641547             3e-03                       0
     PDRB_Sektor TenagaKerja_Sektor OutputperKapita Lapangan_Kerja_Baru
  1           10                  2      5.00000000           258501872
  2            1                  3      0.33333333          3234973933
  3            4                  2      2.00000000          2724231923
  4            4                  5      0.80000000          1574553493
  5            5                  3      1.66666667           679306176
  6            4                  5      0.80000000          5503682163
  7            3                  6      0.50000000          4140552397
  8            1                  3      0.33333333          6843300510
  9            2                  4      0.50000000          4955935892
  10           2                  4      0.50000000          1719220177
  11           2                  4      0.50000000          1384279135
  12           3                 55      0.05454545         20779472569
  13           4                  3      1.33333333           739119718
  14           2                  4      0.50000000          3656749536
  15           2                  4      0.50000000          2938578701
  16           5                  3      1.66666667           907347144
  17           5                  2      2.50000000           485056619
     Pengganda_KesempatanKerja Pertumbuhan_Ekonomi Pengurangan_Pengangguran
  1                    0.20000            73.15546                 119025.4
  2                    3.00000            73.15546                 119025.4
  3                    0.50000            73.15546                 119025.4
  4                    1.25000            73.15546                 119025.4
  5                    0.60000            73.15546                 119025.4
  6                    1.25000            73.15546                 119025.4
  7                    2.00000            73.15546                 119025.4
  8                    3.00000            73.15546                 119025.4
  9                    2.00000            73.15546                 119025.4
  10                   2.00000            73.15546                 119025.4
  11                   2.00000            73.15546                 119025.4
  12                  18.33333            73.15546                 119025.4
  13                   0.75000            73.15546                 119025.4
  14                   2.00000            73.15546                 119025.4
  15                   2.00000            73.15546                 119025.4
  16                   0.60000            73.15546                 119025.4
  17                   0.40000            73.15546                 119025.4
   ```
### Ending statements:
This package is inspired by research cited as follows: Buana, A. G., Ghefira Nurhaliza, C., Fauzan, A., & Sutisna, I. (2025). Input-Output Analysis of the Impact of the Tourism Sector on the Economy in the Special Region of Yogyakarta. Jurnal Lebesgue: Jurnal Ilmiah Pendidikan Matematika, Matematika dan Statistika, 6(1), 35-43. https://doi.org/10.46306/lb.v6i1.865.
