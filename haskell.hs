
-- assigment 1: 
--In order to calculate "power n k", for a given n and k, how many computing "steps" are being used?
--Hint: "power n 0" takes 1 step.
--"power n 1" takes 1 step, and then uses "power n 0".
--"power n 2" takes 1 step, and then uses "power n 1".
--"power n 3" takes 1 step, and then uses "power n 2".
--And so forth.
--Write your answer as a comment in the Haskell file you submit. 

power :: Integer -> Integer -> Integer 
power n k | k < 0 = error "power: negative argument"
power n 0 = 1
power n k = n * (power n (k-1))

-- assigement 1 answer: n+1 since of the funcation goes by "Hint: "power n 0" takes 1 step." so the general formula will be n+1 from this.
 

 	-- assigment 2:
power1 :: Integer-> Integer ->Integer 
--power1 takes values of Integer and uses two Intergers 
power1 n k | k < 0 = error "power : negative argument" 
--If k is less than 0 ,it prints the error message power : negative argument
           | k == 0 = 1 
-- If k is equal to zero it prints 1 
	   | otherwise = product $ replicate (fromInteger k) n 
-- If the previous statements are not true.The function product computes a proudct in all the elements in a list and multiply them into a value. The $ operator is used as a infix operator, where it applies the value from its left to its right ex:(f$x = f x). Where after replicates k uses how many times the proudct should multiply itself for n.

	--assigment 3
power2 :: Integer->Integer-> Integer 
--power 2 takes values of n and k and calulates it 
power2 n k 
	|k < 0 = error "power : negative assigment"  
--If k is less than 0 ,it prints the error message power : negative argument
	|k == 0 = 1 
-- If k is equal to zero it prints 1
	|even k = power2 (n*n) (k`div`2) 
--If k in this case is a even number ,then the following mathatical term is true. The matmatical term would be (n*n)^k/2.
	|odd k =  n * (power2 n (k-1)) 
-- If k in this case is a odd number ,then the following mathatical term is true. The matmatical term n*(n^k-1).

	--assigment 4
--a)
	-- To see if the statments are true or not we have to check for some values which are not in the Range of the two functions such as if it bettween  1 to 100.
--Might also check for the value of 0 and something which is outside the value of the list such as checking for the value of -1000.For the value of -1000 should give that the value is not the same. 
--This is then solved by ptting into a  list wher you compare the value from the first list to the other.
		
--b)
comparePower1:: Integer->Integer->Bool 
-- ComparePower1 takes values of n k as an interger and a bool which is power and power1 check.
comparePower1 n k= power n k == power1 n k 
-- the funcation of the whole statement checks the power n k and power1 n k 
comparePower2::Integer-> Integer-> Bool 
--ComparePower2 takes values of n k as an interger and a bool which is power and power1 check.
comparePower2 n k = power1 n k == power2 n k 
-- the funcations of the whole statement which checks the power1 n k and power2 n k 

--c)
testAllPowerFunctions::Bool
testAllPowerFunctions=and[comparePower1 n k == comparePower2 n k 
 | k<- [0,10..100],n<-[-100,-90..100]] 
-- testpowerfunctions takes an bool to check if the value of the two statements are the same and returns a bool 
-- The and function is the boolean fucntion that checks if the satement for function comparepower1 n k is the same for caomparePower2 n k 
-- the guard then checks if the k is between 0 to 100 and n is between the value of -100 to 100.
