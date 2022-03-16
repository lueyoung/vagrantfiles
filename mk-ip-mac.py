#!/usr/bin/env python

def main():
    i = 0
    ret = ""
    lst = []
    sep = ""
    ip = ""
    
    with open("./ifconfig.tmp", 'r') as f:
        content = f.readlines()
        for line in content:
            if i == 1:
                i = 0
                sep = ""
                #print(line.strip())
                tmp = line.strip().split(" ")[1].strip()
                fields = tmp.split(":")
                ret += fields[-1] + sep
                lst.append(ret)
                ip = fields[-1]
                
            if "enp0s8" in line:
                ret = ""
                i = 1
                sep = " "
                fields = line.strip().split(" ")
                #print(fields[-1])
                ret += fields[-1] + sep

    with open("./ip-mac", 'w') as f:
        sep = ""
        for line in lst:
            f.write(sep) 
            sep = "\n"
            print(line)
            fields = line.strip().split(" ")
            str = fields[-1] + " " + fields[0]
            str.replace("%", "")
            f.write(str)

    #print(ip)
    segs = ip.split(".")
    del(segs[-1])
    #print(segs)
    with open("./prefix", 'w') as f:
        f.write(".".join(segs)) 

if __name__ == "__main__":
    main()
