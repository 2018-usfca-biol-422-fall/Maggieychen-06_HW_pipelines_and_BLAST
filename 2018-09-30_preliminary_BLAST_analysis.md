Maggie Chen
ychen254@dons.usfca.edu
Sep 30, 2018

### Sequence Quality (QC check)
According to the QC report generated from the QC check, there are several common quality issues
exist for the sequence data. For all the sequence data the sequence duplication level
 and overrepresented sequence are relatively high. 
The overall GC percentages range from 47% to 57%, which is relatively consistent as a data set.
However, for all the sequence, the QC report shows that the GC content is higher than 
the theoretical distribution. High GC content indicate there are more GC pairs in the sequence 
which is connected by three hydrogen bonds, 
this might bring some hardness and inaccuracy during the sequencing, due to it is harder to 
break the GC bonding. 

Almost all samples passed the per-base quality check but there are a few sets 
of data that has worse quality than others, the running numbers are 
ERR1942293(Male palm) and ERR1942299(Male palm), which has a significantly low score. For run number 
ERR1942282 (Female Mouse) and ERR1942284 (Female Mouse), the quality was acceptable but lower than
most of other sets of data. This issue with low per base quality will directly
influence the survival rate of sequences during the trim step in the script. 
If too few sequence survives the trim, then it will be harder to get a good BLAST result. 

Overall, the quality of the whole experiment is pretty consistent, all runs passed 
the same QC parameter and didn't pass the same parameters as well. 
Even though there are several qualities shows as not in the expected range including per base sequence content, 
per sequence GC content and other two being mentioned above, 
there was a relatively high pass percentage for the trim (above 90%). Thus, the BLAST result is worth analysis. 

### Taxonomic Results from BLAST 
The BLAST result on for each running has less consistency on the patterns between human hand and mouse. 
There are several common bacteria taxa was tested through multiple samples
like *bacterium* and *Staphylococcus succinus*, *Cardiobacterium sp. feline oral taxon 346*.
For the *bacterium*, multiple types are being found, but also a lot of matches
just identified as bacterium. for all these cases, the number of matches is around 10,
this relatively low number of match might refer to a general match due to un-clear sequence. 
For *Staphylococcus succinus*,a gram-negative bacteria, it was isolated from cheese surface, 
and some human clinical settings (Place et al, 2002).But it's role in pathogenesis need to be clarified. 

There is not much pattern that can associate on human palm with its corresponding mouse bacteria community. 

For female experiment group, *Solemya pervernicosa gill symbiont* was found as 
the highest species in 3 of the samples. One for a female mouse, and two for another two different female palm example. 
*Solemya pervernicosa gill symbiont* was the species has found as the higher species in male samples as well. 
This appears in three different male's mouse sample. For this species, it was only found in 
either the palm or mouse sample, but not found on both palm and mouse for the same individual.
Quantitively, the amount of *Solemya pervernicosa gill symbiont* being found in the BLAST 
is significantly higher than other species. The approximate match number in each of 
the sample is 430, compare to average match of 20 to 100 for other species. 
*Solemya pervernicosa gill symbiont* belongs to the class Gammaproteobacteria. 
Proteobacteria is a major phylum of gram-negative bacteria, which include a wide
range of pathogens. When this is being identified in BLAST search on both human palm
and mouse, it is indicating that human hand touching and sharing mouse in classroom
can be one of the major sources of passing on diseases. 

Another commonly found match in BLAST is *Bartonella washoeensis*. This belongs 
to the genus of Bartonella, which is first isolate from dog with mitral valve endocarditis, 
then it was also found on human with cardiac disease (bruno,etc, 2018). This can also cause human disease. 
This bacteria was found on two different females mouse sample and two different male palm sample,
again, there is no match on same individual's mouse and palm samples. However, this can still be an indication of 
pets' disease or bacteria that is related to human disease can be passed on from daily lifes. Petting a sick dog or touch 
item that patients with disease and bacteria, can be then carried to class room, and pass through mouse as an intermedia.  
Interestingly, another cardio disease related bacteria was found few times in samples too, 
the *Cardiobacterium sp. feline oral taxon 346*. This is a bacteria being found on patients with various cardiac diseases. 
It is very interesting that the BLAST has identified two bacterias that are related to cardiac diseases on both human palm and mouse samples. 

The above two bacterias are the ones has most matches in each of the samples for multiple times, which include all female and male,
palm and mouse samples. This can be an indication of what are the most common bacteria on the mouse and on human handes,
that has a possibility to cause disease. 

As mentioned above, each sample's species component and the number of matches for each species are different from each other. 
Thus, it might be hard to identify and match user and mouse by bacteria community composition. 
Also, there is not a very obvious separation of the top matches between female and male samples. 
There are some finding of bacteria can very depend on individual health situations, 
for example, one sample was found with the *Cutibacterium acnes*,
which cause acne, this was found on a female mouse sample, 
but not for the palm sample. It is possible to use this information to identify users,
but there is no match with the bacteria community pattern. 

### Summary
In summary, the QC report provides a pretty good estimation of the sequence quality. 
In one way it can be an indication or a check mark for the survival rate 
on the sequence trim process. In another way, it also provides information about sequence component, 
length, duplication and overrepresentations. Using this QC reprot
information, we can make the judgment of whether to trust the BLAST result, 
if there are too many common sequences that repeated for multiple times, it can influence
the BLAST results. Regarding the BLAST result from this experiment,
there are some bacterias have a higher matching rate than others, which can be an indication of
how pathogens and diseases can be pass by using mouse. In terms of using bacteria community composition to match users,
more experiment is needed to provide a bigger sample size and more replications for further results. 
