import subprocess

""" function to call clingo with a list of files; argument all as true indicates to return all answers for 
non-optimization problems; function returns a list of two lists: the first contains a list of answer sets, the second
optionally a list of optimization values; for optimization problems, the final element of each list is the desired one """
def call_clingo(listOfFiles,all):
    
    call = []
    call.append("clingo")
    
    for i in range(len(listOfFiles)):
        call.append(listOfFiles[i])
    if (all):
        call.append("0")
    
    pipe = subprocess.Popen(call, stdout=subprocess.PIPE)
    output = pipe.communicate()[0].decode('utf_8')
    answers = output.split('\n')
    found = False
    answerSets = []
    opts = []
    
    for i in range(len(answers)):
        
        if (found):
            found = False
            answerSets.append(answers[i])
            
        if (answers[i].split(":")[0]=="Answer"):
            found = True
            
        if (answers[i].split(":")[0]=="Optimization"):
            opts.append(answers[i].split(":")[1])
    
    answers = []
    for i in range(len(answerSets)):
        item = answerSets[i]
        elements=item.split()
        answer = []
        for j in range(len(elements)):
            answer.append(elements[j])
        answer.sort()
        answers.append(answer)
    
    replies = []
    replies.append(answers)
    replies.append(opts)
    
    return replies

""" function to call with the result of an optimization problem in clingo: converts the final result into a new file of facts """
def write_results(name,program):
    
    file = open(name,"w")
    
    for i in range(len(program[0][len(program[0])-1])):
        file.write(program[0][len(program[0])-1][i]+".\n")