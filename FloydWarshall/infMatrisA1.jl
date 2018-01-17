# Yazar: Kadir KANMAZ
# Email: kadirkanmaz2@gmail.com
# Oluşturma Tarihi: 11/11/2017
# Metin dosyasından verileri çekip matris oluştura fonksiyon.
# Algoritmanın girdileri:
# filePath: dosyanın bulunduğu konum. Örnek: 'C:/test1.txt'
# Not: 1.düğümün "0" alındığı test dosyalarında kullanılmalıdır. Aksi halde
# fonksiyon doğru çalışmayacaktır.

# Önemli Not: Metin dosyasının formatı aşağıda verildiği gibi olmalıdır.
# ilk satırda vertexCount(düğüm sayısı) bulunmalıdır.
# diğer satırlarda ise sırasıyla:
# sourceVertex(kaynakDüğüm) destinationVertex(hedefDüğüm) weight(ağırlık)

# Örnek metin dosyası: dosyaAdı: test1.txt
# 9
# 4 5 0.35
# 5 4 0.35
# 4 7 0.37
# 5 7 0.28
# 7 5 0.28
# 5 1 0.32
# 0 4 0.38
# 0 2 0.26
# 7 3 0.39
# 1 3 0.29
# 2 7 0.34
# 6 2 0.40
# 3 6 0.52
# 6 0 0.58
# 6 4 0.93

# Example (Örnek): Dosya 'C:/test1.txt' konumunda olduğunu varsayalım:
# infMatrisA1("C:/test1.txt");
# Dosya Julia uygulamasının içindeyse:
# infMatrisA1("t1.txt");
#Algoritmanın çıktısı:
#
#	9×9 Array{Float64,2}:
#	   0.0   Inf       0.26  Inf       0.38  Inf     Inf     Inf     Inf
#	 Inf       0.0   Inf       0.29  Inf     Inf     Inf     Inf     Inf
#	 Inf     Inf       0.0   Inf     Inf     Inf     Inf       0.34  Inf
#	 Inf     Inf     Inf       0.0   Inf     Inf       0.52  Inf     Inf
#	 Inf     Inf     Inf     Inf       0.0     0.35  Inf       0.37  Inf
#	 Inf       0.32  Inf     Inf       0.35    0.0   Inf       0.28  Inf
#	   0.58  Inf       0.4   Inf       0.93  Inf       0.0   Inf     Inf
#	 Inf     Inf     Inf       0.39  Inf       0.28  Inf       0.0   Inf
#	 Inf     Inf     Inf     Inf     Inf     Inf     Inf     Inf       0.0

function infMatrisA1(filePath)
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
      f[A[i,1]+1,A[i,2]+1]=A[i,3]  # ağırlık değerlerini giriyoruz.
      i=i+1;
    end
    return f
end
