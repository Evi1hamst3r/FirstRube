true
#Energy consumption per day by household occupants.
hhOne = 7.4
hhTwoThree = 10.85
hhFour = 13.7
hhFiveMore = 16.3

day1 = 0.001 #Oldest day        #Initial values
day2 = 0.001
day3 = 0.001
day4 = 0.001
day5 = 0.001
day6 = 0.001
day7 = 0.001 #Newest day

#Celebration variables
superGreen = 0
singleOccupant = 0
doubleTripleOccupant = 0
quadrupleOccupant = 0
pentupleOccupant = 0



average = 0.001     #Starting running average value
counter = 0         #Starting counter value for dayrate, counts from this value to dayrate one first activation
weekaverage = 20    #Starting average kwh per week
dayrate = 7         #Number of days per rank calculation
score = 0           #Starting score value
scoreon = 0         #Switch to turn score on after a period of time. Set as 1 for instant switch on
cofactor = 100      #Score accentuation, magnitude
printscore = 0      #The initial altered or accentuated score to be printed

#Randomizer values
basalrate = 20
deviation = 0.1
trend = 0.025   #Positive values denote a trend towards using less power


#Instructions
print "\n"
print "\n"
print "\n"
print "\n"
print "Here is simulation of the point scoring system for gamificaiton of household power consumption.\n"
print "Please start by typing in your daily household consumption.\n"
print "Below is the average power consumption by household per day:\n"
print "1 occupant: "
print hhOne
print "\n2 or 3 occupants: "
print hhTwoThree
print "\n4 occupants: "
print hhFour
print "\n5 or more occupants: "
print hhFiveMore


def celebration
    
    print "\n.##.....##..#######...#######..########.....###....##....##"
    print "\n.##.....##.##.....##.##.....##.##.....##...##.##....##..##."
    print "\n.##.....##.##.....##.##.....##.##.....##..##...##....####.."
    print "\n.#########.##.....##.##.....##.########..##.....##....##..."
    print "\n.##.....##.##.....##.##.....##.##...##...#########....##..."
    print "\n.##.....##.##.....##.##.....##.##....##..##.....##....##..."
    print "\n.##.....##..#######...#######..##.....##.##.....##....##..."
    
end


#Engine
while true
    counter = counter +1

    sleep(0.1)

day1 = day2                                                 #Shifts running average down
    day2 = day3
    day3 = day4
    day4 = day5
    day5 = day6
    day6 = day7
    #    day7 = gets.to_f                                   #User Input alternative
    
    #Randomizer
    r = Random.new
    r.rand(-1.0...1.0)
    day7 = basalrate + (r.rand(-1.0...1.0) * deviation) - trend
    basalrate = day7                                        #Chaotic Drift alternative
    
    #Calculations for averages and score
    average = (day1 + day2 + day3 + day4 + day5 + day6 + day7)/7
    
                                                            #Two Types of Score:
score = (1.3 ** (25-average) * 10).round(2)               #Solid score, energy determinant
#if scoreon == 1 then                                        #Increase overtime score, reduction determinant
#   score = score + ((weekaverage - average)/average)
#   printscore = score * cofactor
#   print "\n"
#end

    #Counter for cushion
    if counter == dayrate then
        print "\n"
        print "counter: "
        print counter
        print "\n"
        counter = 0
        scoreon = 1
        weekaverage = (weekaverage + average)/2
    end


#Actual Bins
    if weekaverage < 5.675 then
        print "Super Green Ladder\n"
        rank = (weekaverage / 5.675 * 100).round
        
        print "Running Usage: "
        print average
        print "\nScore: "
        print printscore
        print "\nRank: "
        print rank
        if superGreen == 0 then
            superGreen = 1
            celebration
        end
            
    end

    if weekaverage > 5.675 and weekaverage < 9.125 then
        print "Single Occupant Ladder\n"
        rank = ((weekaverage - 5.675) / (9.125 - 5.675) * 100).round
        
        print "Running Usage: "
        print average
        print "\nScore: "
        print printscore
        print "\nRank: "
        print rank
        if singleOccupant == 0 and superGreen != 1 then
            singleOccupant = 1
            celebration
        end
    end

    if weekaverage > 9.125 and weekaverage < 12.275 then
        print "Double and Triple Occupant Ladder\n"
        rank = ((weekaverage - 9.125) / (12.275 - 9.125) * 100).round
        
        print "Running Usage: "
        print average
        print "\nScore: "
        print printscore
        print "\nRank: "
        print rank
        if doubleTripleOccupant == 0 and singleOccupant != 1 then
            doubleTripleOccupant = 1
            celebration
        end
    end

    if weekaverage > 12.275 and weekaverage < 15 then
        print "Quadruple Occupant Ladder\n"
        rank = ((weekaverage - 12.275) / (15 - 12.275) * 100).round
        
        print "Running Usage: "
        print average
        print "\nScore: "
        print printscore
        print "\nRank: "
        print rank
        if quadrupleOccupant == 0 and doubleTripleOccupant != 1 then
            quadrupleOccupant = 1
            celebration
        end
    end

    if weekaverage > 15 and weekaverage < 17.6 then
        print "Pentuple Occupant Ladder\n"
        rank = ((weekaverage - 15) / (17.6 - 15) * 100).round
        
        print "Running Usage: "
        print average
        print "\nScore: "
        print printscore
        print "\nRank: "
        print rank
        if pentupleOccupant == 0 and quadrupleOccupant != 1 then
            pentupleOccupant = 1
            celebration
        end
    end

    if weekaverage > 17.6 then
        print "Small BusinessLadder\n"
        rank = ((weekaverage - 17.6) / (25 - 17.6) * 100).round
        
        print "Running Usage: "
        print average
        print "\nScore: "
        print printscore
        print "\nRank: "
        print rank
    end

    print "\n"
end

#end

