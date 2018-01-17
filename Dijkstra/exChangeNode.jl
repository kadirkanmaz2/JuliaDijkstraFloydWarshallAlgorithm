# Algoritmada 1. düğüm kaynak düğüm olarak düşünüldü. Ve tüm işlemler bu
# mantık üzerinden yürüyor. Ama kaynak düğüm 1.düğüm yerine farklı bir
# düğüm girilirse eğer, algoritmada büyük değişiklikler yapmak yerine
# girilen kaybak düğümle yer değiştiriyoruz.
#
# "B" sutununu ile "A" sutununu yer değiştiriyoruz.
function exChangeNode(G,a,b)
temp=G[:,a];
G[:,a]=G[:,b];
G[:,b]=temp;
# "B" satırı ile A satırı yer değiştiriyoruz.
temp=G[a,:];
G[a,:]=G[b,:];
G[b,:]=temp;
return G
end
