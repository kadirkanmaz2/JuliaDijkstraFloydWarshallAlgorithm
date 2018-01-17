# Düzenleyen: Kadir KANMAZ
# Email: kadirkanmaz2@gmail.com
# Düzenleme Tarihi: 18.11.2017
#-----------------------------------------------------------------------
# Dijkstra algoritması, bir düğümden diğer tüm düğümlere en kısa yolları hesaplar.
# Bir başka ifadeyle belirli bir başlangıç noktasına göre en kısa yolu belirleyen algoritmadır.
# Algoritmanın Girdileri:
# G: Graph (çizge, şekil)
# s: sourceVertex (Kaynak düğüm)
# d: destinationVertex (Hedef düğüm)
# Algoritmanın çıktıları:
# cost: maliyet, iki düğüm arasında ki mesafe
# Path: Yol
# [cost Path] = Dijkstra(Graph, source, destination)
#-----------------------------------------------------------------------
# Ek bilgi: Algoritma istenirse infMatris.jl veya infMatrisA1.jl
# Text(metin) dosyasından veriler çekilerek graf oluşturulabilir.
# Oluşturduğumuz grafı algoritmamızda kullanabiliriz.
# Neye göre infMatris.jl veya infMatrisA1.jl kullanmalıyız?!
# Bazı test dosyalarında 1.düğüm "0" dan başlatılmıştır.
# Julia ise "G[0,0]" değerini tanımamaktadır. Böyle bir test dosyası
# içeriyorsa grafınız "infMatrisA1.jl" fonksiyonunu kullanmalısınız.
# Aksi durumlarda ise "infMatris.jl" kullanmalısınız.
#
# Önemli Not:
# Metin dosyasının formatı aşağıda verildiği gibi olmalıdır.
# Aksi halde algoritma doğru şekilde çalışmayacaktır.
# Metin dosya formatı:
# ilk satırda vertexCount(düğüm sayısı) bulunmalıdır.
# diğer satırlarda ise sırasıyla:
# sourceVertex(kaynakDüğüm) destinationVertex(hedefDüğüm) weight(ağırlık)
# Örnek metin dosyası: dosyaAdı=> t1.txt

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
#------------------------------------------------------------------------
# Example(Örnek):
# c, P = Dijkstra(infMatris("t1.txt"),1,5)
# OR (veya)
# c, P = Dijkstra(infMatrisA1("1000EWD.txt"),8,42)
# c, P = Dijkstra(infMatrisA1("D:/testData/1000EWD.txt"),5,28)
#------------------------------------------------------------------------
function Dijkstra(G,s,d)
	if s==d
		c=0;
		P=[s];
	else # kaynak düğüm, hedef düğümden farklı ise
		if d==1   # Kaynak düğüm 1.düğümden farklı mı diye kontrol ediyoruz.
			d=s;
		end
		G=exChangeNode(G,1,s);
		lengthG=size(G,1);
		W=zeros(lengthG,lengthG);
		for i=2 : lengthG
			W[1,i]=i;
			W[2,i]=G[1,i];
		end
		D=zeros(lengthG,2)
		for i=1:lengthG
			D[i,1]=G[1,i];
			D[i,2]=i;
		end
		D2=D[2:end,:]; #D2=D[2:length(D),:];  #julia ve matlab length komutları farklı çalışıyor!!
		P=2
		while P <= (size(W,1)-1)
			P=P+1;
			D2=sortrows(D2);
			k=D2[1,2];
			W[P,1]=k;
			D2 = D2[setdiff(1:end, 1), :]   #ff = ff[setdiff(1:end, 1), :]  # D2[1,:]=[]
			for i=1:size(D2,1) #convert(Int64,k) k=3.00 icin int olarak gormuyor bu yuzden cevirmek zorunda kaldik.
				if D[convert(Int64,D2[i,2]),1]>(D[convert(Int64,k),1]+G[convert(Int64,k),convert(Int64,D2[i,2])])
					D[convert(Int64,D2[i,2]),1] = D[convert(Int64,k),1]+G[convert(Int64,k),convert(Int64,D2[i,2])]
					D2[i,1] = D[convert(Int64,D2[i,2]),1];
				end
			end
			for i=2:size(G,1)
				W[P,i]=D[i,1];
			end
		end
		if d==s
			P=[1];
		else
			P=[d];
		end
		c=W[size(W,1),d];
		P = listDijkstra(P,W,s,d); #Bulduğumuz yolu ve mesafeyi ekranda gösteriyoruz.
	end
	return c,P
end
