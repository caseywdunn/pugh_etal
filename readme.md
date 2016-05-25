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
