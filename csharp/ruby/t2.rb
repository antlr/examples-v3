class Test
def isPrime n
  if (n < 2) return false
  end
  if (n == 2) return true 
  end
  a = 3 loop do
    if (n < a * a) return true
    end
    if (((n / a) * a) == n) 
      return false
    end
  a = a + 2
  end
end
end
