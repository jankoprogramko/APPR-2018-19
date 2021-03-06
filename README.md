# Analiza podatkov s programom R, 2018/19

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2018/19

* [![Shiny](http://mybinder.org/badge.svg)](http://beta.mybinder.org/v2/gh/jaanos/APPR-2018-19/master?urlpath=shiny/APPR-2018-19/projekt.Rmd) Shiny
* [![RStudio](http://mybinder.org/badge.svg)](http://beta.mybinder.org/v2/gh/jaanos/APPR-2018-19/master?urlpath=rstudio) RStudio

## Analiza celotne lanske sezone angleske prve nogometne lige (Premier League)

Analiza lanske sezone (2017/18) na podlagi vseh moznih podatkov iz vsake medsebojne tekme dveh ekip in o predstavah vseh igralcev na teh tekmah.

Podatke sem nasel na razlicnih spletnih straneh, ki se ukvarjajo z analizo teh podatkov za dolocanje stavniskih kvot in podatkov na voljo za igro Fantasy Premiere League. Nekateri podatki so na voljo v razlicnih oblikah (csv, json).

http://football-data.co.uk/englandm.php
https://datahub.io/sports-data/english-premier-league

Cilj je precistiti odvecene podatke in jih na koncu predstaviti in primerjati med seboj. 

Na podlagi povprecnih statistik iz vseh tekem nato le te primerjati s koncno razvrstitvijo ekipe. Rangiranje ekip glede na posest, stevilo strelov, stevio tekem brez prejetega zadetka, stevilo rumenih in rdecih kartonov,...

Koncna obravnava naj bi primerjala med seboj tudi vse igralce, pokazala najboljse igralce v dolocenih segmentih igre (npr. najvec uspesnih preigravanj, najvec strelov v okvir in izven okvirja(ucinkovitost igralcev), najvec kljucnih podaj,...) in morda pokazala kateri igralci glede na prikazane surove statistike niso pricakovano ucinkoviti.

Z povezavo tekem in igralcev dolocene ekipe dolociti najpomembnejse igralce vsake ekipe, primerjava njihovih rezultatov glede na odsotnosti teh igralcev, kako slabsa forma pomembnih igralcev vpliva na rezultate ekip.

Surovi podatki:
https://raw.githubusercontent.com/H-Cox/FPL/master/alldata.csv
https://datahub.io/sports-data/english-premier-league/r/season-1718.csv
https://pkgstore.datahub.io/sports-data/english-premier-league/season-1718_json/data/dbd8d3dc57caf91d39ffe964cf31401b/season-1718_json.json


## Program

Glavni program in poročilo se nahajata v datoteki `projekt.Rmd`.
Ko ga prevedemo, se izvedejo programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`.
Podatkovni viri so v mapi `podatki/`.
Zemljevidi v obliki SHP, ki jih program pobere,
se shranijo v mapo `../zemljevidi/` (torej izven mape projekta).

## Potrebni paketi za R

Za zagon tega vzorca je potrebno namestiti sledeče pakete za R:

* `knitr` - za izdelovanje poročila
* `rmarkdown` - za prevajanje poročila v obliki RMarkdown
* `shiny` - za prikaz spletnega vmesnika
* `DT` - za prikaz interaktivne tabele
* `rgdal` - za uvoz zemljevidov
* `rgeos` - za podporo zemljevidom
* `digest` - za zgoščevalne funkcije (uporabljajo se za shranjevanje zemljevidov)
* `readr` - za branje podatkov
* `rvest` - za pobiranje spletnih strani
* `reshape2` - za preoblikovanje podatkov v obliko *tidy data*
* `dplyr` - za delo s podatki
* `gsubfn` - za delo z nizi (čiščenje podatkov)
* `ggplot2` - za izrisovanje grafov
* `mosaic` - za pretvorbo zemljevidov v obliko za risanje z `ggplot2`
* `maptools` - za delo z zemljevidi
* `extrafont` - za pravilen prikaz šumnikov (neobvezno)

## Binder

Zgornje [povezave](#analiza-podatkov-s-programom-r-201819)
omogočajo poganjanje projekta na spletu z orodjem [Binder](https://mybinder.org/).
V ta namen je bila pripravljena slika za [Docker](https://www.docker.com/),
ki vsebuje večino paketov, ki jih boste potrebovali za svoj projekt.

Če se izkaže, da katerega od paketov, ki ji potrebujete, ni v sliki,
lahko za sprotno namestitev poskrbite tako,
da jih v datoteki [`install.R`](install.R) namestite z ukazom `install.packages`.
Te datoteke (ali ukaza `install.packages`) **ne vključujte** v svoj program -
gre samo za navodilo za Binder, katere pakete naj namesti pred poganjanjem vašega projekta.

Tako nameščanje paketov se bo izvedlo pred vsakim poganjanjem v Binderju.
Če se izkaže, da je to preveč zamudno,
lahko pripravite [lastno sliko](https://github.com/jaanos/APPR-docker) z želenimi paketi.

Če želite v Binderju delati z git,
v datoteki `gitconfig` nastavite svoje ime in priimek ter e-poštni naslov
(odkomentirajte vzorec in zamenjajte s svojimi podatki) -
ob naslednjem.zagonu bo mogoče delati commite.
Te podatke lahko nastavite tudi z `git config --global` v konzoli
(vendar bodo veljale le v trenutni seji).
