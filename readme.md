# New calycophoran species

## Analysis log

Got `Dunn_10Mar05.nex` from [siphonophores_2005](https://bitbucket.org/caseywdunn/siphonophores_2005/src/df0b416a8cd136e77d5a2195b0065d73ef04656b/Dunn_10Mar05.nex) repo.

In mesquite, trimmed and exported this matrix to create:

    16s.fasta
    16s.nex
    18s.fasta
    18s.nex

In fasta files, made the following changes:

- Replaced spaces with `_`
- Updated `Clausophyid_sp_1` to `Tottonophyes_enigmatica`
- Made the name updates described in the [repository for the study](https://bitbucket.org/caseywdunn/siphonophores_2005/src/48a2cbf0399106c0b60e8f41b9ce7b22af41b80a/readme.md).

Got `new/raw_new_16s.fasta` and `new/raw_new_18s.fasta` from Lynne Christianson. `new/samples.txt` has the collection data for these new sequences. Created `new/new_16s.fasta` and `new/new_18s.fasta` from these files by:

- Removing `>Sphaeronectes_christiansonae|D557D7_18s` sequence, which doesn't have a 16S counterpart.
- Updated specimen T897D4 to `Tottonophyes_enigmatica`
- Simplified sample data (no dash, all uppercase) and replaced `|` with `_`
- Replaced Desmophyes_haematogaster sequence with that from T854D5
- Removed leading and trailing portion of `Tottonophyes_enigmatica_T897D4` 18s sequence, as they extend beyond sequences of other taxa.

Created new concatenated fastas in `data/`. Alligned with MAFFT v7.130b (2013/12/05):

    mafft 18s.fasta > 18s.aligned.fasta
    mafft 16s.fasta > 16s.aligned.fasta 

Created combined alignment with phyutility v.2.2.6:

    java -jar phyutility.jar -concat -in 16s.aligned.fasta 18s.aligned.fasta -out combined.nex

Used mesquite to generate phylip files.

Ran `analyses/raxml/raxml.sh`. 

![Combined - All taxa](./analyses/raxml/combined.png?raw=true)
All taxa, raxml ml analysis with bootstraps for 16s and 18s combined matrix.

Then ran:

    java -jar phyutility.jar -ls -in RAxML_bootstrap.combined > leafstability.txt

Sorted stability values:

    Physophora_hydrostatica 0.623093835
    Cordagalma_ordinatum    0.723451375
    Bargmannia_amoena   0.742471397
    Bargmannia_elongata 0.742471397
    Stephalia_dilata    0.771112961
    Erenna_sp   0.775094988
    Stephanomia_amphytridis 0.775644638
    Vogtia_pentacantha  0.857123036
    Vogtia_glabra   0.857123036
    Hippopodius_hippopus_Pacific    0.857464566
    Hippopodius_hippopus_Atlantic   0.857464566
    Craseoa_lathetica   0.860368639
    Rosacea_flaccida    0.861591744
    Desmophyes_haematogaster_T854D5 0.865278134
    Praya_dubia 0.87144702
    Gymnopraia_lapislazula  0.873670167
    Apolemia_sp_2   0.874517589
    Apolemia_sp_3   0.874517589
    Apolemia_sp_1   0.874596568
    Apolemia_lanosa 0.874596568
    Nectopyramis_natans 0.876422686
    Nectadamas_diomedeae    0.876766351
    Hydra   0.876922174
    Staurocladia_wellingtoni    0.876973403
    Porpita_porpita 0.87728505
    Velella_velella 0.87728505
    Physalia_physalis   0.877396047
    Rhizophysa_eysenhardtii 0.87740245
    Rhizophysa_filiformis   0.87740245
    Agalma_elegans_Atlantic 0.890665557
    Agalma_elegans_Pacific  0.890665557
    Agalma_clausi   0.892003928
    Tottonophyes_enigmatica 0.89718131
    Tottonophyes_enigmatica_T897D4  0.89718131
    Agalma_okenii   0.898180285
    Crystallophyes_amygdalina_T986D6    0.903031079
    Athorybia_rosacea_Atlantic  0.90925333
    Athorybia_rosacea_Pacific   0.90925333
    Kephyes_sp_nov_1    0.911776383
    Chuniphyes_moserae_T408SS11 0.91181694
    Chuniphyes_multidentata 0.91181694
    Chelophyes_appendiculata    0.91235485
    Diphyes_dispar  0.912513875
    Abylopsis_tetragona 0.912895961
    Muggiaea_atlantica  0.91403902
    Lensia_conoidea 0.914224727
    Sulculeolaria_quadrivalvis_Atlantic 0.914233265
    Sulculeolaria_quadrivalvis_Pacific  0.914233265
    Sphaeronectes_koellikeri    0.914655908
    Sphaeronectes_haddocki_D31D8    0.914655908
    Sphaeronectes_christiansonae_T987D3 0.914655908
    Forskalia_formosa   0.921524932
    Forskalia_asymmetrica   0.921537739
    Forskalia_tholoides 0.921744792
    Forskalia_edwardsii_Atlantic    0.921976392
    Forskalia_edwardsi_Pacific_2    0.921978526
    Forskalia_edwardsii_Pacific_1   0.921978526
    Nanomia_bijuga_Atlantic 0.981387679
    Nanomia_bijuga_Pacific  0.981387679
    Halistemma_rubrum_Pacific   0.985459358
    Halistemma_rubrum_Atlantic  0.985459358
    Halistemma_rubrum_Med   0.985459358

Created a new matrix `combined_80.phy` from which all taxa with stability lower than 80 were removed.

Ran `analyses/raxml/raxml80.sh`.  

![Combined - Stable taxa](./analyses/raxml/combined_80.png?raw=true)

Stable taxa, raxml ml analysis with bootstraps for 16s and 18s combined matrix.

Ran revbayes analyses in `analyses/revbayes`.

Combined results with:

    java -jar /Users/cdunn/Dropbox/repo/neptune2016/hydroidolina/phyutility.jar -ts -tree raxml/RAxML_bipartitions.combined_80 -in revbayes/output/gene_simple.trees -out integrated_rax_rev.tre

## Species names

Below is additional information on species names that have come to light since conducting these analyses:

- `Kephyes_sp_nov_1` is in fact `Kephyes_ovata`, based on investigation by Phil Pugh of specimen T595-D5