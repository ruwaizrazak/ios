
struct street{
    let name : String
    var citizens : [String]
    var resources : [String : Int]
    init (name : String, citizens : [String], resources : [String : Int]) {
        self.name = name // the keyword self refers to the original structure Street
        self.citizens = citizens
        self.resources = resources
}
}
var anotherStreet = street (name:"Arakkinar", citizens : ["dev","Tom Hanks"] , resources : ["coconuts" : 100])

    anotherStreet.citizens.append("Dale Carnaghi")

print(anotherStreet)
