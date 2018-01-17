#	Yazar: Kadir KANMAZ
#	Email: kadirkanmaz2@gmail.com
#	Oluşturma Tarihi: 11/11/2017
#
#	Algoritmanın Amacı:
#	Grafta ki tüm ikililer arasında ki en kısa yolu Floyd-Warshall metodu ile hesaplayan algoritmadır.
#	Not: Bu algoritma yönsüz graflar için tasarlanmıştır.
#
#	Algoritmanın girdileri:
#	FloydWarshall(G,s,d)
#	G: graph matrix(graf-çizge matrisi)
#	s: source vertex (kaynak düğüm)
#	d: destination vertex (hedef düğüm)
#
#	OR (veya)
#
#	Algoritmanın girdileri:
#	FloydWarshall(G)
#	G: graph matrix(graf-çizge matrisi)
#
#	Algoritmanın Çıktıları:
#	_firstMatrix : Matrisin ilk durumu
#	_lastMatrix : Matrisin son hali
#	_PathAndCostMatrix : Tüm ikililer arasında ki en kısa yol ve maliyetleri
# Önemli Not: Algoritmanın çıktıları FloydWarshall klasörüne text(metin) dosyası olarak çıkacaktır.
# Gelin bir örnekle algoritmanın çalışma mantığını daha iyi anlamaya çalışalım.
#
#	Example(Örnek):
#	G=[
#	 0 15 3 8 Inf Inf Inf Inf;
#	 15 0 Inf 11 Inf Inf Inf Inf;
#	 3 Inf 0 9 Inf 4 Inf Inf;
#	 8 11 9 0 10 5 Inf Inf;
#	 Inf Inf Inf 10 0 Inf 5 Inf;
#	 Inf Inf 4 5 Inf 0 5 6;
#	 Inf Inf Inf Inf 5 5 0 3;
#	 Inf Inf Inf Inf Inf 6 3 0
#	 ];
#	FloydWarshall(G,1,5)
#
# Algoritmanın çıktısı:
# FloydWarshall Klasorune; firstMatrix.txt, lastMatrix.txt ve PathAndCostMatrix.txt başarıyla oluşturulmuştur.
# (1,5) -> 17.0
#
#	Ek bilgi: Algoritma istenirse infMatris.jl veya infMatrisA1.jl
#	Text(metin) dosyasından veriler çekilerek graf oluşturulabilir.
#	Oluşturduğumuz grafı algoritmamızda kullanabiliriz.
#	Neye göre infMatris.jl veya infMatrisA1.jl kullanmalıyız?!
#	Bazı test dosyalarında 1.düğüm "0" dan başlatılmıştır.
#	Julia ise "G[0,0]" değerini tanımamaktadır. Böyle bir test dosyası
#	içeriyorsa grafınız "infMatrisA1.jl" fonksiyonunu kullanmalısınız.
#	Aksi durumlarda ise "infMatris.jl" kullanmalısınız.
#
#	Önemli Not:
#	Metin dosyasının formatı aşağıda verildiği gibi olmalıdır.
#	Aksi halde algoritma doğru şekilde çalışmayacaktır.
#	Metin dosya formatı:
#	ilk satırda vertexCount(düğüm sayısı) bulunmalıdır.
#	diğer satırlarda ise sırasıyla:
#	sourceVertex(kaynakDüğüm) destinationVertex(hedefDüğüm) weight(ağırlık)
#	Örnek metin dosyası: dosyaAdı-> t1.txt
#
#	8
#	1 2 15
#	2 1 15
#	1 3 3
#	3 1 3
#	1 4 8
#	4 1 8
#	2 4 11
#	4 2 11
#	3 4 9
#	4 3 9
#	3 6 4
#	6 3 4
#	4 5 10
#	5 4 10
#	4 6 5
#	6 4 5
#	5 7 5
#	7 5 5
#	6 7 5
#	7 6 5
#	6 8 6
#	8 6 6
#	7 8 3
#	8 7 3
#
#	FloydWarshall(infMatris('t1.txt'),1,5)
# OR (veya)
#	FloydWarshall(infMatrisA1("test/test.txt"),1,5)
#
# Algoritmanın çıktısı:
# FloydWarshall Klasorune; firstMatrix.txt, lastMatrix.txt ve PathAndCostMatrix.txt başarıyla oluşturulmuştur.
# (1,5) -> 17.0

function FloydWarshall(G,s,d)
writedlm("FloydWarshall/_firstMatrix.txt", G)
vertexCount=size(G,1); # vertex(düğüm) sayısını alıyoruz.
   for k=1:vertexCount
     for i=1:vertexCount
       for j=1:vertexCount
        if G[i,k]+G[k,j]<G[i,j]
            G[i,j]=(G[i,k]+G[k,j]);
        end
      end
     end
   end
  writedlm("FloydWarshall/_lastMatrix.txt",G)
z=1;
PathMatrix=["Tüm ikililer arasında ki en kısa yol ve maliyetleri"];
 for i=z:vertexCount
  for j=(z+1):vertexCount
    push!(PathMatrix,"($(z),$(j)) -> $(G[z,j])")
  end
   z=z+1;
 end
 writedlm("FloydWarshall/_PathAndCostMatrix.txt",PathMatrix)
 println("FloydWarshall Klasorune; firstMatrix.txt, lastMatrix.txt ve PathAndCostMatrix.txt başarıyla oluşturulmuştur.")
 println("($(s),$(d)) -> $(G[s,d])")
end
