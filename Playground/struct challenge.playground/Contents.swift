
    // Define the User struct here
struct User{
   var name : String
   var email : String?
   var followers : Int
   var isActive : Bool
    
    init (name : String, email : String?, followers : Int, isActive : Bool){
        self.name = name
        self.email = email
        self.followers = followers
        self.isActive = isActive
    }
    
    func logStatus(){
        if isActive{
            print("\(name) is working hard")
        }
        else {
            print("\(name) has left earth")
        }
    }
}

    // Initialise a User struct here
    let Richard = User(name:"Richard", email:" ",followers : 0, isActive : false)
Richard.logStatus()
    

