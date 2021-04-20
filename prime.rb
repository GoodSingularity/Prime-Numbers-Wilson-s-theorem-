#!/usr/bin/ruby

#Wilson's theorem states that 
#a positive integer n > 1 is a prime 
#if and only if (n-1)! == -1(mod n)

def prime(n)
    #Only integers can work here
    #If we didn't do it, We could've TypeError, it commonly occurs when trying to pass an incorrect data type to a method.
    if !(n.is_a? Integer)
        return false
    end
    
    return false if n < 2 
    #factorial modulo n == 0
    #If n = 5, then (4! +1) %n = (4*3*2*1+1) % 5 = (24+1)%5 ==> 25 %5 == 0.
    ((1..n-1).inject(&:*) + 1) % n == 0
end

#Methoe to print all prime numbers. 
#primes array holds each prime number that has been detected in range 1...limit
def print_primes(limit)
    primes = []
    if !(limit.is_a? Integer)
        return false
    end
    for i in 1...limit do 
        if(prime(i) == true)
            primes.push(i)
        end
    end
    #We want to save it somewhere, inside the same directory We launch ruby script.
    File.open('./output.txt', 'w') do |f|
        primes.each do |ch|
            f.write("#{ch}\n")
        end
    end
    return primes
end

print_primes(1000)

