#!/usr/bin/python


in_filename = "pod_web_2014.01.01_01.sql"
out_filename = "UPCdata.csv"

fd = open(out_filename, 'w')

with open(in_filename, "r") as ins:
  for line in ins: 
    fields = line.split(',')
    if len(fields) > 10:
      if len(fields[0]) == 16:
        upc = fields[0].replace("(","")
        upc = upc.replace("\'","")
        upc = "0"+str(upc)
        desc= fields[8].replace(")","")
        if ('NULL' in desc):
            continue
        desc = desc.replace("\'","")
        desc = desc.replace("\"","")
        desc = desc.replace("(","")
        desc = desc.replace("[","")
        if len(desc) < 4:
            continue
        if unicode(desc, 'utf-8').isnumeric():
            continue
        #if desc.split(' ', 1)[0].isnumeric():
        #    continue
        desc = ' '.join(desc.split()[:6])
        dat = str(upc)+","+str(desc)+"\n" 
        fd.write(dat)

