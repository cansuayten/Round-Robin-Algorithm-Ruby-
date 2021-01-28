def find_time(n,burstTime,waitingTime,turnAroundTime,quantum)
  copyBurstTime = Array.new
  i=0
  t=0
  j=0
  x=0
  numOf_Turns=numOf_Turns(burstTime,quantum)
  while i<n
  copyBurstTime[i]=burstTime[i]
  i+=1
  end
  while x<numOf_Turns
    while j<n
      if copyBurstTime[j]>0
        if copyBurstTime[j]>quantum
          order(j)
          t=add(t,2)
          copyBurstTime[j]=sub(copyBurstTime[j],2)

        else
          order(j)
          t=add(t,copyBurstTime[j])
          turnAroundTime[j]=t
          copyBurstTime[j]=0
          waitingTime[j]=sub(t,burstTime[j])
        end
      end
      j+=1
    end
    j=0
    x+=1
  end 
  return waitingTime, turnAroundTime
end

def order(index)
  print ("P"+(index+1).to_s+"  ")
end


def numOf_Turns (burstTime,quantum)
  larger = burstTime.max
  x= ((larger/quantum) + (larger % quantum))
  return x
end


def add(num1,num2)
  num=num1+num2
  return num
end

def sub(num1,num2)
  num=num1-num2
  return num
end

processes = Array[1,2,3]
n= processes.length
burstTime = Array[12,7,10]
waitingTime=Array[0,0,0]
turnAroundTime=Array[0,0,0]
quantum=2
puts "Order of Processes:\n"
find_time(n,burstTime,waitingTime,turnAroundTime,quantum)
puts "\n\nProcesses\tBurst Time\tWaiting Time\tTurn Around Time   Arrival Time"
c=0
sumWt=0.0
sumTat=0.0
while c<n
  puts ("    "+processes[c].to_s+"\t\t    "+burstTime[c].to_s+"\t\t    "+waitingTime[c].to_s+"\t\t      "+turnAroundTime[c].to_s+"\t        0")
  sumWt+=waitingTime[c]
  sumTat+=turnAroundTime[c]
  c+=1
end
puts ("\nAverage waiting time: "+(sumWt/n).to_s)
puts("Average turn around time: "+(sumTat/n).to_s)


