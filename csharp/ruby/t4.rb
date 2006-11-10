class Test
  def method1
    return 1
  end
end

a = Test.new
b = a.method1

class Test
def method1
  return 2
end
end

b = b + a.method1
