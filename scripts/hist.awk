#/usr/bin/env awk
BEGIN{
#    bin_width=0.01;

}
{
    bin=int(($1-0.00001)/bin_width);
    if( bin in hist){
        hist[bin]+=1
    }else{
        hist[bin]=1
    }
}
END{
    for (h in hist)
#        printf " * > %2.2f  ->  %i \n", h*bin_width, hist[h]
        printf "%2.2f\t%2.2f\t%i\n", h*bin_width,(h+1)*bin_width, hist[h]
}

###https://stackoverflow.com/questions/39614454/creating-histograms-in-bash