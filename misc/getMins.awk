{
  dt=$3
  if(dates[dt]>=0){
    dates[dt] = dates[dt] + 1
    days[dt] = $1
    }else{
    dates[dt]= 0
  }
  }

END{
  for (i=0; i < 30; i ++){
    if (dates[i])
      printf("%s Sep %d - ( %d mins ) %d hours %d mins\n",days[i], i, dates[i], dates[i]/60, dates[i]%60)
    }
  }
