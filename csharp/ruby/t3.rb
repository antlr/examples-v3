class A
def method
  return 1
end
end

class B
def method
  return A.new
end
end
