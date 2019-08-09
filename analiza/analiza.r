# # 4. faza: Analiza podatkov
# 
# podatki <- obcine %>% transmute(obcina, povrsina, gostota,
#                                 gostota.naselij=naselja/povrsina) %>%
#   left_join(povprecja, by="obcina")
# row.names(podatki) <- podatki$obcina
# podatki$obcina <- NULL
# 
# # Število skupin
# n <- 5
# skupine <- hclust(dist(scale(podatki))) %>% cutree(n)


#Ustvarjanje novih tabel
kom_tabela <- krogi5 %>% group_by(ime,priimek,stat_podatek) %>% summarise(vrednost=sum(vrednost))
#kom_tabela_vec_kot_90 <- kom_tabela %>% filter(stat_podatek == "minutes")
#povp_90 <- kom_tabela %>% 
#  group_by(ime,priimek,stat_podatek) %>% summarise(vrednost=vrednost/stat_podatek["minutes"]/90)
#salah <- filter(kom_tabela, priimek == "Salah")
#odigrane_min <- kom_tabela %>% filter(stat_podatek = minutes) %>% group_by(ime, priimek, stat_podatek) %>% summarise(vrednost=vrednost)
odigranih_90 <- filter(kom_tabela, stat_podatek == "minutes") %>% summarise(st_90 = round(vrednost/90, digits=2))
