# Yazar: Kadir KANMAZ
# Email: kadirkanmaz2@gmail.com
# Oluşturma Tarihi: 11/11/2017
# Metin dosyasından verileri çekip matris oluştura fonksiyon.
# Algoritmanın girdileri:
# filePath: dosyanın bulunduğu konum. Örnek: 'C:\test1.txt'
# Not: 1.düğümün "1" alındığı test dosyalarında kullanılmalıdır. Aksi halde
# fonksiyon doğru çalışmayacaktır.

# Önemli Not: Metin dosyasının formatı aşağıda verildiği gibi olmalıdır.
# ilk satırda vertexCount(düğüm sayısı) bulunmalıdır.
# diğer satırlarda ise sırasıyla:
# sourceVertex(kaynakDüğüm) destinationVertex(hedefDüğüm) weight(ağırlık)

# Örnek metin dosyası: dosyaAdı: test1.txt
# 8
# 1 2 15
# 2 1 15
# 1 3 3
# 3 1 3
# 1 4 8
# 4 1 8
# 2 4 11
# 4 2 11
# 3 4 9
# 4 3 9
# 3 6 4
# 6 3 4
# 4 5 10
# 5 4 10
# 4 6 5
# 6 4 5
# 5 7 5
# 7 5 5
# 6 7 5
# 7 6 5
# 6 8 6
# 8 6 6
# 7 8 3
# 8 7 3

# Example (Örnek): Dosya 'C:\test1.txt' konumunda olduğunu varsayalım:
# infMatris("C:/test1.txt");
# Dosya Julia uygulamasının içindeyse:
# infMatris("t1.txt");
#Algoritmanın çıktısı:
#
#	8×8 Array{Float64,2}:
#	   0.0   15.0    3.0    8.0  Inf    Inf    Inf    Inf
#	  15.0    0.0  Inf     11.0  Inf    Inf    Inf    Inf
#	   3.0  Inf      0.0    9.0  Inf      4.0  Inf    Inf
#	   8.0   11.0    9.0    0.0   10.0    5.0  Inf    Inf
#	 Inf    Inf    Inf     10.0    0.0  Inf      5.0  Inf
#	 Inf    Inf      4.0    5.0  Inf      0.0    5.0    6.0
#	 Inf    Inf    Inf    Inf      5.0    5.0    0.0    3.0
#	 Inf    Inf    Inf    Inf    Inf      6.0    3.0    0.0


function infMatris(filePath)
A = readdlm(filePath)
V=A[1,1]
o=ones(V,V)
f=o*Inf
    for i= 1:V
      f[i,i]=0;
    end
i=2
e=(size(A,1)-1)
    for j=1:e
      f[A[i,1],A[i,2]]=A[i,3]  # ağırlık değerlerini giriyoruz.
      i=i+1;
    end
    return f
end
