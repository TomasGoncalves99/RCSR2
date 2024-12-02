
import clingoUtils as c

options = []
options.append("data/leiData.txt")
options.append("data/testDates.txt")
options.append("data/prefs.txt")

answers = c.call_clingo(options,0)
c.write_results('testResult.txt',answers)