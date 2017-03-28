import os
import sys
import re

sge_task_id = sys.argv[1]
inp_path = sys.argv[2]
out_path = sys.argv[3]

output = []

#debug = open("./debug.txt", "a")


def detect_indel(str):
    result = str
    pt_del_all = r"([+|-])(\d+)([A-Za-z]+)"
    aa = re.findall(pt_del_all, str)
    for a in aa:
        base = ""
        for i in range(int(a[1])):
            base += a[2][i]
        
        tmp = a[0] + a[1] + base
        result = result.replace(tmp, "")

    return result





with open(inp_path+"/"+sge_task_id+".pileup", "r") as lines:
	for line in lines:
		data = line.split("\t")
		chrm = data[0]
		pos = data[1]
		ref_allele = data[2]
		depth = data[3]
		readstr = data[4]

		if int(depth) >= 10:

			#exclude in-del
			pt_del = r"[+-]"
			if re.search(pt_del, readstr):
				readstr = detect_indel(readstr)

			#find variant
			pt = r"[ATGCatgc]"
			if re.search(pt, readstr):
				all_v = re.findall(pt, readstr)
				variant = len(all_v)


				#define altenative allele (count max variant)
				cnter = {"A":0, "T":0, "G":0, "C":0}
				for r in all_v:
					r = r.upper()
					cnter[r] += 1

				alt_allele = max(cnter, key=(lambda x: cnter[x]))

				#exclude aster (pos of in-deletion)
				aster_cnt = readstr.count("*")
				readstr = readstr.replace("*","")

				if variant >= 3:
					al_ratio = float(variant)/ (int(depth) - aster_cnt)

					if al_ratio >= 0.2:
						arr = [chrm, pos, pos, ref_allele, alt_allele, depth, str(variant), str('%03.3f' % al_ratio)]
						output.append("\t".join(arr))
						#output.append(str(variant) + "\t" + str('%03.3f' % al_ratio) + "\t" + line)


	#write output file
	result_str = "\n".join(output) + "\n"
	f = open(out_path + "/" + sge_task_id + ".an", "w")
	f.write(result_str)
	f.close()



	

