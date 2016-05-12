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
- Updated `Apolemia_sp_4` to `Apolemia_lanosa`
- Updated `Clausophyes_ovata` to `Kephyes_ovata`
- Updated `Clausophyid_sp_1` to `Tottonophyes_enigmatica`


Got `new/raw_new_16s.fasta` and `new/raw_new_18s.fasta` from Lynne Christianson. `new/samples.txt` has the collection data for these new sequences. Created `new/new_16s.fasta` and `new/new_18s.fasta` from these files by:

- Removing `>Sphaeronectes_christiansonae|D557D7_18s` sequence, which doesn't have a 16S counterpart.
- Renaming T986D6 is Kephyes ovata based on Steve Haddock's photos.
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

Ran `analyses/raxml/raxml.sh`. Then:

    java -jar phyutility.jar -ls -in RAxML_bootstrap.combined > leafstability.txt

The stability, in increasing order, is:

    Physophora_hydrostatica	0.609235565
    Cordagalma_cordiforme	0.674717411
    Bargmannia_elongata	0.698062988
    Bargmannia_amoena	0.698062988
    Stephalia_dilata	0.719197225
    Stephanomia_amphytridis	0.722236912
    Erenna_sp	0.722248273
    Clausophyes_moserae_T749SS1	0.817042487
    Rosacea_flaccida	0.843847088
    Craseoa_lathetica	0.84836582
    Desmophyes_haematogaster_T854D5	0.850075192
    Praya_dubia	0.851089453
    Vogtia_pentacantha	0.853645764
    Vogtia_glabra	0.853685013
    Hippopodius_hippopus_Atlantic	0.854180782
    Hippopodius_hippopus_Pacific	0.854180782
    Nectopyramis_natans	0.854603219
    Nectadamas_diomedeae	0.855131007
    Gymnopraia_lapislazula	0.858989746
    Forskalia_formosa	0.860445036
    Forskalia_asymmetrica	0.860466726
    Forskalia_tholoides	0.860633015
    Forskalia_edwardsi_Atlantic	0.860820994
    Forskalia_edwardsi_Pacific_1	0.86082306
    Forskalia_edwardsi_Pacific_2	0.86082306
    Agalma_clausi	0.872345568
    Agalma_okeni	0.873178047
    Agalma_elegans_Pacific	0.873688277
    Agalma_elegans_Atlantic	0.873688277
    Athorybia_rosacea_Pacific	0.873795693
    Athorybia_rosacea_Atlantic	0.873795693
    Nanomia_bijuga_Atlantic	0.874177849
    Nanomia_bijuga_Pacific	0.874177849
    Halistemma_rubrum_Pacific	0.874940095
    Halistemma_rubrum_Atlantic	0.874940095
    Halistemma_rubrum_Med	0.874940095
    Tottonophyes_enigmatica_T897D4	0.883060385
    Tottonophyes_enigmatica	0.883060385
    Kephyes_ovata_T986D6	0.893871257
    Kephyes_ovata	0.896569069
    Chuniphyes_moserae_T408SS11	0.896686814
    Chuniphyes_multidentata	0.896686814
    Diphyes_dispar	0.898131776
    Chelophyes_appendiculata	0.898150367
    Abylopsis_tetragona	0.898689516
    Muggiaea_atlantica	0.900018798
    Sphaeronectes_gracilis	0.900045652
    Sphaeronectes_haddocki_D31D8	0.900045652
    Sphaeronectes_christiansonae_T987D3	0.900045652
    Lensia_conoidea	0.90024396
    Sulculeolaria_quadrivalvis_Atlantic	0.900252223
    Sulculeolaria_quadrivalvis_Pacific	0.900252223
    Staurocladia_wellingtoni	0.934522285
    Apolemia_sp_2	0.947197457
    Apolemia_sp_3	0.947197457
    Apolemia_lanosa	0.947286282
    Apolemia_sp_1	0.947286282
    Hydra	0.951386708
    Velella_velella	0.973296619
    Porpita_porpita	0.973296619
    Rhizophysa_eysenhardti	0.994826439
    Rhizophysa_filiformis	0.994826439
    Physalia_physalis	0.994826439


Created `data/combined_stab82.phy` by removing the least stable 8 taxa in `data/combined.phy`, which was a stability cutoff of 82%. This threshold was chosen in part because it got rid of the very long branch `Clausophyes_moserae_T749SS1`, which Lynne was concerned about, and everything less stable. Re-analyzed with `analyses/raxml/raxml_stab82.sh`. Then increased the threshold to 85%, which excludes `Rosacea_flaccida` and `Craseoa_lathetica`, to see if they are obscuring support for placement of Tottonophyes. They had very little impact, so best to proceed with 82% and include them.

![Combined - All taxa](./analyses/raxml/combined.png?raw=true)


![Combined - 82% leaf stability](./analyses/raxml/combined_82.svg?raw=true)


![Combined - 85% leaf stability](./analyses/raxml/combined_85.svg?raw=true)
