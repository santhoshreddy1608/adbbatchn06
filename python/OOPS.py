class Animal():
    def sound(self):
        return "animal sound"
    
class Cat(Animal):
    def sound(self):
        return "meow"
    
class Dog():
        pass


cat= Cat()
print(cat.sound())

dog = Dog()
print(Dog)
    