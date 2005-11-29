class Test @@a = 0 def method1 @@a = @@a + 1 @a = @@a return @a end def 
method2 b = method1 return @a end end
