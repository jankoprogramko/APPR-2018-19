# 2. faza: Uvoz podatkov

#sl <- locale("sl", decimal_mark=",", grouping_mark=".")

# Funkcija, ki uvozi občine iz Wikipedije
#uvozi.obcine <- function() {
#  link <- "http://sl.wikipedia.org/wiki/Seznam_ob%C4%8Din_v_Sloveniji"
#  stran <- html_session(link) %>% read_html()
#  tabela <- stran %>% html_nodes(xpath="//table[@class='wikitable sortable']") %>%
#    .[[1]] %>% html_table(dec=",")
#  for (i in 1:ncol(tabela)) {
#    if (is.character(tabela[[i]])) {
#      Encoding(tabela[[i]]) <- "UTF-8"
#    }
#  }
#  colnames(tabela) <- c("obcina", "povrsina", "prebivalci", "gostota", "naselja",
#                        "ustanovitev", "pokrajina", "regija", "odcepitev")
#  tabela$obcina <- gsub("Slovenskih", "Slov.", tabela$obcina)
#  tabela$obcina[tabela$obcina == "Kanal ob Soči"] <- "Kanal"
#  tabela$obcina[tabela$obcina == "Loški potok"] <- "Loški Potok"
#  for (col in c("povrsina", "prebivalci", "gostota", "naselja", "ustanovitev")) {
#    tabela[[col]] <- parse_number(tabela[[col]], na="-", locale=sl)
#  }
#  for (col in c("obcina", "pokrajina", "regija")) {
#    tabela[[col]] <- factor(tabela[[col]])
#  }
#  return(tabela)
#}

data <- read_csv("https://raw.githubusercontent.com/H-Cox/FPL/master/alldata.csv",
                 locale=locale(encoding="UTF-8"))

igralci <- data[, 1:60]
krogi <- data[, c(1, 61:ncol(data))] %>% melt(id.vars="id") %>%
  separate("variable", c("krog", "podatek"), ": ") %>%
  mutate(krog=parse_number(krog))
#haha kok dobr

# Zapišimo podatke v razpredelnico obcine
#obcine <- uvozi.obcine()

# Zapišimo podatke v razpredelnico druzine.
#druzine <- uvozi.druzine(levels(obcine$obcina))

# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.
